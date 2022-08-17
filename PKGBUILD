# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=qt-aseman
pkgver=3.1.6
pkgrel=1
pkgdesc="A set of C++ and QML tools and modules that helps you develop your projects easier and better."
arch=('x86_64')
url="https://github.com/Aseman-Land/QtAseman"
license=('LGPL3')
makedepends=('gcc' 'make' 'git' 'qt5-base' 'qt5-multimedia' 'qt5-quickcontrols2')
options=('!emptydirs' '!strip')

# Source to compile to a specific tag
source=("git+https://github.com/Aseman-Land/QtAseman.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
	cd ${srcdir}/QtAseman/
	mkdir -p build
}

build(){
	cd ${srcdir}/QtAseman/build/
	qmake -r ..
	make -j2
}

package() {
	install -dm755 "${pkgdir}"/usr/include
	install -dm755 "${pkgdir}"/usr/lib/qt/qml/AsemanQml
	install -dm755 "${pkgdir}"/usr/lib/qt/qml/QtQuick
	install -dm755 "${pkgdir}"/usr/lib/qt/mkspecs/modules
	install -dm755 "${pkgdir}"/usr/lib/qt/mkspecs/modules-inst
	cp -r ./QtAseman/build/lib/* "${pkgdir}"/usr/lib
	cp -r ./QtAseman/build/mkspecs/modules/* "${pkgdir}"/usr/lib/qt/mkspecs/modules
	cp -r ./QtAseman/build/mkspecs/modules-inst/* "${pkgdir}"/usr/lib/qt/mkspecs/modules-inst
	cp -r ./QtAseman/build/include/* "${pkgdir}"/usr/include
	cp -r ./QtAseman/build/qml/AsemanQml/* "${pkgdir}"/usr/lib/qt/qml/AsemanQml
	cp -r ./QtAseman/build/qml/QtQuick/* "${pkgdir}"/usr/lib/qt/qml/QtQuick
	
	sed -i "s|${srcdir}/QtAseman/build/include|/usr/include|g" "${pkgdir}"/usr/lib/qt/mkspecs/modules/*.pri
	sed -i "s|${srcdir}/QtAseman/build/lib|/usr/lib|g" "${pkgdir}"/usr/lib/qt/mkspecs/modules/*.pri
	sed -i "s|${srcdir}/QtAseman/build/bin|/usr/bin|g" "${pkgdir}"/usr/lib/qt/mkspecs/modules/*.pri
	sed -i "s|${srcdir}/QtAseman/build|/usr/lib/qt|g" "${pkgdir}"/usr/lib/qt/mkspecs/modules/*.pri
	sed -i "s|${srcdir}/QtAseman/build|/usr|g" "${pkgdir}"/usr/lib/*.prl

	install -D -m644 ./QtAseman/LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
