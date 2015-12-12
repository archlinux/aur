# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_libname=PythonQt
_pkgname=pythonqt
pkgname=${_pkgname}-qt5
pkgver=3.0
pkgrel=1
pkgdesc='A dynamic Python binding for the Qt framework to embed Python code into C++ Qt applications. Qt5 lib.'
arch=('i686' 'x86_64')
url='http://pythonqt.sourceforge.net/'
license=('GPL2')

depends=('python' 'qt5-multimedia' 'qt5-svg' 'qt5-webkit')
makedepends=('git' 'qt5-tools')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" 'qt5-python27-git')

source=(
	"http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}/${_libname}-${pkgver}/${_libname}${pkgver}.zip"
	'build_fix.patch'
)
sha512sums=(
	'8e2a964fcf4f73ddea46f7dc2bf67de97d2e161a2ab7d5c30d9db4b36fdc2295276845649d7bc99b085bc9c71d1fc9bb934833a2f0b1e5b0ef793cb8b4aa95b3'
	'92b650977c7c12c19439f59af6673af0551afcd309c8996f8b68b01f564cc6a990e1218978d786765630c61c48a0c241428da8cbd8b230f74027a183ed9b7302'
)

prepare() {
	# Fix Python library path, out-of-source build
	# and disable test and example builds
	cd ${srcdir}/${_libname}${pkgver}
	patch -p1 < ../build_fix.patch
	
	# Create build directory
	mkdir -p ${srcdir}/build
}

build() {
	# Building package
	cd ${srcdir}/build
	qmake-qt5 ../${_libname}${pkgver} \
		CONFIG+=release \
		CONFIG+=c++14 \
		-spec linux-g++
	make -j6
}

package() {
	# Untill I find another way to make an out-of-source build
	# without breaking the "make install" command or the CmakeLists.txt
	# supports Qt 5 builds, I'll install the files manually :/
	# make INSTALL_ROOT=${pkgdir} install
	cd ${srcdir}/build
	
	# Includes
	mkdir -p ${pkgdir}/usr/include/${_libname}/{gui,extensions/PythonQt_QtAll}
	cp ../${_libname}${pkgver}/src/*.h ${pkgdir}/usr/include/${_libname}
	cp ../${_libname}${pkgver}/src/gui/*.h ${pkgdir}/usr/include/${_libname}/gui
	cp ../${_libname}${pkgver}/extensions/PythonQt_QtAll/*.h ${pkgdir}/usr/include/${_libname}/extensions/PythonQt_QtAll
	
	# Library
	cp -Rd lib ${pkgdir}/usr
}