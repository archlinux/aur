# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_libname=PythonQt
_pkgname=pythonqt
pkgname=${_pkgname}-qt5
pkgver=3.1
pkgrel=1
pkgdesc='A dynamic Python binding for the Qt framework to embed Python code into C++ Qt applications. Qt5 lib.'
arch=('i686' 'x86_64')
url='http://pythonqt.sourceforge.net/'
license=('LGPL2.1')

depends=('python' 'qt5-multimedia' 'qt5-svg' 'qt5-webkit')
makedepends=('git' 'qt5-tools')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" 'qt5-python27-git')

source=(
	"http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}/${_libname}-${pkgver}/${_libname}${pkgver}.zip"
	'fix_build.patch'
)
sha512sums=(
	'b3c208e3f909ebb15d40a6e83385f03e6196a8439e39cad4f924e7b1e774edbce83680298ab032161619d1358696a0d073028860f68540aadd8028b712ae8fc1'
	'fcd97c52aac593cc065016650dd20c0f0012b17b2128f2e8c2994a354035816ae041652967f473e4f4dd815c53e775c63d8ba6f86bf05d2bc294d0e456e7eb69'
)

prepare() {
	# Fix Python library path, out-of-source build,
	# disable test and example builds and syntax error
	cd "${srcdir}"/${_libname}${pkgver}
	patch -Np1 < ../fix_build.patch

	# Create build directory
	mkdir -p "${srcdir}"/build
}

build() {
	# Building package
	cd "${srcdir}"/build
	qmake-qt5 ../${_libname}${pkgver} \
		QMAKE_CFLAGS="${CFLAGS}" \
		QMAKE_CXXFLAGS="${CXXFLAGS}" \
		CONFIG+=release \
		CONFIG+=c++14
	make
}

package() {
	cd "${srcdir}"/build

	# Make install doesn't seems to do anything
	# make INSTALL_ROOT="${pkgdir}" install

	# Includes
	mkdir -p "${pkgdir}"/usr/include/${_libname}/{gui,extensions/PythonQt_QtAll}
	cp ../${_libname}${pkgver}/src/*.h "${pkgdir}"/usr/include/${_libname}
	cp ../${_libname}${pkgver}/src/gui/*.h "${pkgdir}"/usr/include/${_libname}/gui
	cp ../${_libname}${pkgver}/extensions/PythonQt_QtAll/*.h "${pkgdir}"/usr/include/${_libname}/extensions/PythonQt_QtAll

	# Library
	cp -Rd lib "${pkgdir}"/usr
}
