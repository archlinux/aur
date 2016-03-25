pkgname=open-phd-guiding2-svn
_svnname=open-phd-guiding
pkgver=1778
pkgrel=1
pkgdesc="Version 2 of Open PHD Guiding, autoguiding for telescopes"
url="http://code.google.com/p/open-phd-guiding/"
arch=('i686' 'x86_64')
license=('BSD3')
depends=('wxgtk' 'v4l-utils' 'zlib' 'cfitsio' 'opencv')
makedepends=('subversion cmake')
source=("${_svnname}::svn+http://open-phd-guiding.googlecode.com/svn/trunk/")
sha1sums=('SKIP')

pkgver() {
	cd "$SRCDEST/${_svnname}"
	svnversion | tr -d [A-z]
}

prepare() {
	sed -e 's/ AND INDI_MAIN_LIBRARIES//' -i $_svnname/cmake_modules/FindINDI.cmake
	sed -e 's/ INDI_MAIN_LIBRARIES//' -i $_svnname/cmake_modules/FindINDI.cmake
	sed -e '/INDI_MAIN_LIBRARIES NAMES indimain/,+3 d' -i $_svnname/cmake_modules/FindINDI.cmake
	sed -e '/INDI_MAIN_LIBRARIES/d' -i $_svnname/cmake_modules/FindINDI.cmake

	mkdir -p build
	cd build
	cmake ../$_svnname
}

build() {
	cd build
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
