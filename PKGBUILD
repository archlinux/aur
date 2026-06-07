# Maintainer: Vadim Gerasimov <angryvadik@gmail.com>
pkgname=media-server
pkgver=0.7.1
pkgrel=1
# Web client release to bundle. Must share the same minor version as pkgver
# (the project keeps the server and web-client minor versions in lockstep).
_webver=0.7.2
pkgdesc="Self-hosted media server"
arch=('x86_64')
url="https://github.com/dog4ik/media-server"
license=('GPL-3.0-or-later')
depends=('ffmpeg' 'openssl' 'systemd')
makedepends=('cargo' 'git')
install="$pkgname.install"
backup=('etc/media-server/media-server.env')
source=(
  "$pkgname-$pkgver::git+https://github.com/dog4ik/media-server.git#tag=v$pkgver"
  "media-server-web-$_webver-dist.tar.gz::https://github.com/dog4ik/media-server-web/releases/download/v$_webver/dist.tar.gz"
)
# git source uses SKIP (tag-pinned); tarball pins a real checksum (`updpkgsums`).
sha256sums=('SKIP'
            'ea7c0ca491df6d9af73218dab9a65098d2f9de23ab1a0f451f98e2766d8314f7')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  export SQLX_OFFLINE=true
  # disable LTO so the linking succeeds
  export CFLAGS+=" -ffat-lto-objects"
  cargo build --frozen --release --bin media-server
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # backend binary
  install -Dm755 "target/release/media-server" "$pkgdir/usr/bin/media-server"

  # web client (prebuilt dist downloaded from the matching web-client release)
  install -d "$pkgdir/usr/share/media-server/dist"
  cp -a "$srcdir/dist/." "$pkgdir/usr/share/media-server/dist/"

  # systemd unit + environment file
  install -Dm644 "packaging/systemd/media-server.service" \
    "$pkgdir/usr/lib/systemd/system/media-server.service"
  install -Dm644 "packaging/systemd/media-server.env" \
    "$pkgdir/etc/media-server/media-server.env"

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
