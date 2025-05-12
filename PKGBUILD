# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Tucker Boniface <tucker@boniface.tech>
# Contributor: Tejuswi Vaghjee <tejvghj at gmail dot com>
# Contributor: Sven-Hendrik Haase <sh at lutzhaase dot com>
# Contributor: Jaroslaw Swierczynski <swiergot at aur dot archlinux dot org>
# Contributor: Roman Kyrylych <Roman dot Kyrylych at gmail dot com>
# Contributor: Rabyte <rabyte at gmail dot com>

pkgbase=actionfps
pkgname=(${pkgbase}-client ${pkgbase}-server ${pkgbase}-common)
pkgver=1.2.0.2.r896.g80dcc7b
pkgrel=1
pkgdesc='A game based on the open-source AssaultCube first-person shooter (FPS)'
arch=('i686' 'x86_64')
url='https://actionfps.com'
license=('Zlib' 'custom')
depends=('zlib' 'gcc-libs')
makedepends=('mesa' 'clang' 'sdl' 'sdl_mixer' 'sdl_image' 'openal' 'libgl' 'glu' 'libogg' 'libvorbis' 'curl' 'git')
_commit='80dcc7b4281bfcf02439e93275b20ae58971b6dc'
source=("assaultcube-$pkgbase::git+https://github.com/ActionFPS/AC.git#commit=${_commit}"
        'actionfps'
        'actionfps-server'
        'actionfps.desktop'
        'actionfps.png'
        "systemd-${pkgbase}-sysuser.conf"
        "systemd-${pkgbase}-server.service")
sha512sums=('2f79e52cddb079e1dd1af6b006ffc4bd411b181f128733ab26e9c7628efe431168dd527f0bb9953203dc0817a002b1b69d0ed6c7de9b02e84b6a979b1c8ad3d7'
            'c99ae5698749d3c5f3003b2d8403c93ee1964b971a621e48c3013dff1f230a06819bdda5d250cf576186c45154875d900eb546dc71e4fb820299c5d0c12e9705'
            'ba4f9cb222e9440dea9c44ca7f492e26a012c850b96adc866b76a30ed93b0b9b38c0b67c63b03e310769801c1be41c604606ddd819af8bce3a6acbb6b91c30f4'
            'cb6d8a09aba2136aa3450979bcc577830db7b83791101decc819711357c887479e7f03b0515be18f3d0f781845e83a62e19c83a7b910f7059db550237c6b9a4f'
            '30b0e533939831f90695641632b70dbdd3adbab09fb89af24d8eb1fed7056942124775c1f8b2bb22b852800eb6d9749ed54b5fb6661c283ea590b519acbd1975'
            'e14b9dd96b57d5f10981197d01de90007d5366330bd853d38eeaa4e866cebcd5d5567e3f6c538b0eff60e6dee9359d248e1c82db9b50b7f1482da0c6cc93e14c'
            'eecba69c8a9630152514b04bd7588fa23f0d0f43c31bed4e58bb872fc30738094e01b7613543d04033ac2b4eb88d1010ab610a88ea69afac24a1d2f9733215d1')

_srcdir="assaultcube-$pkgbase"

_cflags=${CLANG_CFLAGS:-$CFLAGS}
check_option 'lto' 'y' && _cflags+=' -flto=auto'
_cxxflags=${CLANG_CXXFLAGS:-$CXXFLAGS}
check_option 'lto' 'y' && _cxxflags+=' -flto=auto'

pkgver() {
	cd "${_srcdir}"
	( set -o pipefail
		git describe --tags --abbrev=7 --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

prepare() {
	cd "${_srcdir}"
	rm -rf 'source/lib'
	sed -i 's|CUBE_DIR=./|CUBE_DIR=$(dirname "$(readlink -f "${0}")")|' 'server.sh'
	sed -i 's|CUBE_OPTIONFILE=-Cconfig/servercmdline.txt|CUBE_OPTIONFILE=-C/etc/actionfps/servercmdline.txt|' 'server.sh'
	cd 'source/src'
	sed -i 's|static inline float round|//static inline float round|' 'tools.h'
	sed -i "s/CXXFLAGS= -O3/CXXFLAGS= ${_cxxflags}/" 'Makefile'
}

build() {
	cd "${_srcdir}/source/src"
	CC=clang CXX=clang++ CFLAGS="${_cflags}" CXXFLAGS="${_cxxflags}" make
}

package_actionfps-common() {
	install -dm755 "${pkgdir}/usr/share/games/${pkgbase}"
	conflicts=('actionfps')
	replaces=('actionfps')

	cp -r "${_srcdir}"/{bot,docs,config} \
		"${pkgdir}/usr/share/games/${pkgbase}"

	rm "${pkgdir}/usr/share/games/${pkgbase}/config/servercmdline.txt"
	find "${pkgdir}/usr/share/games/${pkgbase}/docs" -type f -exec chmod -R 0644 '{}' \;
	find "${pkgdir}/usr/share/games/${pkgbase}/docs" -type d -exec chmod -R 0755 '{}' \;

	install -Dm644 "${_srcdir}"/{README.html,changelog.txt} -t "${pkgdir}/usr/share/games/${pkgbase}"
	install -Dm644 "${_srcdir}/docs/package_copyrights.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_actionfps-client() {
	depends+=('actionfps-common' 'mesa' 'sdl' 'sdl_mixer' 'sdl_image' 'openal' 'libgl' 'glu' 'libogg' 'libvorbis' 'curl')
	conflicts=('actionfps')
	replaces=('actionfps')

	install -dm755 "${pkgdir}/usr/share/games/${pkgbase}"
	install -Dm755 "${_srcdir}/assaultcube.sh" -t "${pkgdir}/usr/share/games/${pkgbase}"
	install -Dm755 "${_srcdir}/source/src/ac_client" "${pkgdir}/usr/share/games/${pkgbase}/bin_unix/native_client"
	cp -r "${_srcdir}"/{mods,packages} "${pkgdir}/usr/share/games/${pkgbase}"
	install -Dm644 "${pkgbase}.png" -t "${pkgdir}/usr/share/pixmaps"
	install -Dm644 "${pkgbase}.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm755 "${pkgbase}" "${pkgdir}/usr/bin/${pkgbase}"
}

package_actionfps-server() {
	depends+=('actionfps-common' 'systemd')
	backup=('etc/actionfps/servercmdline.txt')
	conflicts=('actionfps')
	replaces=('actionfps')

	install -Dm755 "${pkgbase}-server" -t "${pkgdir}/usr/bin"
	install -Dm644 "${_srcdir}/config/servercmdline.txt" -t "${pkgdir}/etc/${pkgbase}"

	install -Dm755 "${_srcdir}/source/src/ac_server" "${pkgdir}/usr/share/games/actionfps/bin_unix/native_server"
	install -Dm755 "${_srcdir}"/{server.sh,server_wizard.sh} -t "${pkgdir}/usr/share/games/${pkgbase}"

	install -Dm644 "systemd-${pkgbase}-sysuser.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgbase}.conf"
	install -Dm644 "systemd-${pkgbase}-server.service" "${pkgdir}/usr/lib/systemd/system/${pkgbase}-server.service"
}

