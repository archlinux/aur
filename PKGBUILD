# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="asm-processor"
pkgver=1.0.1
pkgrel=2
pkgdesc="Pre-process .c files and post-process .o files to enable embedding MIPS assembly into IDO-compiled C"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/simonlindholm/${pkgname}"
license=(
  'Unlicense'
)
depends=(
  'glibc'
  'libgcc'
)
makedepends=(
  'cargo'
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/${pkgver}/${_pkgsrc}.tar.gz"
)
b2sums=('9f1427e046e60dcda29679af0ccf1b9cabcb06db0e28eacbffc45f4f6a55aba785883b3d8b1295cbf41305ddbd81cdd6ef0bb7856369a048eb7260bd534ac86d')

_source() {
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target
  export RUSTUP_TOOLCHAIN=stable
}

prepare() {
  _source

  cd "${srcdir}/${_pkgsrc}/rust"
  cargo fetch --locked --target host-tuple
}

build() {
  _source

  cd "${srcdir}/${_pkgsrc}/rust"
  cargo build --frozen --release --all-features
}

# check() {
#   _source

#   cd "${srcdir}/${_pkgsrc}/rust"
#   cargo test --frozen --all-features
# }

package() {
  _source

  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "rust"
  install -vDm755 "${CARGO_TARGET_DIR}/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
