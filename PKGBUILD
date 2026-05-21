# Maintainer: Viech <viech unvanquished net>
# Contributor: Gereon Schomber
# Contributor: Martin F. Schumann

_naclsdkver=11 # If not correct, cmake will make a download.
pkgname=unvanquished
pkgver=0.56.2
pkgrel=3
pkgdesc='A team-based, fast-paced, fps/rts hybrid game that pits aliens against humans'
arch=(x86_64 aarch64)
url='https://www.unvanquished.net'
license=(GPL-3.0-or-later)
makedepends=(cmake)
depends=("unvanquished-data>=${pkgver}"
         'zlib' 'gmp' 'nettle' 'geoip' 'curl' 'sdl3' 'glew' 'libpng'
         'libjpeg-turbo' 'libwebp>=0.2.0' 'freetype2' 'openal' 'libogg'
         'libvorbis' 'speex' 'libtheora' 'opusfile' 'ncurses' 'xdg-utils'
         'desktop-file-utils' 'shared-mime-info' 'hicolor-icon-theme')
provides=('unvanquished')
conflicts=('unvanquished-git')
options=('emptydirs' '!strip')
backup=('etc/conf.d/unvanquished.conf'
        'etc/unvanquished/server.cfg'
        'etc/unvanquished/maprotation.cfg')
install=unvanquished.install

_archive="archive/refs/tags/unvanquished/${pkgver}.tar.gz"
_suffix="unvanquished-${pkgver}"
_unvanquished="Unvanquished-${_suffix}"
#_daemon="Daemon-${_suffix}" # TODO: Restore.
_daemon_ver="379d88a0687995b6cb6074368fcc68c163e5242d"
_daemon="Daemon-${_daemon_ver}"
_breakpad="breakpad-${_suffix}"
_crunch="crunch-${_suffix}"
_recast="recastnavigation-${_suffix}"
_naclsdkname="linux-amd64-default_${_naclsdkver}"

source=("unvanquished.install"
        "unvanquished.sh"
        "unvanquished-tty.sh"
        "unvanquished.conf"
        "unvanquished.desktop"
        "unvanquished.service"
        "unvanquished_${pkgver}.tar.gz::https://github.com/Unvanquished/Unvanquished/${_archive}"
        #"daemon_${pkgver}.tar.gz::https://github.com/DaemonEngine/Daemon/${_archive}" # TODO: Restore.
        "daemon_${pkgver}-nettlefix.tar.gz::https://github.com/DaemonEngine/Daemon/archive/${_daemon_ver}.tar.gz"
        "breakpad_${pkgver}.tar.gz::https://github.com/DaemonEngine/breakpad/${_archive}"
        "crunch_${pkgver}.tar.gz::https://github.com/DaemonEngine/crunch/${_archive}"
        "recastnavigation_${pkgver}.tar.gz::https://github.com/DaemonEngine/recastnavigation/${_archive}"
        "naclsdk_${_naclsdkver}.tar.xz::https://dl.unvanquished.net/deps/${_naclsdkname}.tar.xz")

sha256sums=('b6eb6d2f0a45512cb4b67245fc1454c6d8a2d4ea83ce203c06dcacc51ec411fd'
            '010e1c64a97a33612f88a11c7621cf69d02119732e151e230bc1fa985757eed7'
            '0eafaf9e5ed488bc91dcff7eb5f9917765f61583d23daba37bfc1035b1e1af24'
            '562a0c185dfed2b2dee6135a399b18eff0d5bc5380f19a89ba15fc63b6e2827f'
            '0b0bc478ad6e61dd17fdeb3265a6321d0ca2719eca7bbb432a4b4a497c58a7b0'
            '44df664e8737fd543818cebc1e506a33e724fc3fb73eee46813ec3648eff64a0'
            'd727baa67b19c69c65c155050bd9222c1fec7912c8c90f636036942ae4e6273e'
            'e68b64330c02180e1e363985705248bd3b93e6d05b11b5d632c399dca8bf8f3a'
            'b6e25aed236ec681856d875aa5057a15ce2b86737bd08e89d6af3864745ca2a9'
            '1863f38c82c172ed2902e6b8201d7df86b298bcc9c415589bbf9b1e306b4851c'
            '3bb68dcb6537081da4d972d5289fb217a023796c27e4a20807c16f152337c0b7'
            '970e997ccf50a2155fe68a35f9abf2c5c5967cb5686a4855baf0cca89235d28c')

