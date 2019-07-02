# Maintainer: Luis Sarmiento < lgsarmientop-ala-unal.edu.co >
# Contributor: Sebastian Voecking <voeck-ala-web.de>

pkgname=clhep
_pkgname=CLHEP
pkgver=2.4.1.2
pkgrel=2
pkgdesc='A Class library for High Energy Physics'
url="http://proj-clhep.web.cern.ch/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('bash')
options=('!emptydirs' 'staticlibs')
makedepends=('cmake'         #for building the package
	     'texlive-core') #for the documentation
source=(http://proj-clhep.web.cern.ch/proj-clhep/dist1/${pkgname}-${pkgver}.tgz)
sha256sums=('ff96e7282254164380460bc8cf2dff2b58944084eadcd872b5661eb5a33fa4b8')

build() {

  msg 'Creating building directory'
  [ -d ${srcdir}/build ] && rm -rf ${srcdir}/build
  mkdir ${srcdir}/build
  cd ${srcdir}/build

  msg 'Compiling the package'
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCLHEP_BUILD_DOCS=ON \
    ${srcdir}/${pkgver}/${_pkgname}
  make || return 1
}

check() {

  cd ${srcdir}/build
  make test

}

package() {

  msg 'Creating the package'
  cd ${srcdir}/build
  make DESTDIR="${pkgdir}" install
  install -Dm644 ${srcdir}/${pkgver}/${_pkgname}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

}
