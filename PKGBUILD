# Maintainer: Viech <viech unvanquished net>
# Contributor: Gereon Schomber
# Contributor: Martin F. Schumann

pkgname=unvanquished
pkgver=0.52.0
pkgrel=2
pkgdesc='A team-based, fast-paced, fps/rts hybrid game which pits aliens against humans.'
arch=('x86_64')
url='https://www.unvanquished.net'
license=('GPL3')
makedepends=('cmake')
depends=("unvanquished-data>=${pkgver}"
         'zlib' 'gmp' 'nettle' 'geoip' 'curl' 'sdl2' 'glew' 'libpng'
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

# Shorthand strings.
_archive="archive/refs/tags/unvanquished/${pkgver}.tar.gz"
_suffix="unvanquished-${pkgver}"
_unvanquished="Unvanquished-${_suffix}"
_daemon="Daemon-${_suffix}"
_breakpad="breakpad-${_suffix}"
_crunch="crunch-${_suffix}"
_recast="recastnavigation-${_suffix}"

# NaCL SDK is a buildtime dependency of Dæmon.
# NOTE: Due to enormous compile times, we use a binary distribution.
_naclsdk_base_ver=5
_naclsdk_ver="linux64-${_naclsdk_base_ver}"
_naclsdk="${_naclsdk_ver}"

source=("unvanquished.install"
        "unvanquished_${pkgver}.tar.gz::https://github.com/Unvanquished/Unvanquished/${_archive}"
        "daemon_${pkgver}.tar.gz::https://github.com/DaemonEngine/Daemon/${_archive}"
        "breakpad_${pkgver}.tar.gz::https://github.com/DaemonEngine/breakpad/${_archive}"
        "crunch_${pkgver}.tar.gz::https://github.com/DaemonEngine/crunch/${_archive}"
        "recastnavigation_${pkgver}.tar.gz::https://github.com/DaemonEngine/recastnavigation/${_archive}"
        "naclsdk_${_naclsdk_ver}.tar.bz2::https://dl.unvanquished.net/deps/${_naclsdk_ver}.tar.bz2")

md5sums=('6d9430b5b06b93a43a1cb79e14637f0b'
         '1821ecc4185d15145d78296249c7e612'
         '049b3aea1db9bfbc5664d035c7ae8ee9'
         '1610e084189b435a2e0614a07f8871d2'
         '733baa91bb57497be69b3912bd4f40f5'
         '37d95bd19b051238b03cfb30f1f27609'
         '3c2cceeb5c653c4e53543fc892377f38')

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
	ln -sfr "${_naclsdk}"            "${_daemon}/external_deps/${_naclsdk}"
}

build() {
	cd "${srcdir}/${_unvanquished}"

	mkdir -p build
	cd build

	cmake \
		-D BUILD_CGAME=OFF \
		-D BUILD_SGAME=OFF \
		-D USE_BREAKPAD=ON \
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
	cd "${srcdir}/${_unvanquished}"

	for resolution in $(ls -c1 dist/icons/); do
		icondir="${pkgdir}/usr/share/icons/hicolor/${resolution}/apps"
		install -d -m 755 "${icondir}"
		install -m 644 "dist/icons/${resolution}/unvanquished.png" "${icondir}"
	done

	install -m 644 COPYING.txt             "${pkgdir}/usr/share/licenses/unvanquished/"

	cd "${srcdir}/${_unvanquished}/build"

	install -m 755 daemon                  "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 daemonded               "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 daemon-tty              "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 crash_server            "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 irt_core-x86*.nexe      "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 nacl_helper_bootstrap   "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 nacl_loader             "${pkgdir}/usr/lib/unvanquished/"

	# install starters and dedicated server config
	# TODO: Use the distro-independent distribution files as much as possible,
	#       ship all archlinux-specific files with the AUR package.
	cd "${srcdir}/${_unvanquished}/archlinux"

	install -m 755 unvanquished.sh         "${pkgdir}/usr/bin/unvanquished"
	install -m 755 unvanquished-tty.sh     "${pkgdir}/usr/bin/unvanquished-tty"
	install -m 644 unvanquished.conf       "${pkgdir}/etc/conf.d/"
	install -m 644 unvanquished.service    "${pkgdir}/usr/lib/systemd/system/"
	install -m 644 unvanquished.desktop    "${pkgdir}/usr/share/applications/"
	install -m 644 configs/maprotation.cfg "${pkgdir}/etc/unvanquished/"
	install -m 644 configs/server.cfg      "${pkgdir}/etc/unvanquished/"

	# setup server home directory
	cd "${pkgdir}/var/lib/unvanquished-server/config"

	ln -s ../../../../etc/unvanquished/server.cfg .

	cd "${pkgdir}/var/lib/unvanquished-server/game"

	ln -s ../../../../etc/unvanquished/maprotation.cfg .
}
