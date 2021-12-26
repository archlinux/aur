# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgbase=assaultcube
pkgname=(${pkgbase}-client ${pkgbase}-server ${pkgbase}-common)
pkgver=1.3.0.0
pkgrel=5
pkgdesc='A game based on the open-source AssaultCube first-person shooter (FPS)'
arch=('i686' 'x86_64' 'armv7h')
url='https://assault.cubers.net/'
license=('ZLIB' 'custom')
depends=('zlib' 'gcc-libs')
makedepends=('mesa' 'clang' 'sdl2' 'sdl2_image' 'openal' 'libvorbis' 'libgl')
source=("https://github.com/assaultcube/AC/releases/download/v${pkgver}/AssaultCube_v${pkgver}_LockdownEdition.tar.bz2"
        'assaultcube'
        'assaultcube-server'
        'assaultcube.desktop'
        'systemd-sysuser.conf'
        'systemd-assaultcube-server.service')
sha512sums=('3b5fa28c873a3c45a374855dcf99005ac0ce2ff411a9f4b360e6afc72fe7846803d71f1584b18c8b1ef8e5e62dee640f58d9f2ea9bda941db50ad9bea3f0ded0'
            '6ecfb0320f8f63d3c220032a0e267bd81f89ed33d415991a83e7a662769eec6dcdf374fcf0d4f7e893c0dcd58598379d49cc52550b5907769fdbc6c428013d91'
            '363fbee6e2561677eb7bc1f9d77e1431758063f3ceaf86fd0878c0e376fb9921ad90285dc961b6afaf9b40fa545f9cbb659aaf039e134b8b4c85510916d1a4e2'
            '7510796bd47934e897887123a2b146607a8ca04a521a7d6cd744ea823aa3d13f8c90d87c78d322ffbf0e6178aa34fdbe907e60aeda447532bdb1b373471e3e3a'
            '1506fd102d70b7cbe838f2e55725cd2f70c15174b119b077060f6e20041826fef3f6d6a18c4138a3d883162692258d2057f5511682048dfeaafc613e5c63f580'
            'b27d30c162344119acda03943dc93cc677c8373cd54e8aec14083dfbef42ecb15cedf6e9412e9530d4daa8ebb62b882de016f62ecbcdcc838af42a3f8f3b2b97')

_srcdir='.'

prepare() {
	cd "${_srcdir}"
	sed -i 's/libSDL-1.2/libSDL-2.0/' 'check_install.sh'
	sed -i 's|CUBE_OPTIONFILE=-Cconfig/servercmdline.txt|CUBE_OPTIONFILE=-C/etc/assaultcube/servercmdline.txt|' 'server.sh'
	rm -rf 'source/include'
	cd 'source/src'
	FLAGS=${CLANG_CXXFLAGS:-}
	check_option 'lto' 'y' && FLAGS+=' -flto'
	sed -i "s/CXXFLAGS= -O3/CXXFLAGS= ${FLAGS} -O3/" 'Makefile'
}

build() {
	cd "${_srcdir}/source/src"
	make
}

package_assaultcube-common() {
	install -dm755 "${pkgdir}/usr/share/games/assaultcube"
	
	cp -r "${_srcdir}"/{config,docs,bot} "${pkgdir}/usr/share/games/assaultcube"
	
	rm "${pkgdir}/usr/share/games/assaultcube/config/servercmdline.txt"
	find "${pkgdir}/usr/share/games/assaultcube/docs" -type f -exec chmod -R 0644 '{}' \;
	find "${pkgdir}/usr/share/games/assaultcube/docs" -type d -exec chmod -R 0755 '{}' \;
	
	install -Dm644 "${_srcdir}"/{README.html,README.md,SECURITY.md,GOVERNANCE.md} -t "${pkgdir}/usr/share/games/assaultcube"
	install -Dm644 "${_srcdir}/docs/package_copyrights.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_assaultcube-client() {
	depends=('assaultcube-common' 'sdl2' 'sdl2_image' 'openal' 'libvorbis' 'libgl')
	
	install -dm755 "${pkgdir}/usr/share/games/assaultcube"
	install -Dm755 "${_srcdir}"/{assaultcube.sh,check_install.sh,install_or_remove_menuitem.sh} \
		-t "${pkgdir}/usr/share/games/assaultcube"
	install -Dm755 "${_srcdir}/bin_unix"/*_client "${pkgdir}/usr/share/games/assaultcube/bin_unix/native_client"
	cp -r "${_srcdir}"/{demos,mods,packages} "${pkgdir}/usr/share/games/assaultcube"
	install -Dm644 "${_srcdir}/packages/misc/icon.png" "${pkgdir}/usr/share/pixmaps/assaultcube.png"
	install -Dm644 'assaultcube.desktop' "${pkgdir}/usr/share/applications/assaultcube.desktop"
	install -Dm755 'assaultcube' "${pkgdir}/usr/bin/assaultcube"
}

package_assaultcube-server() {
	depends=('assaultcube-common' 'systemd')
	backup=('etc/assaultcube/servercmdline.txt')
	
	install -Dm755 'assaultcube-server' "${pkgdir}/usr/bin/assaultcube-server"
	
	install -dm755 "${pkgdir}/usr/share/games/assaultcube/config"
	install -Dm644 "${_srcdir}/config/servercmdline.txt" "${pkgdir}/etc/assaultcube/servercmdline.txt"
	
	install -Dm755 "${_srcdir}/bin_unix"/*_server "${pkgdir}/usr/share/games/assaultcube/bin_unix/native_server"
	install -Dm755 "${_srcdir}"/{server.sh,server_wizard.sh} -t "${pkgdir}/usr/share/games/assaultcube"
	
	install -Dm644 "${_srcdir}/systemd-sysuser.conf" "${pkgdir}/usr/lib/sysusers.d/assaultcube.conf"
	install -Dm644 "${_srcdir}/systemd-assaultcube-server.service" "${pkgdir}/usr/lib/systemd/system/assaultcube-server.service"
}
