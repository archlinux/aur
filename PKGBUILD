# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Chris <christopher.r.mullins g-mail>
# Contributor: Ainola
# Contributor: speps

pkgname=pythonqt
pkgver=3.1
pkgrel=3
pkgdesc='A dynamic Python binding for Qt applications'
arch=('i686' 'x86_64')
url='http://pythonqt.sourceforge.net/'
license=('LGPL2.1')

depends=('python' 'qt5-multimedia' 'qt5-svg' 'qt5-webkit' 'qt5-declarative')
makedepends=('git' 'qt5-tools')
conflicts=('qt5-python27-git')
replaces=("${pkgname}-qt5")

source=(
	"http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/PythonQt-${pkgver}/PythonQt${pkgver}.zip"
	'fix_qt_58.patch'
	'fix_uitools.patch'
	'fix_python_config.patch'
	'upstream_patches_r444.patch'
)
sha512sums=(
	'b3c208e3f909ebb15d40a6e83385f03e6196a8439e39cad4f924e7b1e774edbce83680298ab032161619d1358696a0d073028860f68540aadd8028b712ae8fc1'
	'2a3adc86fc4d91d82830aed8bd8400afa913eb36ed98f1c6991bcdbe1b8ff392959740e22d698af1a435423c35ce8b2d5c867ce24b7252b139d4dd440935f1b3'
	'16fea1728e44b96c452a8523a0fbaed4840a3b8cfe434824d5a97f59ee5bbad19e357786aadcf22876244f3c58e8e64429f7a1e601e8722d8864ffb07207e4d1'
	'843d34c90cbea7d70ec3e2b56eef40cc189cdd3d8bc1e5a823d47348eed0df92e60369496cc99cad8fe2fa35b24d6992c960388cd1ababdb7250515240b6cfd0'
	'2fca4c0dd059ad92e6bc9b81fa1708f8c766a6157faff2374cc6f874bf06531fa95c80bae7a4f22cf3da64c9b32d3ad44c177f6de0608e99d99e8a05bf0871ef'
)

prepare() {
	# Create build directory
	mkdir -p "${srcdir}"/build
	cd "${srcdir}"/build
	cp -R ../PythonQt${pkgver}/* ./

	# Fix Qt 5.8 compilation errors
	patch -Np1 < ../fix_qt_58.patch

	# Fix QtUiTools
	patch -Np1 < ../fix_uitools.patch

	# Fix python library path
	patch -Np1 < ../fix_python_config.patch

	# Merge upstream patches until r444
	patch -Np1 < ../upstream_patches_r444.patch
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
	cp ../PythonQt${pkgver}/src/*.h "${pkgdir}"/usr/include/PythonQt/
	cp ../PythonQt${pkgver}/src/gui/*.h "${pkgdir}"/usr/include/PythonQt/gui/
	cp ../PythonQt${pkgver}/extensions/PythonQt_QtAll/*.h "${pkgdir}"/usr/include/PythonQt/extensions/PythonQt_QtAll/

	# Library
	mkdir -p "${pkgdir}"/usr/lib
	cp -a lib/*.so* "${pkgdir}"/usr/lib/
}
