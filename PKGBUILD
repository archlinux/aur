# Maintainer: John Mylchreest <jmylchreest@gmail.com>
pkgname=clipferry
pkgver=0.0.1
pkgrel=1
pkgdesc="Lazy X11 <-> Wayland clipboard bridge for xwayland-satellite setups"
arch=(x86_64 aarch64)
url="https://github.com/jmylchreest/clipferry"
license=(MIT)
depends=(gcc-libs)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('16899b657131e22189aa44c7988375373122cc9f29e8374d4fef0f8491acfbd1')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/clipferry "$pkgdir/usr/bin/clipferry"
  install -Dm644 contrib/clipferry.service "$pkgdir/usr/lib/systemd/user/clipferry.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
