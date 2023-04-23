# Maintainer: adrien Prost-Boucle <adrien.prost-boucle.@laposte.net>

pkgname='mygui-gl-arm-git'
pkgver=3.2.3.git20160322
pkgrel=1

pkgdesc="MyGUI - OpenGL backend"
arch=('i686' 'x86_64' 'aarch64')
url="http://mygui.info/"
license=('LGPL')

source=("git+https://github.com/MyGUI/mygui.git")
md5sums=('SKIP')

depends=('boost-libs' 'freetype2' 'sdl2' 'sdl2_image' 'libgl')
makedepends=('boost' 'cmake')
optdepends=('mygui-docs: documentation')
conflicts=('mygui' 'mygui-git' 'mygui-gl-git')
provides=('mygui')

pkgver() {
	cd "${srcdir}/mygui"

	_hfile='MyGUIEngine/include/MyGUI_Prerequest.h'
	_maj=`cat $_hfile | grep MYGUI_VERSION_MAJOR | head -n1 | awk '{print $3;}'`
	_min=`cat $_hfile | grep MYGUI_VERSION_MINOR | head -n1 | awk '{print $3;}'`
	_rev=`cat $_hfile | grep MYGUI_VERSION_PATCH | head -n1 | awk '{print $3;}'`

	_gitcommit=$(git rev-parse --short HEAD)
	#_gitlog=`git log -1 --format=%cd --date=short | tr -d '-'`
	#git log -1 --format=%cd.%h --date=short | tr -d '-'

	echo $_maj.$_min.$_rev.git$_gitlog
}

build() {
	cd "${srcdir}/mygui"

	msg "Get a clean build dir..."

	rm -rf build
	mkdir -p build
	cd build

	msg "Generate CMake makefiles..."

	# Note: MYGUI_RENDERSYSTEM = 3 for Ogre, 4 for OpenGL
	cmake .. \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DMYGUI_BUILD_DEMOS=FALSE \
		-DMYGUI_BUILD_TOOLS=TRUE \
		-DMYGUI_INSTALL_TOOLS=TRUE \
		-DMYGUI_INSTALL_DOCS=FALSE \
		-DMYGUI_RENDERSYSTEM=4 \
		-DFREETYPE_INCLUDE_DIR=/usr/include/freetype2/ \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_SHARED_LIBS=TRUE

	msg "Starting make..."

	make
}

package() {
	cd "${srcdir}/mygui/build"

	make DESTDIR="$pkgdir" install

}

