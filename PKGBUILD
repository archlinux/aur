# Maintainer:  ROllerozxa <temporaryemail4meh [gee mail]>
# Contributor: Martin C. Doege <mdoege at compuserve dot com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Konsta Kokkinen <kray@tsundere.fi>
pkgname=minetest-git-leveldb
_pkgname=minetest
pkgver=5.4.0.r262.gbf3acbf38
pkgrel=1
pkgdesc='Voxel-based sandbox game engine (Git version with LevelDB support)'
url='https://www.minetest.net/'
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('git' 'cmake' 'ninja')
depends=('bzip2' 'libpng' 'libjpeg' 'mesa' 'sqlite' 'openal' 'libvorbis' 'curl'
		'freetype2' 'luajit' 'leveldb' 'gettext' 'hiredis' 'spatialindex' 'gmp')
source=('git+https://github.com/minetest/'minetest{,_game}.git
		'git+https://github.com/minetest/irrlicht.git')
sha1sums=('SKIP' 'SKIP' 'SKIP')

conflicts=("${_pkgname}"{,-common,-server})
provides=("${_pkgname}"{,-common,-server})
install=install

pkgver() {
	git -C "${_pkgname}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/irrlicht"
	cmake -G Ninja . \
		-DBUILD_SHARED_LIBS=0
	ninja

	cd "${srcdir}/${_pkgname}"
	cmake -G Ninja . \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DENABLE_LEVELDB=1 \
		-DENABLE_POSTGRESQL=0 \
		-DENABLE_SPATIAL=1 \
		-DENABLE_REDIS=1 \
		-DIRRLICHT_INCLUDE_DIR="${srcdir}/irrlicht/include/" \
		-DIRRLICHT_LIBRARY="${srcdir}/irrlicht/lib/Linux/libIrrlichtMt.a"
	ninja
}

package() {
	cd "${srcdir}/${_pkgname}"
	DESTDIR="${pkgdir}" ninja install
	cp -a "${srcdir}/minetest_game/" "${pkgdir}/usr/share/minetest/games/"
}
