# Maintainer: traumweh <contact@traumweh.dev>

pkgname="duckypad_daemon"
pkgver=1.0.1
pkgrel=2
pkgdesc="A profile autoswitcher daemon for dekuNukem's duckypad"
arch=("x86_64")
url="https://github.com/traumweh/duckypad_daemon"
license=("Apache")
provides=("duckypad_daemon")
depends=("libusb" "duckypad-udev")
makedepends=("cargo")
source=("https://github.com/traumweh/duckypad_daemon/releases/download/$pkgver/$pkgname-$pkgver-$arch.tar.gz")
sha512sums=("062886826e67ba02b68b1703156af8a61731a744429a21c6edc8a20a801f5aba7801ae7ccba73f71366f2f2384d03575ac754793c0020de3fd28645bc5370498")

prepare() {
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}
build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
  gzip manpage
}
package() {
  install -Dm0755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 manpage.gz "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
}
