# Maintainer: Edgar <Edgar{at}AnotherFoxGuy.com>

pkgname='mygui-ogre'
pkgver=3.4.2
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
sha512sums=('202f3df35f0767778b5a91b71dbd1ad3409d0a1977d5fbe3f0d48db430276c71b84edc5a28dd1fdb8e60245b56f2bda99872a4d860b83585f08406b28fb850fe')

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
