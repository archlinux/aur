# Maintainer: Luis Sarmiento < lgsarmientop-ala-unal.edu.co >
# Contributor: Sebastian Voecking <voeck-ala-web.de>

pkgname=clhep
_pkgname=CLHEP
pkgver=2.3.4.4
pkgrel=1
pkgdesc='A Class library for High Energy Physics'
url="http://proj-clhep.web.cern.ch/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('bash')
options=('!emptydirs')
makedepends=('cmake'         #for building the package
	     'texlive-core') #for the documentation
source=("http://proj-clhep.web.cern.ch/proj-clhep/DISTRIBUTION/tarFiles/${pkgname}-${pkgver}.tgz")
md5sums=('8b8a33d0d19213b60d6c22ce5fc93761')

build() {

	msg 'Creating building directory'
	[ -d ${srcdir}/build ] && rm -rf ${srcdir}/build
	mkdir ${srcdir}/build
	cd ${srcdir}/build

	msg 'Compiling the package'
  	cmake \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_BUILD_TYPE=Release \
            -DCLHEP_BUILD_DOCS=OFF \
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

	  #msg 'Moving documentation to standard location'
	  #[ -d ${pkgdir}/usr/share/doc/${pkgname} ] || install -d ${pkgdir}/usr/share/doc/${pkgname}
	  #mv ${pkgdir}/usr/doc/* ${pkgdir}/usr/share/doc/${pkgname}/

}
