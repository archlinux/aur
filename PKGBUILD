# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="thokr"
pkgver=0.5.0
pkgrel=1
pkgdesc="A sleek typing TUI with visualized results and historical logging"
arch=(
  'x86_64'
)
url="https://github.com/jrnxf/${pkgname}"
license=(
  'MIT'
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
  "${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
sha256sums=('8276dd099e54f3aa1da4c46f6c21c28375e3c8b8e8cc81193f016527c6a426f2')

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

check() {
  _source

  cd "${srcdir}/${_pkgsrc}"
  cargo test --frozen --all-features
}

package() {
  _source

  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "${CARGO_TARGET_DIR}/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
