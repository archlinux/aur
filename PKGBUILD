# Maintainer: Rafael Silva <perigoso@riseup.net>

_pkgname='bmputil'
pkgname="${_pkgname}-git"
pkgver=r83.e197489
pkgrel=1
pkgdesc='A management utility for debuggers running the Black Magic Debug firmware'
arch=('any')
url='https://github.com/blackmagic-debug/bmputil'
conflicts=("${_pkgname}")
provides=("${_pkgname}")
license=('MIT OR Apache-2.0')
makedepends=('git' 'rust' 'cargo')
source=("git+https://github.com/blackmagic-debug/bmputil.git")
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${_pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --no-default-features
}

# No tests implemented
# check() {
#   cd "${_pkgname}"

#   export RUSTUP_TOOLCHAIN=stable
#   cargo test --frozen --no-default-features
# }

package() {
  cd "${_pkgname}"

  install -Dm 755 -t "${pkgdir}/usr/bin/" "target/release/${_pkgname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm 644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
}
