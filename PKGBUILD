# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=a-gpt-git
_pkgname=a
pkgver=r58.dece782
pkgrel=1
pkgdesc="A CLI tool to generate code from GPT3 (git)"
arch=('x86_64')
url="https://github.com/ddddddeon/a"
license=('MIT')
depends=('libxcb' 'libxkbcommon')
makedepends=('cargo' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}")
sha512sums=('SKIP')
options=('!lto')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "${_pkgname}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

check() {
  cd "${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --bins
}

package() {
  cd "${_pkgname}"
  install -Dm 755 "target/release/${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
