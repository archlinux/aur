# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgbase=assaultcube
pkgname=(${pkgbase}-client ${pkgbase}-server ${pkgbase}-common)
pkgver=1.3.0.2
pkgrel=1
pkgdesc='A game based on the open-source AssaultCube first-person shooter (FPS)'
arch=('i686' 'x86_64')
url='https://assault.cubers.net/'
license=('ZLIB' 'custom')
depends=('zlib' 'gcc-libs')
makedepends=('mesa' 'clang' 'sdl2' 'sdl2_image' 'openal' 'libvorbis' 'libgl')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/assaultcube/AC/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgbase}"
        "${pkgbase}-server"
        "${pkgbase}.desktop"
        'systemd-sysuser.conf'
        "systemd-${pkgbase}-server.service")
sha512sums=('8488c399036532859f7c83d094ac1443c52aa6367d106cc5889b80353ff1d501f7b8ae3b51e34b03215cc88dacc5f29488635047ce90291c601f8f7582498685'
            '6ecfb0320f8f63d3c220032a0e267bd81f89ed33d415991a83e7a662769eec6dcdf374fcf0d4f7e893c0dcd58598379d49cc52550b5907769fdbc6c428013d91'
            '363fbee6e2561677eb7bc1f9d77e1431758063f3ceaf86fd0878c0e376fb9921ad90285dc961b6afaf9b40fa545f9cbb659aaf039e134b8b4c85510916d1a4e2'
            '7510796bd47934e897887123a2b146607a8ca04a521a7d6cd744ea823aa3d13f8c90d87c78d322ffbf0e6178aa34fdbe907e60aeda447532bdb1b373471e3e3a'
            '1506fd102d70b7cbe838f2e55725cd2f70c15174b119b077060f6e20041826fef3f6d6a18c4138a3d883162692258d2057f5511682048dfeaafc613e5c63f580'
            'b27d30c162344119acda03943dc93cc677c8373cd54e8aec14083dfbef42ecb15cedf6e9412e9530d4daa8ebb62b882de016f62ecbcdcc838af42a3f8f3b2b97')

_srcdir="AC-${pkgver}"

_cflags=${CLANG_CFLAGS:-}
check_option 'lto' 'y' && _cflags+=' -flto=auto'
_cxxflags=${CLANG_CXXFLAGS:-}
check_option 'lto' 'y' && _cxxflags+=' -flto=auto'

prepare() {
	cd "${_srcdir}"
	sed -i 's/libSDL-1.2/libSDL-2.0/' 'check_install.sh'
	sed -i 's|CUBE_OPTIONFILE=-Cconfig/servercmdline.txt|CUBE_OPTIONFILE=-C/etc/assaultcube/servercmdline.txt|' 'server.sh'
	sed -i 's|//#define PRODUCTION|#define PRODUCTION|' 'source/src/cube.h'
	rm -rf 'source/include'
	cd 'source/src'
	sed -i "s/CXXFLAGS= -O3/CXXFLAGS= ${_cxxflags} -O3/" 'Makefile'
}

build() {
	cd "${_srcdir}/source/src"
	CC=clang CXX=clang++ CFLAGS="${_cflags}" CXXFLAGS="${_cxxflags}" make
	make install
}

package_assaultcube-common() {
	install -dm755 "${pkgdir}/usr/share/games/${pkgbase}"
	
	cp -r "${_srcdir}"/{config,docs,bot} "${pkgdir}/usr/share/games/${pkgbase}"
	
	rm "${pkgdir}/usr/share/games/${pkgbase}/config/servercmdline.txt"
	find "${pkgdir}/usr/share/games/${pkgbase}/docs" -type f -exec chmod -R 0644 '{}' \;
	find "${pkgdir}/usr/share/games/${pkgbase}/docs" -type d -exec chmod -R 0755 '{}' \;
	
	install -Dm644 "${_srcdir}"/{README.html,README.md,SECURITY.md,GOVERNANCE.md} -t "${pkgdir}/usr/share/games/${pkgbase}"
	install -Dm644 "${_srcdir}/docs/package_copyrights.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_assaultcube-client() {
	depends=('assaultcube-common' 'sdl2' 'sdl2_image' 'openal' 'libvorbis' 'libgl')
	
	install -dm755 "${pkgdir}/usr/share/games/${pkgbase}"
	install -Dm755 "${_srcdir}"/{${pkgbase}.sh,check_install.sh,install_or_remove_menuitem.sh} \
		-t "${pkgdir}/usr/share/games/${pkgbase}"
	install -Dm755 "${_srcdir}/bin_unix"/*_client "${pkgdir}/usr/share/games/${pkgbase}/bin_unix/native_client"
	cp -r "${_srcdir}"/{demos,mods,packages} "${pkgdir}/usr/share/games/${pkgbase}"
	install -Dm644 "${_srcdir}/packages/misc/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgbase}.png"
	install -Dm644 "${pkgbase}.desktop" "${pkgdir}/usr/share/applications/${pkgbase}.desktop"
	install -Dm755 "${pkgbase}" "${pkgdir}/usr/bin/${pkgbase}"
}

package_assaultcube-server() {
	depends=('assaultcube-common' 'systemd')
	backup=('etc/assaultcube/servercmdline.txt')
	
	install -Dm755 "${pkgbase}-server" "${pkgdir}/usr/bin/${pkgbase}-server"
	
	install -dm755 "${pkgdir}/usr/share/games/${pkgbase}/config"
	install -Dm644 "${_srcdir}/config/servercmdline.txt" "${pkgdir}/etc/${pkgbase}/servercmdline.txt"
	
	install -Dm755 "${_srcdir}/bin_unix"/*_server "${pkgdir}/usr/share/games/${pkgbase}/bin_unix/native_server"
	install -Dm755 "${_srcdir}"/{server.sh,server_wizard.sh} -t "${pkgdir}/usr/share/games/${pkgbase}"
	
	install -Dm644 "systemd-sysuser.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgbase}.conf"
	install -Dm644 "systemd-${pkgbase}-server.service" "${pkgdir}/usr/lib/systemd/system/${pkgbase}-server.service"
}