# The prepare function mimics the git submodule dance.
prepare() {
	cd "${srcdir}"

	# From Unvanquished: Remove empty submodule directories.
	rmdir --ignore-fail-on-non-empty "${_unvanquished}/daemon"
	rmdir --ignore-fail-on-non-empty "${_unvanquished}/libs/recastnavigation"

	# From Dæmon: Remove empty submodule directories.
	rmdir --ignore-fail-on-non-empty "${_daemon}/libs/breakpad"
	rmdir --ignore-fail-on-non-empty "${_daemon}/libs/crunch"

	# Link Unvanquished's submodules.
	ln -sfr "${_daemon}"             "${_unvanquished}/daemon"
	ln -sfr "${_recast}"             "${_unvanquished}/libs/recastnavigation"

	# Link Dæmon's submodules.
	ln -sfr "${_breakpad}"           "${_daemon}/libs/breakpad"
	ln -sfr "${_crunch}"             "${_daemon}/libs/crunch"

	# Link the NaCL SDK in the Dæmon source tree.
	ln -sfr "${_naclsdkname}"        "${_daemon}/external_deps/${_naclsdkname}"

	# HACK: Fix unintended cmake-enforced hardening.
	#       This clashes with the setting in makepkg.conf (producing warnings).
	#       See https://github.com/DaemonEngine/Daemon/issues/1380.
	sed -i 's/(USE_HARDENING OR NOT MINGW)/(USE_HARDENING AND NOT MINGW)/' \
		"${_daemon}/cmake/DaemonFlags.cmake"
}

build() {
	cd "${srcdir}/${_unvanquished}"

	mkdir -p build
	cd build

	cmake \
		-D BUILD_CGAME=OFF \
		-D BUILD_SGAME=OFF \
		-D USE_BREAKPAD=ON \
		-D USE_EXTERNAL_DEPS_LIBS=OFF \
		..
	make
}

package() {
	cd "${pkgdir}"

	# Create installation directories.
	install -d -m 755 \
		etc/conf.d \
		etc/unvanquished \
		usr/bin \
		usr/lib/systemd/system \
		usr/lib/unvanquished \
		usr/share/applications \
		usr/share/licenses/unvanquished \
		usr/share/unvanquished/pkg \
		var/lib/unvanquished-server/config \
		var/lib/unvanquished-server/game

	# Install content.
	cd "${srcdir}"

	install -m 755 unvanquished.sh         "${pkgdir}/usr/bin/unvanquished"
	install -m 755 unvanquished-tty.sh     "${pkgdir}/usr/bin/unvanquished-tty"
	install -m 644 unvanquished.conf       "${pkgdir}/etc/conf.d/"
	install -m 644 unvanquished.service    "${pkgdir}/usr/lib/systemd/system/"
	install -m 644 unvanquished.desktop    "${pkgdir}/usr/share/applications/"

	cd "${srcdir}/${_unvanquished}"

	install -m 644 COPYING.txt             "${pkgdir}/usr/share/licenses/unvanquished/"

	cd "${srcdir}/${_unvanquished}/build"

	install -m 755 daemon                  "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 daemonded               "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 daemon-tty              "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 crash_server            "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 irt_core-*.nexe         "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 nacl_helper_bootstrap   "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 nacl_loader             "${pkgdir}/usr/lib/unvanquished/"

	if [ "${CARCH}" == "aarch64" ]; then
		armlibdir="${pkgdir}/usr/lib/unvanquished/lib-armhf"
		install -d -m 755 "${armlibdir}"
		install -m 755 nacl_helper_bootstrap-armhf "${pkgdir}/usr/lib/unvanquished/"
		install -m 755 lib-armhf/ld-linux-armhf "${armlibdir}"
		install -m 755 lib-armhf/lib*.so.* "${armlibdir}"
	fi

	cd "${srcdir}/${_unvanquished}/dist/configs"

	install -m 644 game/maprotation.cfg    "${pkgdir}/etc/unvanquished/"
	install -m 644 config/server.cfg       "${pkgdir}/etc/unvanquished/"

	cd "${srcdir}/${_unvanquished}/dist/icons"

	for resolution in $(ls -c1); do
		icondir="${pkgdir}/usr/share/icons/hicolor/${resolution}/apps"
		install -d -m 755 "${icondir}"
		install -m 644 "${resolution}/unvanquished.png" "${icondir}"
	done

	# setup server home directory
	cd "${pkgdir}/var/lib/unvanquished-server/config"

	ln -s ../../../../etc/unvanquished/server.cfg .

	cd "${pkgdir}/var/lib/unvanquished-server/game"

	ln -s ../../../../etc/unvanquished/maprotation.cfg .
}
