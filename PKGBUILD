# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Konsta Kokkinen <kray@tsundere.fi>

pkgname=minetest-git
_pkgname=minetest
pkgver=20190312.e22a69d61
pkgrel=1
pkgdesc='Voxel game engine and Infiniminer/Minecraft-inspired game'
url='http://www.minetest.net/'
license=('LGPL2.1' 'CCPL:by-sa')
arch=('i686' 'x86_64')
makedepends=('git' 'cmake')
depends=('bzip2' 'freetype2' 'irrlicht' 'jsoncpp' 'leveldb' 'libjpeg'
         'libpng' 'libvorbis' 'luajit' 'mesa' 'openal' 'sqlite' 'hiredis')
source=('git://github.com/minetest/minetest.git'
        'git://github.com/minetest/minetest_game.git')
sha256sums=('SKIP'
            'SKIP')

conflicts=("${_pkgname}"{,-common,-server})
provides=("${_pkgname}"{,-common,-server})
install=install

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	cd "${srcdir}"
	rm -fr minetest/games/minetest_game
	cp -a minetest_game minetest/games/
}

build() {
	cd "${srcdir}/${_pkgname}"
	cmake . \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DENABLE_GETTEXT=TRUE \
		-DRUN_IN_PLACE=FALSE \
		-DBUILD_SERVER=TRUE \

	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
}
