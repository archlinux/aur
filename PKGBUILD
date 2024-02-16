# Maintainer: phanium <$(echo bnhoc2R1QHFxLmNvbQo= | base64 -d)>

_pkgname=rvasm
pkgname=${_pkgname}-git
pkgver=r19.b38f1a6
pkgrel=1
pkgdesc="A risc-v assembler in rust"
arch=('x86_64')
url="https://github.com/eigenraven/rvasm"
license=('Apache')
makedepends=('cargo' 'git')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')
conflicts=('rvasm')
provides=('rvasm')

pkgver() {
  cd "${pkgname}"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}
prepare() {
  cd "${srcdir}/${pkgname}"
  export RUSTUP_TOOLCHAIN=nightly
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${pkgname}"
  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features --target "$CARCH-unknown-linux-gnu"
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/$CARCH-unknown-linux-gnu/release/$_pkgname"
}
