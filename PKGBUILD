# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: fana-m <geminin@gmx.net>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Manuel Gaul <inkaine@hotmail.com>

pkgname=gigi
pkgver=7117
pkgrel=1
pkgdesc='Small, efficient and feature rich GUI for OpenGL and C++ (FreeOrion fork)'
url='http://freeorion.svn.sourceforge.net/viewvc/freeorion/trunk/FreeOrion/GG/'
arch=('x86_64' 'i686')
license=('LGPL')
depends=('boost' 'libpng' 'libtiff' 'ogre' 'sdl' 'python')
makedepends=('subversion' 'cmake' 'setconf' 'doxygen' 'mesa-libgl')
source=("$pkgname::svn+https://freeorion.svn.sourceforge.net/svnroot/freeorion/trunk/FreeOrion/GG/" 'gigi-cmake.patch')
sha256sums=('SKIP'
            'a95c16709de0e645503d51ee89f5d6babbfae1da6e65d507a0d3b9b12cc33e75')

pkgver() {
	cd $pkgname
	svnversion | tr -d [A-z]
}

prepare() {
	cd $pkgname

	patch -p1 -i ../gigi-cmake.patch
	sed -i -e '1s:python$:python2:' GG/gen_signals.py

	setconf cmake/GiGiOgre.pc.in prefix /usr
	setconf cmake/GiGi.pc.in prefix /usr
	setconf cmake/GiGiSDL.pc.in prefix /usr
}

build() {
	cd $pkgname

	cmake \
		-D CMAKE_INSTALL_PREFIX="/usr" \
		-D CMAKE_BUILD_TYPE=Release \
		-D BUILD_DEVEL_PACKAGE=ON \
		.
	make -j1
}

package() {
	cd $pkgname
	make DESTDIR="$pkgdir" install
}
