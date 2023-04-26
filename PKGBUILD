# Maintainer: Rafael Silva <perigoso@riseup.net>

_pkgname='bmputil'
pkgname="${_pkgname}-git"
pkgver=r59.1c0a816
pkgrel=2
pkgdesc='A tool for flashing Black Magic Probe firmware '
arch=('x86_64')
url='https://black-magic.org'
conflicts=("${_pkgname}")
provides=("${_pkgname}")
license=('None')
makedepends=('rust' 'cargo')
source=("git+https://github.com/blackmagic-debug/bmputil.git")
sha512sums=('SKIP')

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
}
