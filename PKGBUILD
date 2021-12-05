# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Tucker Boniface <tucker@boniface.tech>
# Contributor: Tejuswi Vaghjee <tejvghj at gmail dot com>
# Contributor: Sven-Hendrik Haase <sh at lutzhaase dot com>
# Contributor: Jaroslaw Swierczynski <swiergot at aur dot archlinux dot org>
# Contributor: Roman Kyrylych <Roman dot Kyrylych at gmail dot com>
# Contributor: Rabyte <rabyte at gmail dot com>

pkgname=actionfps
pkgver=1.2.0.2
pkgrel=2
pkgdesc='A game based on the open-source AssaultCube first-person shooter (FPS)'
arch=('i686' 'x86_64')
url='https://actionfps.com'
license=('ZLIB' 'custom')
depends=('sdl' 'sdl_mixer' 'sdl_image' 'openal' 'zlib' 'gcc-libs' 'libgl' 'glu' 'curl' 'libogg' 'libvorbis')
makedepends=('mesa' 'clang')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ActionFPS/AC/archive/refs/tags/v${pkgver}.tar.gz"
        'actionfps'
        'actionfps-server'
        'actionfps.desktop'
        'actionfps.png')
sha512sums=('97a5eaa1fba716d6c29dd1dbcdf3a44fbdaa3c5ba1b350eae3834699d20784b7e4563c4bf729bf7552654aeabe2d577e188cf8ce0ccd5449f092df9cdd76341a'
            'c99ae5698749d3c5f3003b2d8403c93ee1964b971a621e48c3013dff1f230a06819bdda5d250cf576186c45154875d900eb546dc71e4fb820299c5d0c12e9705'
            'ba4f9cb222e9440dea9c44ca7f492e26a012c850b96adc866b76a30ed93b0b9b38c0b67c63b03e310769801c1be41c604606ddd819af8bce3a6acbb6b91c30f4'
            '751376e2820a3a5d590f4f323e414d5a40b34137ce9988a9dfe9aa857ba00ec3d721c323be7497e7d3f5002de0746c3af02f557029977247d0e72b16bdb6cbb8'
            '30b0e533939831f90695641632b70dbdd3adbab09fb89af24d8eb1fed7056942124775c1f8b2bb22b852800eb6d9749ed54b5fb6661c283ea590b519acbd1975')
            
_srcdir="AC-${pkgver}"

prepare() {
	cd "${_srcdir}"
	rm -rf 'source/lib'
	sed -i 's|CUBE_DIR=./|CUBE_DIR=$(dirname "$(readlink -f "${0}")")|' 'server.sh'
	cd 'source/src'
	sed -i 's|static inline float round|//static inline float round|' 'tools.h'
	make
}

package() {
	install -dm755 "${pkgdir}/usr/share/games/actionfps/bin_unix"
	cp -r "${_srcdir}"/{bot,docs,mods,packages,scripts,assaultcube.sh,changelog.txt,README.html,server.sh,server_wizard.sh} \
		"${pkgdir}/usr/share/games/actionfps"
		
	install -dm755 "${pkgdir}/usr/share/games/actionfps/config_default"
	cp -r "${_srcdir}/config"/* "${pkgdir}/usr/share/games/actionfps/config_default"
	
	install -Dm755 "${_srcdir}/source/src/ac_client" "${pkgdir}/usr/share/games/actionfps/bin_unix/native_client"
	install -Dm755 "${_srcdir}/source/src/ac_server" "${pkgdir}/usr/share/games/actionfps/bin_unix/native_server"
	install -Dm644 'actionfps.png' "${pkgdir}/usr/share/pixmaps/actionfps.png"
	install -Dm644 'actionfps.desktop' "${pkgdir}/usr/share/applications/actionfps.desktop"
	install -Dm644 "${_srcdir}/docs/package_copyrights.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm755 'actionfps' "${pkgdir}/usr/bin/actionfps"
	install -Dm755 'actionfps-server' "${pkgdir}/usr/bin/actionfps-server"
}
