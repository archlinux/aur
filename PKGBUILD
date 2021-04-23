# Maintainer:  ROllerozxa (temporaryemail4meh [gee mail])
# Contributor: Martin C. Doege <mdoege at compuserve dot com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Konsta Kokkinen <kray@tsundere.fi>
pkgname=minetest-git-leveldb
_pkgname=minetest
pkgver=20210421.3e2145d66
pkgrel=1
pkgdesc='Minecraft-inspired building game (with LuaJIT, LevelDB and Redis support)'
url='http://www.minetest.net/'
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('git' 'cmake' 'ninja')
depends=('bzip2' 'libpng' 'libjpeg' 'mesa' 'sqlite' 'openal' 'libvorbis' 'curl'
		'freetype2' 'luajit' 'leveldb' 'gettext' 'hiredis' 'spatialindex' 'gmp')
source=('git://github.com/minetest/'minetest{,_game}.git
		'git://github.com/minetest/irrlicht.git')
sha1sums=('SKIP' 'SKIP' 'SKIP')

conflicts=("${_pkgname}"{,-common,-server})
provides=("${_pkgname}"{,-common,-server})
install=install

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/irrlicht"
	cmake -G Ninja . \
		-DBUILD_SHARED_LIBS=ON
	ninja

	cd "${srcdir}/${_pkgname}"
	cmake -G Ninja . \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_CLIENT=1 \
		-DENABLE_GETTEXT=1 \
		-DENABLE_FREETYPE=1 \
		-DENABLE_LEVELDB=1 \
		-DENABLE_POSTGRESQL=0 \
		-DENABLE_SPATIAL=1 \
		-DENABLE_REDIS=1 \
		-DIRRLICHT_INCLUDE_DIR="${srcdir}/irrlicht/include/" \
		-DIRRLICHT_LIBRARY="${srcdir}/irrlicht/lib/Linux/libIrrlichtMt.so"
	ninja
}

package() {
	cd "${srcdir}/${_pkgname}"
	DESTDIR="${pkgdir}" ninja install
	cp -a "${srcdir}/minetest_game/" "${pkgdir}/usr/share/minetest/games/"

	cd "${srcdir}/irrlicht"
	DESTDIR="${pkgdir}" ninja install
	mv "${pkgdir}/usr/local/lib/" "${pkgdir}/usr/"
	mv "${pkgdir}/usr/local/include/" "${pkgdir}/usr/"
}
