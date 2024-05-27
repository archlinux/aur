# Maintainer:‌  dreieck          (https://aur.archlinux.org/account/dreieck)
# Contributor: Daniel Menelkir  (https://aur.archlinux.org/account/Menelkir)

_pkgname=raplcap
pkgname="${_pkgname}"
pkgver=0.9.1
pkgrel=1
pkgdesc="RAPL power capping C interface with multiple implementations."
arch=('x86_64')
url="https://github.com/powercap/raplcap"
license=('BSD-3-Clause')
depends=(
  'glibc'
  'powercap'
)
makedepends=(
  'cmake'
)
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/powercap/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
  'bf832e304da1c083770339cd149c5c08ca35fab3369ed2ecbcd6be6590950b95'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p _build
  cd _build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DRAPLCAP_CONFIGURE_MSR_EXTRA=ON \
    ..
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cd _build
  make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cd _build
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}/${pkgname}-${pkgver}"
  for _docfile in AUTHORS README.md RELEASES.md; do 
    install -Dvm644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -Dvm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}
