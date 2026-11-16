# Maintainer: Rafael Silva <perigoso@riseup.net>

_pkgname='bmputil'
pkgname="${_pkgname}-git"
pkgver=r643.72e1718
pkgrel=1
pkgdesc='A tool for managing and flashing Black Magic Probe firmware'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://codeberg.org/blackmagic-debug/bmputil'
license=('MIT OR Apache-2.0')
depends=('glibc' 'libgcc')
makedepends=('git' 'rust' 'cargo')
options=('!lto') # aws-lc-sys C objects built with GCC LTO cannot be linked by rust-lld
source=("git+https://codeberg.org/blackmagic-debug/bmputil.git")
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

check() {
  cd "${_pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "${_pkgname}"

  install -Dm 755 -t "${pkgdir}/usr/bin/" "target/release/${_pkgname}-cli"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
