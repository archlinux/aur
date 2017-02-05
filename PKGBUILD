# $Id$
# Maintainer:  Tejuswi Vaghjee <tejvghj at gmail dot com>
# Contributor: Sven-Hendrik Haase <sh at lutzhaase dot com>
# Contributor: Jaroslaw Swierczynski <swiergot at aur dot archlinux dot org>
# Contributor: Roman Kyrylych <Roman dot Kyrylych at gmail dot com>
# Contributor: Rabyte <rabyte at gmail dot com>

pkgname=actionfps
gitname=ActionFPS-Game-version_1000
pkgver=1000
pkgrel=1
pkgdesc="A game based on the open-source AssaultCube first-person shooter (FPS)"
arch=('i686' 'x86_64')
url="https://actionfps.com"
license=('ZLIB' 'custom')
depends=('sdl' 'sdl_mixer' 'sdl_image' 'openal' 'zlib' 'gcc-libs' 'libgl' 'glu' 'curl')
makedepends=('mesa' 'clang')
provides=('actionfps')
source=("https://github.com/ActionFPS/ActionFPS-Game/archive/version_1000.tar.gz"
        'actionfps-gcc6-1.patch'
        'actionfps'
        'actionfps-server'
        'actionfps.desktop'
        'actionfps.png')
md5sums=('32dad06e74202dea378efff732c0c249'
         'ac0b864edc62900fecaa547fd456645e'
         '3273bc8220f2e50e39e8076f06d8144d'
         'd00249969554bd600f5a39187a10c5d4'
         '22aaf111f2bce517000baaa375ba9321'
         'f7da6cb5df462439693b4c2560223a97')

prepare() {
	cd ${gitname}
	# Fix build with GCC 6
	patch -p1 -i ../actionfps-gcc6-1.patch
}

build() {
	cd "${gitname}/source/src"
	make
}

package() {
	cd "${gitname}/source/src"
	install -Dm755 ac_client ${pkgdir}/usr/bin/actionfps_client
	install -Dm755 ac_server ${pkgdir}/usr/bin/actionfps_server

	cd ${srcdir}/${gitname}
	mkdir -p ${pkgdir}/usr/share/actionfps
	cp -rf config packages docs ${pkgdir}/usr/share/actionfps
	install -Dm644 ${srcdir}/actionfps.png ${pkgdir}/usr/share/pixmaps/actionfps.png
	install -Dm644 ${srcdir}/actionfps.desktop ${pkgdir}/usr/share/applications/actionfps.desktop
	install -Dm644 docs/package_copyrights.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -Dm755 ${srcdir}/actionfps ${pkgdir}/usr/bin/actionfps
	install -Dm755 ${srcdir}/actionfps-server ${pkgdir}/usr/bin/actionfps-server
}
