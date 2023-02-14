# Maintainer:  ROllerozxa <rollerozxa@voxelmanip.se>
# Contributor: Martin C. Doege <mdoege at compuserve dot com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Konsta Kokkinen <kray@tsundere.fi>
pkgname=minetest-git-leveldb
_pkgname=minetest
pkgver=5.6.0.r314.g4cd6b773b
pkgrel=1
pkgdesc='Voxel-based sandbox game engine (Git version with LevelDB support)'
url='https://www.minetest.net/'
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('git' 'cmake' 'ninja')
depends=('bzip2' 'libpng' 'libjpeg' 'mesa' 'sqlite' 'openal' 'libvorbis' 'curl'
		'freetype2' 'luajit' 'leveldb' 'gettext' 'hiredis' 'spatialindex' 'gmp')
optdepends=('minetest-devtest-git: Development Test game')
source=('git+https://github.com/minetest/'minetest{,_game}.git
		'git+https://github.com/minetest/irrlicht.git')
sha1sums=('SKIP' 'SKIP' 'SKIP')

conflicts=("${_pkgname}"{,-common,-server})
provides=("${_pkgname}"{,-common,-server})

pkgver() {
	git -C "${_pkgname}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	ln -sf "${srcdir}/irrlicht/" "${srcdir}/${_pkgname}/lib/irrlichtmt"

	cd "${srcdir}/${_pkgname}"
	cmake -G Ninja . \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DENABLE_LEVELDB=1 \
		-DENABLE_POSTGRESQL=0 \
		-DENABLE_SPATIAL=1 \
		-DENABLE_REDIS=1
	ninja
}

package() {
	cd "${srcdir}/${_pkgname}"
	DESTDIR="${pkgdir}" ninja install

	mkdir -p "${pkgdir}/usr/share/minetest/games/"
	cp -a "${srcdir}/minetest_game/" "${pkgdir}/usr/share/minetest/games/"
	rm -rf "${pkgdir}/usr/share/minetest/games/minetest_game/"{.git,.github}
}
