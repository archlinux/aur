# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=hwatch
pkgver=0.3.16
pkgrel=1
pkgdesc="A modern alternative to the watch command"
arch=('x86_64')
url="https://github.com/blacknon/hwatch"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0026bf677dd5b6a0c0160e537c6638902917e26aec2265bd0144a6e0f6d78e56')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
