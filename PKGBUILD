# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Chris <christopher.r.mullins g-mail>
# Contributor: Ainola
# Contributor: speps

pkgname=pythonqt
pkgver=3.2
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
	'fix_python_version.patch'
)
sha512sums=(
	'1ee0f50f5035568b38e945108f5496ba64355c6357c1ea8dfc17ad90fa360540769f94e0b3e0e398176e8a21c8afe139607f0b5a2e82c63f1cbd40201a25e0f0'
	'9747898842f60bdfc5c38a54f7516a46b46279c57cbfa6c7f4796aa1ca5771ebb121f07fe4d09d23c60c92530750ee265808484f3e07aaae72065ed51c3896c7'
)

prepare() {
	# Create build directory
	mkdir -p "${srcdir}"/build
	cd "${srcdir}"/build
	cp -R ../PythonQt${pkgver}/* ./

	# Fix python version
	patch -Np1 < ../fix_python_version.patch
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
