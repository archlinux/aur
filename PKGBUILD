# Maintainer: Rafael Silva <perigoso@riseup.net>

pkgname='bmputil'
pkgver=1.0.0
pkgrel=1
pkgdesc='A tool for managing and flashing Black Magic Probe firmware'
arch=('any')
url='https://github.com/blackmagic-debug/bmputil'
license=('MIT OR Apache-2.0')
makedepends=('rust' 'cargo')
source=("https://github.com/blackmagic-debug/bmputil/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('SKIP')

prepare() {
  cd "${pkgname}-${pkgver}"
    
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

# Tests are currently failing to build
# https://github.com/blackmagic-debug/bmputil/issues/59
# check() {
#   cd "${pkgname}-${pkgver}"

#   export RUSTUP_TOOLCHAIN=stable
#   cargo test --frozen --all-features
# }

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm 755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}-cli"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
