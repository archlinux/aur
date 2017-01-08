# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Chris <christopher.r.mullins g-mail>
# Contributor: Ainola
# Contributor: speps

pkgname=pythonqt
pkgver=3.1
pkgrel=2
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
	'upstream_fixes_r441.patch'
	'fix_python_config.patch'
)
sha512sums=(
	'b3c208e3f909ebb15d40a6e83385f03e6196a8439e39cad4f924e7b1e774edbce83680298ab032161619d1358696a0d073028860f68540aadd8028b712ae8fc1'
	'f0f25c726b52e5062c06664f3476d739581859ac3760a3f9cfcc7c53f539eb24f3767f13acaa83c351c25dfa3cfbb1ad5f45018d821dbd1892fa21f514f4b6d8'
	'843d34c90cbea7d70ec3e2b56eef40cc189cdd3d8bc1e5a823d47348eed0df92e60369496cc99cad8fe2fa35b24d6992c960388cd1ababdb7250515240b6cfd0'
)

prepare() {
	# Create build directory
	mkdir -p "${srcdir}"/build
	cd "${srcdir}"/build
	cp -R ../PythonQt${pkgver}/* ./

	# Merge upstream changes until r441
	# It fixes some compilation errors and re-adds QtUiTools
	patch -Np1 < ../upstream_fixes_r441.patch

	# Fix python library path
	patch -Np1 < ../fix_python_config.patch
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
