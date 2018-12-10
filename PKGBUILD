# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Chris <christopher.r.mullins g-mail>
# Contributor: Ainola
# Contributor: speps

pkgname=pythonqt
pkgver=3.2
pkgrel=6
pkgdesc='A dynamic Python binding for Qt applications'
arch=('i686' 'x86_64')
url='http://pythonqt.sourceforge.net/'
license=('LGPL2.1')

depends=('python' 'qt5-multimedia' 'qt5-svg' 'qt5-webkit' 'qt5-declarative' 'qt5-xmlpatterns')
makedepends=('git' 'qt5-tools')
conflicts=("${pkgname}-svn" "${pkgname}-for-screencloud" 'qt5-python27-git')
replaces=("${pkgname}-qt5")

source=(
	"http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/PythonQt-${pkgver}/PythonQt${pkgver}.zip"
	'fix_python_version.patch'
	'pkgconfig_file.prf'
	'create_pkgconfig_file.patch'
	'faster_build.patch'
)
sha512sums=(
	'1ee0f50f5035568b38e945108f5496ba64355c6357c1ea8dfc17ad90fa360540769f94e0b3e0e398176e8a21c8afe139607f0b5a2e82c63f1cbd40201a25e0f0'
	'9747898842f60bdfc5c38a54f7516a46b46279c57cbfa6c7f4796aa1ca5771ebb121f07fe4d09d23c60c92530750ee265808484f3e07aaae72065ed51c3896c7'
	'a146b46d4fb7162dc4290c662971742a4f85e11b2f5f9d71b4cd52f500ed7f0c3c1cf9034ead2e91f3c4e133446838fa530b3e13d3618617c695f2a433fdbb23'
	'9386ec26b3a59de492a9d8c31ca6c4f9e220510070a6d5c0a063618e3f6e7c4db611b27f6b46c028b5613e70453db67c060533e6940d72ff9ea623d80c2f99f9'
	'3c560169a0c10eeea21c3f6d078220caea70886d0203ef6dee1157afdd0bc1c7198cc65c6f5b2b5f4f61e416fa52330e75f282534402c8e00b2fe0829f17ce2a'
)

prepare() {
	# Create build directory
	mkdir -p "${srcdir}"/build
	cd "${srcdir}"/build
	cp -R ../PythonQt${pkgver}/* ./

	# Fix python version
	patch -Np1 < ../fix_python_version.patch

	# Add qmake configuration file to generate
	# PythonQt pkg-config file (*.pc)
	cp ../pkgconfig_file.prf build/
	patch -Np1 < ../create_pkgconfig_file.patch

	# Do not build tests nor examples
	patch -Np1 < ../faster_build.patch
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

	# pkg-config file
	mkdir -p "${pkgdir}"/usr/share/
	cp -R pkgconfig "${pkgdir}"/usr/share/
}
