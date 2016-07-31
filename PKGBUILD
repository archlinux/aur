# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_pkgname=pythonqt
pkgname=${_pkgname}-qt5
pkgver=3.1
pkgrel=3
pkgdesc='A dynamic Python binding for the Qt framework to embed Python code into C++ Qt applications. Qt5 lib.'
arch=('i686' 'x86_64')
url='http://pythonqt.sourceforge.net/'
license=('LGPL2.1')

depends=('python' 'qt5-multimedia' 'qt5-svg' 'qt5-webkit' 'qt5-declarative')
makedepends=('git' 'qt5-tools' 'dos2unix')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" 'qt5-python27-git')

source=(
	"http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}/PythonQt-${pkgver}/PythonQt${pkgver}.zip"
	'upstream_fixes_r438.patch'
	'fix_build.patch'
)
sha512sums=(
	'b3c208e3f909ebb15d40a6e83385f03e6196a8439e39cad4f924e7b1e774edbce83680298ab032161619d1358696a0d073028860f68540aadd8028b712ae8fc1'
	'a9f562a2fde0ff7faebb7bb0ae102d1d54ed3ed70aaa19bb8a9a5fab5ef00d79b0b0133221747a65f07e66a41ae9814fa4558f06b24a9f76f06f4979218bad81'
	'7eaa3db47f5415f8025d91dab044713f430a8a01c78a8ac19554a9d976c44fe203267b5e4f0e2f3dd9b367a8fdf261cef7aa302ffb3fea7ab9cd2af40fcd82b3'
)

prepare() {
	# Create build directory
	mkdir -p "${srcdir}"/build
	cd "${srcdir}"/build
	cp -r ../PythonQt${pkgver}/* ./

	# Fix PythonQt.pro line endings, patch complains about it
	dos2unix PythonQt.pro

	# Merge upstream changes until r438
	# It fixes some compilation errors and re-adds QtUiTools
	# https://sourceforge.net/p/pythonqt/code/438/log/?path=/trunk
	patch -Np1 < ../upstream_fixes_r438.patch

	# Fix python library path
	patch -Np1 < ../fix_build.patch
}

build() {
	# Building package
	cd "${srcdir}"/build
	qmake-qt5 \
		QMAKE_CFLAGS="${CFLAGS}" \
		QMAKE_CXXFLAGS="${CXXFLAGS}" \
		CONFIG+=release \
		CONFIG+=c++14
	make
}

package() {
	cd "${srcdir}"/build

	# Includes
	mkdir -p "${pkgdir}"/usr/include/PythonQt/{gui,extensions/PythonQt_QtAll}
	cp ../PythonQt${pkgver}/src/*.h "${pkgdir}"/usr/include/PythonQt
	cp ../PythonQt${pkgver}/src/gui/*.h "${pkgdir}"/usr/include/PythonQt/gui
	cp ../PythonQt${pkgver}/extensions/PythonQt_QtAll/*.h "${pkgdir}"/usr/include/PythonQt/extensions/PythonQt_QtAll

	# Library
	cp -Rd lib "${pkgdir}"/usr
}
