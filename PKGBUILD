# Maintainer: Rafael Silva <perigoso@riseup.net>

_pkgname='bmputil'
pkgname="${_pkgname}-git"
pkgver=r404.66efc79
pkgrel=1
pkgdesc='A tool for managing and flashing Black Magic Probe firmware'
arch=('any')
url='https://github.com/blackmagic-debug/bmputil'
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
  # No '--locked' flag because this is a git package, it might *need* to be updated
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

# Tests are failing to build on latest upstream
# check() {
#   cd "${_pkgname}"

#   export RUSTUP_TOOLCHAIN=stable
#   cargo test --frozen --all-features
# }

package() {
  cd "${_pkgname}"

  install -Dm 755 -t "${pkgdir}/usr/bin/" "target/release/${_pkgname}-cli"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm 644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
}
