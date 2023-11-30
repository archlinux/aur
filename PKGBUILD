# Maintainer: traumweh <contact@traumweh.dev>

pkgname="duckypad_daemon"
pkgver=1.0.3
pkgrel=1
pkgdesc="A profile autoswitcher daemon for dekuNukem's duckypad"
arch=("x86_64")
url="https://github.com/traumweh/duckypad_daemon"
license=("GPL-3-or-later")
depends=("libusb" "duckypad-udev")
makedepends=("cargo")
source=("https://github.com/traumweh/duckypad_daemon/releases/download/$pkgver/$pkgname-$pkgver-$arch.tar.gz")
sha512sums=("343a7f61d6a6f956b6e62c6662bcac305632d8b59eb88b0de591040903cc3e081ac18e7416abdfa83276e017abab74ca5b76e794cb971aaeeaa74f2754db37fe")

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
