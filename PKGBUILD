# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="code2prompt"
pkgver=4.2.0
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
  'gcc-libs'
  'glibc'
  'zlib'
)
makedepends=(
  'cargo'
)
_pkgsrc="${pkgname}-${pkgver}"
source=(
  # "${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz"
  "https://static.crates.io/crates/${pkgname}/${_pkgsrc}.crate"
)
sha256sums=('e6b5b194027bfc72f356ecb5d80773bfbe558e5e786384123cf5bf12388cadd5')

_source() {
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target
  export RUSTUP_TOOLCHAIN=stable
}

prepare() {
  _source

  cd "${srcdir}/${_pkgsrc}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  # install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
