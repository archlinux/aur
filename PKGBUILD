# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="teller"
pkgver=2.0.7
pkgrel=2
pkgdesc="Cloud native secrets management for developers - never leave your command line for secrets"
arch=(
  'x86_64'
)
url="https://github.com/tellerops/${pkgname}"
license=(
  'Apache-2.0'
)
depends=(
  'glibc' 
  'libgcc'
  'openssl'
)
makedepends=(
  'cargo'
)
options=(
  '!lto'
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
sha256sums=('1d4275ede4366a31efc94039c58da4cec87466d09cc01444c3c18e9432716d23')

_source() {
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target
  export RUSTUP_TOOLCHAIN=stable
}

prepare() {
  _source

  cd "${srcdir}/${_pkgsrc}"
  cargo fetch --locked --target host-tuple
}

build() {
  _source

  cd "${srcdir}/${_pkgsrc}"
  cargo build --frozen --release --all-features
}

# check() {
#   _source

#   cd "${srcdir}/${_pkgsrc}"
#   cargo test --frozen --all-features
# }

package() {
  _source

  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "${CARGO_TARGET_DIR}/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
