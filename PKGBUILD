# Please report issues with the package on GitHub or in the comments
# Maintainer: Lunush

pkgname=rates
_pkgver="$(curl --silent "https://api.github.com/repos/lunush/rates/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')"
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Currency exchange rates in your terminal"
arch=("x86_64")
url="https://github.com/lunush/rates"
license=("Apache-2.0")
depends=()
makedepends=("git" "rust")
provides=("rates")
conflicts=("rates" "rates-bin" "rates-git")
source=("https://github.com/lunush/rates/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("SKIP")

prepare() {
  tar xzf "${pkgver}.tar.gz" --directory=$PWD
}

pkgver() {
  echo $_pkgver
}

build() {
  cd "$pkgname-$pkgver"
  export SHELL_COMPLETIONS_DIR="$PWD/completions"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/rates" "$pkgdir/usr/bin/rates"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
