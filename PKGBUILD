# Maintainer: Vadim Gerasimov <angryvadik@gmail.com>
pkgname=media-server
pkgver=0.9.3
pkgrel=2
# Web client release to bundle. Must share the same minor version as pkgver
# (the project keeps the server and web-client minor versions in lockstep).
_webver=0.9.2
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
            'dc9ebf27be0a750db10caf62ba04668f138bd6523952ab2ac8223fa7989cab55')

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
  export CFLAGS="${CFLAGS/-O2/}"
  cargo build --frozen --release --bin media-server
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # backend binary
  install -Dm755 "target/release/media-server" "$pkgdir/usr/bin/media-server"

  # web client (prebuilt dist downloaded from the matching web-client release)
  install -d "$pkgdir/usr/share/media-server/dist"
  cp -r "$srcdir/dist/." "$pkgdir/usr/share/media-server/dist/"
  chmod -R u=rwX,go=rX "$pkgdir/usr/share/media-server/dist"

  # systemd unit + environment file
  install -Dm644 "packaging/systemd/media-server.service" \
    "$pkgdir/usr/lib/systemd/system/media-server.service"
  install -Dm644 "packaging/systemd/media-server.env" \
    "$pkgdir/etc/media-server/media-server.env"

  # sysusers.d entry creating the dedicated `media-server` user/group. pacman's
  # systemd-sysusers alpm hook processes this automatically on install.
  install -Dm644 "packaging/systemd/media-server.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/media-server.conf"

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
