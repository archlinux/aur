# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="thokr"
pkgver=0.7.0
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
sha256sums=('3f36640bc08a1e4d5a9ca6aa87c65a1506efb8e59b9fe4ddeead37486b792e50')

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
