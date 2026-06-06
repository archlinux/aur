# Maintainer: Vadim Gerasimov <angryvadik@gmail.com>
pkgname=media-server
pkgver=0.7.0
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
source=(
  "$pkgname-$pkgver::git+https://github.com/dog4ik/media-server.git#tag=v$pkgver"
  "media-server-web-$_webver-dist.tar.gz::https://github.com/dog4ik/media-server-web/releases/download/v$_webver/dist.tar.gz"
)
# Replace the second SKIP with the real checksum: `updpkgsums`.
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  # Build against the committed .sqlx query cache: no sqlx-cli or database needed.
  export SQLX_OFFLINE=true
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
