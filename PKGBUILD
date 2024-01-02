# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=rattler-build
pkgver=0.6.1
pkgrel=1
pkgdesc="A fast conda-package builder"
arch=('x86_64')
url="https://github.com/prefix-dev/rattler-build"
license=('BSD')
depends=('gcc-libs' 'openssl' 'bzip2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('217bc30aeedbef7a79064517906d88d1b0ea9e51a0f4d2df2b675912aabe7af9a4d4252780eedad29155d5b9b3591c52ed6b3bde6ac75dbd37758b33c2134d4e')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
  # mkdir -p completions/
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
  # local _completion="target/release/$pkgname --generate"
  # $_completion bash > "completions/$pkgbase"
  # $_completion fish > "completions/$pkgbase.fish"
  # $_completion zsh  > "completions/_$pkgbase"
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen -- --skip "test_host_git_source"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  # install -Dm 664 "completions/$pkgname" -t "$pkgdir/usr/share/bash-completion/completions/"
  # install -Dm 664 "completions/$pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  # install -Dm 664 "completions/_$pkgname" -t "$pkgdir/usr/share/zsh/site-functions/"
}
