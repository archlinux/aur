# Maintainer: traumweh <contact@traumweh.dev>

pkgname="duckypad_daemon"
pkgver=1.0.2
pkgrel=1
pkgdesc="A profile autoswitcher daemon for dekuNukem's duckypad"
arch=("x86_64")
url="https://github.com/traumweh/duckypad_daemon"
license=("Apache")
provides=("duckypad_daemon")
depends=("libusb" "duckypad-udev")
makedepends=("cargo")
source=("https://github.com/traumweh/duckypad_daemon/releases/download/$pkgver/$pkgname-$pkgver-$arch.tar.gz")
sha512sums=("fcacfafd02144d7c19fcb0569fe9afad571a382bfc2f2490063ac19151571a9a108b53c6a5a1da665808631ca2a4e519b8ac1e384033c3dabb11c4c2308d87ce")

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
