# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="opa-psm2"
pkgver=12.0.1
pkgrel=1
pkgdesc="Omni-Path Performance Scaled Messaging 2 (PSM2) library"
arch=('i686' 'x86_64')
url="https://github.com/cornelisnetworks/${pkgname}"
license=('BSD-3-Clause')
depends=('glibc' 'sh' 'numactl')
provides=('libpsm2.so')
_pkgsrc="${url##*/}-PSM2_${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/PSM2_${pkgver}.tar.gz")
b2sums=('c240c301873269656e49e382dd744169861b68cd55634ae9f9fc7d293009009862fe1ad2b8b23a1080c67f928d19688b169e9ecbee0a0fdcf38fa995f92c874c')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  # shellcheck disable=SC2016
  sed -i 's/-j $(nthreads)//g' 'Makefile'
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" LIBDIR="/usr/lib" LIBPSM2_COMPAT_CONF_DIR="/usr/lib" install

  install -vDm644 "README"  "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
