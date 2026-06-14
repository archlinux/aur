# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="code2prompt"
pkgver=4.3.0
pkgrel=1
pkgdesc="CLI tool to convert your codebase into a single LLM prompt"
arch=(
  'x86_64'
)
url="https://code2prompt.dev"
_url="https://github.com/mufeedvh/${pkgname}"
license=(
  'MIT'
)
depends=(
  'glibc'
  'libgcc'
  'zlib'
)
makedepends=(
  'cargo'
)
_pkgsrc="${pkgname}-${pkgver}"
source=(
  # "${_url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
  "https://static.crates.io/crates/${pkgname}/${_pkgsrc}.crate"
)
sha256sums=('990ebe1d34dec07580dd23e4097423989f0bd6c8d4f4de9d47c0ae77a0c2c732')

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
  export CFLAGS+=" -ffat-lto-objects"
  
  cd "${srcdir}/${_pkgsrc}"
  cargo build --frozen --release --all-features
}

check() {
  _source

  cd "${srcdir}/${_pkgsrc}"
  cargo test --frozen --all-features
}

package() {
  _source

  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "${CARGO_TARGET_DIR}/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  # install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
