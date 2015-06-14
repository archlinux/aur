# Maintainer: Luis Sarmiento < lgsarmientop-ala-unal.edu.co >
# Contributor: Sebastian Voecking <voeck-ala-web.de>

pkgname=clhep
_pkgname=CLHEP
pkgver=2.2.0.4
pkgrel=1
pkgdesc='A Class library for High Energy Physics'
url="http://proj-clhep.web.cern.ch/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('bash' 'gcc-libs')
options=('!emptydirs')
makedepends=('cmake'         #for building the package
	     'texlive-core') #for the documentation
source=("http://proj-clhep.web.cern.ch/proj-clhep/DISTRIBUTION/tarFiles/${pkgname}-${pkgver}.tgz")
md5sums=('71d2c7c2e39d86a0262e555148de01c1')

build() {
	msg 'Creating building directory'
	[ -d ${srcdir}/build ] && rm -rf ${srcdir}/build
	mkdir ${srcdir}/build
	cd ${srcdir}/build

	msg 'Compiling the package'
  	cmake -DCLHEP_BUILD_DOCS=ON \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      ${srcdir}/${pkgver}/${_pkgname}
	make -j1 || return 1
}

package() {
	  msg 'Creating the package'
	  cd ${srcdir}/build
	  make DESTDIR="${pkgdir}" install
	  install -Dm644 ${srcdir}/${pkgver}/${_pkgname}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

	  msg 'Moving documentation to standard location'
	  [ -d ${pkgdir}/usr/share/doc/${pkgname} ] || install -d ${pkgdir}/usr/share/doc/${pkgname}
	  mv ${pkgdir}/usr/doc/* ${pkgdir}/usr/share/doc/${pkgname}/

}
