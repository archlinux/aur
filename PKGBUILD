# Maintainer: Edgar <Edgar{at}AnotherFoxGuy.com>

pkgname='mygui-ogre'
pkgver=3.4.3
pkgrel=1

pkgdesc="A library for creating Graphical User Interfaces for games and 3D applications (Build with the OGRE rendersystem)"
arch=('i686' 'x86_64')
url="http://mygui.info/"
license=('LGPL')

depends=('ogre')
makedepends=('cmake' 'doxygen' 'graphviz' 'ttf-dejavu')
conflicts=('mygui' 'mygui-svn')
provides=('mygui-ogre')

source=("https://github.com/MyGUI/mygui/archive/MyGUI${pkgver}.tar.gz")
sha512sums=('88c69ca2e706af364b72d425f95013eb285501881d8094f8d67e31a54c45ca11b0eb5b62c382af0d4c43f69aa8197648259ac306b72efa7ef3e25eecb9b039cb')

build() {
	cd "${srcdir}/mygui-MyGUI${pkgver}"

	# msg "Get a clean build dir..."
	[[ -d build ]] && rm -rf build
	mkdir build && cd build

	# generate CMake Makefile
	cmake .. \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DMYGUI_BUILD_DEMOS=FALSE \
		-DMYGUI_BUILD_TOOLS=TRUE \
		-DMYGUI_INSTALL_DOCS=TRUE \
		-DMYGUI_INSTALL_TOOLS=TRUE \
		-DCMAKE_BUILD_TYPE=Release \
		-DMYGUI_RENDERSYSTEM=3 \
		-DBUILD_SHARED_LIBS=TRUE

	make
	make api-docs
}

package() {
	cd "${srcdir}/mygui-MyGUI${pkgver}/build"

	make DESTDIR="$pkgdir" install

	# install docs
	install -d "${pkgdir}"/usr/share/doc/
	cp -r Docs/html "${pkgdir}"/usr/share/doc/MYGUI
}
