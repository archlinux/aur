# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=hwatch
pkgver=0.3.9
pkgrel=1
pkgdesc="A modern alternative to the watch command"
arch=('x86_64')
url="https://github.com/blacknon/hwatch"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1e9c1edb79c1a57830356641b0a2d232f15585416fd1dc8200b4ff808db118ee')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "completion/bash/$pkgname-completion.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm 644 "completion/fish/$pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm 644 "completion/zsh/_$pkgname" -t "$pkgdir/usr/share/zsh/site-functions/"
  install -Dm 644 "man/$pkgname.1" -t "$pkgdir/usr/share/man/man1"
}
