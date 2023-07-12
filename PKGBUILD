# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=static-web-server
pkgver=2.20.0
pkgrel=1
pkgdesc="A cross-platform, high-performance and asynchronous web server for static files-serving"
arch=('i686' 'x86_64')
url="https://static-web-server.net/"
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('rust')
backup=('etc/default/static-web-server')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/static-web-server/static-web-server/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e4b01785086c055cdfafa475b1a0e18c9d47ded3a5ee0bf3b708bb39fd905e5f')


prepare() {
  cd "$pkgname-$pkgver"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

check() {
  cd "$pkgname-$pkgver"

  #cargo test \
  #  --frozen
}

package() {
  cd "$pkgname-$pkgver"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  install -Dm644 "systemd/etc_default_static-web-server" "$pkgdir/etc/default/static-web-server"
  install -Dm644 systemd/static-web-server.{service,socket} -t "$pkgdir/usr/lib/systemd/system"

  install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/static-web-server"
}
