# Please report issues with the package on GitHub or in the comments
# Maintainer: Lunush

pkgname=rates-git
pkgver=latest
pkgrel=1
pkgdesc="Currency exchange rates in your terminal"
arch=("arm" "i686" "x86_64")
url="https://github.com/lunush/rates"
license=("Apache-2.0")
depends=()
makedepends=("git" "rust")
provides=("rates")
conflicts=("rates")
source=("$pkgname::git+$url")
sha256sums=("SKIP")

pkgver() {
  cd "$pkgname"
  echo "$(grep '^version =' Cargo.toml | head -n1 | cut -d\" -f2).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)" | tr '-' '.'
}

build() {
  cd "$pkgname"
  export SHELL_COMPLETIONS_DIR="$PWD/completions"
  cargo build --release --locked
}

check() {
  cd "$pkgname"
  cargo test --release --locked
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/rates" "$pkgdir/usr/bin/rates"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CONTRIBUTING.md "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTING.md"
}
