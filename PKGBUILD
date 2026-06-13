# Maintainer: Gilwiljam <gillbilljam@gmail.com>
# Contributor: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=quickenv
pkgver=0.5.0
pkgrel=1
pkgdesc='An unintrusive environment manager'
arch=('x86_64')
url="https://codeberg.org/untitaker/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('8bcd4d9c940958fc7c1d2bc95ecf8d62d2dfd1943078f613f89f8ad637bf2515')
makedepends=('cargo')
depends=('glibc' 'gcc-libs')
optdepends=('direnv: direnv stdlib integration')

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$pkgname"
  cargo build --release --frozen
}

# tests failing with
# Error: cannot find binary path
# check() {
#   export RUSTUP_TOOLCHAIN=stable
#   export CARGO_TARGET_DIR=target
#   cd "$pkgname"
#   cargo test --release --frozen
# }

package() {
  cd "$pkgname"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
