# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="code2prompt"
pkgver=4.0.2
pkgrel=1
pkgdesc="CLI tool to convert your codebase into a single LLM prompt"
arch=('x86_64')
url="https://code2prompt.dev"
_url="https://github.com/mufeedvh/${pkgname}"
license=('MIT')
depends=('gcc-libs' 'glibc' 'zlib')
makedepends=('cargo')
_pkgsrc="${pkgname}-${pkgver}"
# source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
source=("${_pkgsrc}.crate::https://static.crates.io/crates/${pkgname}/${_pkgsrc}.crate")
sha256sums=('f936a95ba3f47bf445624b7ed620bcbcddf0dcddf49dbb9549bb54bd87e41dd4')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export CFLAGS+=" -ffat-lto-objects"
  
  cd "${srcdir}/${_pkgsrc}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  # install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  # install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
