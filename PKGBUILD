# Maintainer: Rafael Silva <perigoso@riseup.net>

pkgname='bmputil'
pkgver=1.2.0
pkgrel=1
pkgdesc='A tool for managing and flashing Black Magic Probe firmware'
arch=('any')
url='https://codeberg.org/blackmagic-debug/bmputil'
license=('MIT OR Apache-2.0')
makedepends=('rust' 'cargo')
options=('!lto') # aws-lc-sys C objects built with GCC LTO cannot be linked by rust-lld
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/blackmagic-debug/bmputil/archive/v${pkgver}.tar.gz")
b2sums=('9d5f1bd52e1e65f53c0af1d8cfdd7042030ab58cbcedb7f0205db0c03b2e61d0c4401f12e59e44d18692356a5cc45586c71f0117a7ca2c821f0960971888cc4c')

prepare() {
  cd "${pkgname}"
    
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "${pkgname}"

  install -Dm 755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}-cli"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
