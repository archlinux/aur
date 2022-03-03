pkgname='mygui-git'
pkgver=3.4.2.a238876f5
pkgrel=1

pkgdesc="A library for creating Graphical User Interfaces for games and 3D applications"
arch=('i686' 'x86_64')
url="http://mygui.info/"
license=('LGPL')

depends=('ogre')
makedepends=('cmake' 'doxygen' 'graphviz' 'ttf-dejavu')
conflicts=('mygui' 'mygui-svn')
provides=('mygui')

source=("git+https://github.com/MyGUI/mygui.git")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/mygui"

	_hfile='MyGUIEngine/include/MyGUI_Prerequest.h'
	_maj=$(cat $_hfile | grep MYGUI_VERSION_MAJOR | head -n1 | awk '{print $3;}')
	_min=$(cat $_hfile | grep MYGUI_VERSION_MINOR | head -n1 | awk '{print $3;}')
	_rev=$(cat $_hfile | grep MYGUI_VERSION_PATCH | head -n1 | awk '{print $3;}')

	_gitcommit=$(git rev-parse --short HEAD)
	#git log -1 --format=%cd.%h --date=short | tr -d '-'

	echo $_maj.$_min.$_rev.$_gitcommit
}

prepare() {
	mkdir -p cd "${srcdir}/mygui/build"
}

build() {
	cd "${srcdir}/mygui/build"

	# msg "Get a clean build dir..."

	# [[ -d build ]] && rm -rf build
	# mkdir build && cd build

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
	cd "${srcdir}/mygui/build"

	make DESTDIR="$pkgdir" install

	# install docs
	install -d "${pkgdir}"/usr/share/doc/
	cp -r Docs/html "${pkgdir}"/usr/share/doc/MYGUI
}
