# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=release-plz
pkgver=0.2.53
pkgrel=1
pkgdesc="Release Rust packages without using the command line"
arch=('x86_64')
url="https://github.com/MarcoIeni/release-plz"
license=('MIT' 'Apache')
depends=('gcc-libs' 'curl')
checkdepends=('git')
makedepends=('cargo')
optdepends=('cargo-semver-checks: check for API breaking changes')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-v$pkgver.tar.gz")
sha512sums=('c549930668cb079736f5e535a2ae8fc7353667fc375c27682b77d2aacc76b3abdd33ddc9f73e32c0bb5132d28a0d91b08a9f1f452248b5c426d991206ffa9493')
options=('!lto')

prepare() {
  mv "$pkgname-$pkgname-v$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
  mkdir completions
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
  local compgen="target/release/$pkgname generate-completions"
  $compgen bash > "completions/$pkgname"
  $compgen fish > "completions/$pkgname.fish"
  $compgen zsh  > "completions/_$pkgname"
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "completions/$pkgname" -t "$pkgdir/usr/share/bash-completion/completions/"
  install -Dm 644 "completions/$pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm 644 "completions/_$pkgname" -t "$pkgdir/usr/share/zsh/site-functions/"
}
