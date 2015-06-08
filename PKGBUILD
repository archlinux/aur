# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: lynix <lynix47@googlemail.com>
# Contributor: justinzane <justin@justinzane.com>

pkgname=ompp
pkgver=0.8.5
pkgrel=3
pkgdesc="Profiling tool for OpenMP applications"
arch=('i686' 'x86_64')
url='http://www.ompp-tool.com/'
license=('GPL2')
depends=('bash' 'papi')
source=("http://projekt17.pub.lab.nm.ifi.lmu.de/ompp/downloads/${pkgname}-${pkgver}.tgz")
sha256sums=('6164d9673df15536f8d9f0a4d50bf039066f6140b740df4c7d0ba1fa095bd8b5')
options=(staticlibs libtool !strip)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make OMPCC=gcc OMPFLAG=-fopenmp \
    PAPI_LIBRARY=/usr/lib/libpapi.so PAPI_INCLUDE=/usr/include \
    INSTDIR="${pkgdir}/usr" \
    DOCDIR="${pkgdir}/usr/share/doc/${pkgname}" \
    TESTDIR="${pkgdir}/usr/share/doc/${pkgname}/examples/"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make OMPCC=gcc OMPFLAG=-fopenmp \
    PAPI_LIBRARY=/usr/lib/libpapi.so PAPI_INCLUDE=/usr/include \
    INSTDIR="${pkgdir}/usr" \
    DOCDIR="${pkgdir}/usr/share/doc/${pkgname}" \
    TESTDIR="${pkgdir}/usr/share/doc/${pkgname}/examples/" \
    install

  # Fix permissions
  chmod 755 "${pkgdir}/usr/share/doc/${pkgname}/examples/"
  chmod 644 "${pkgdir}/usr/share/doc/${pkgname}/examples/c_simple/c_simple.c"
  chmod 644 "${pkgdir}/usr/share/doc/${pkgname}/examples/f_simple/f_simple.f"

  # Change opari name to avoid conflicts with the one of openmpi
  mv "${pkgdir}/usr/bin/opari" "${pkgdir}/usr/bin/opari-ompp"
  sed -i "s/\/opari/\/opari-ompp/g" "${pkgdir}/usr/bin/kinst-ompp"
  sed -i "s/\/opari/\/opari-ompp/g" "${pkgdir}/usr/bin/kinst-ompp-papi"

  # Fix reference to $pkgdir
  sed -i -e "s%${pkgdir}%%" "${pkgdir}/usr/bin/kinst-ompp"
  sed -i -e "s%${pkgdir}%%" "${pkgdir}/usr/bin/kinst-ompp-papi"
}

# vim:set ts=2 sw=2 et:
