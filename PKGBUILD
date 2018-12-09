# Maintainer: Viech <viech unvanquished net>
# Contributor: Gereon Schomber
# Contributor: Martin F. Schumann

pkgname=unvanquished
pkgver=0.51.1
pkgrel=1
pkgdesc='A team-based, fast-paced, fps/rts hybrid game which pits aliens against humans. Monthly alpha release.'
arch=('x86_64' 'i686')
url='http://www.unvanquished.net'
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
backup=('etc/conf.d/unvanquished.conf' 'etc/unvanquished/server.cfg' 'etc/unvanquished/maprotation.cfg')
install='unvanquished.install'

# Unvanquished refers to the game's branding and gamelogic.
# Note that the gamelogic is not compiled here but shipped in unvanquished-data.
_unvver="archlinux/${pkgver}-${pkgrel}"
_unvdir="Unvanquished-${_unvver/\//-}"

# Dæmon is the game's engine.
_daemonver="v${pkgver}"
_daemondir="Daemon-${pkgver}"

# breakpad, crunch, and recastnavigation are Dæmon submodules.
_breakpadver=15fbc760aa1e4db2a3b36493ff3b4cf49e3df282
_crunchver=559a1b045b50b5f716294b47325c0170c8236dbc
_recastver=6b68934d6d2715501e01b1e115413cefaa0aa7d3
_breakpaddir="breakpad-${_breakpadver}"
_crunchdir="crunch-${_crunchver}"
_recastdir="recastnavigation-${_recastver}"

# NaCL SDK is a buildtime dependency of Dæmon.
# Note that due to enormous compile times, we use a binary distribution.
_naclsdkbasever="4"
if test "$CARCH" == "x86_64"; then
	_naclsdkarch=linux64
else
	_naclsdkarch=linux32
fi
_naclsdkver="${_naclsdkarch}-${_naclsdkbasever}"
_naclsdkdir="${_naclsdkver}"

source=("unvanquished.install"
        "unvanquished_${pkgver}.tar.gz::https://github.com/Unvanquished/Unvanquished/archive/${_unvver}.tar.gz"
        "daemon_${pkgver}.tar.gz::https://github.com/DaemonEngine/Daemon/archive/${_daemonver}.tar.gz"
        "breakpad_${_breakpadver}.tar.gz::https://github.com/DaemonEngine/breakpad/archive/${_breakpadver}.tar.gz"
        "crunch_${_crunchver}.tar.gz::https://github.com/DaemonEngine/crunch/archive/${_crunchver}.tar.gz"
        "recast_${_recastver}.tar.gz::https://github.com/DaemonEngine/recastnavigation/archive/${_recastver}.tar.gz"
	"naclsdk_${_naclsdkver}.tar.bz2::https://dl.unvanquished.net/deps/${_naclsdkver}.tar.bz2")

# The prepare function mimics the git submodule dance.
prepare() {
	cd "${srcdir}"

	# From Unvanquished: Remove an empty Dæmon submodule directory.
	rmdir --ignore-fail-on-non-empty "${_unvdir}/daemon"

	# From Dæmon: Remove empty submodule directories.
	rmdir --ignore-fail-on-non-empty "${_daemondir}/libs/breakpad"
	rmdir --ignore-fail-on-non-empty "${_daemondir}/libs/crunch"
	rmdir --ignore-fail-on-non-empty "${_daemondir}/libs/recastnavigation"

	# Link Dæmon in the Unvanquished source tree.
	ln -sfr "${_daemondir}"          "${_unvdir}/daemon"

	# Link the NaCL SDK in the Dæmon source tree.
	ln -sfr "${_naclsdkdir}"         "${_unvdir}/daemon/external_deps/${_naclsdkdir}"

	# Link Dæmon's submodules.
	ln -sfr "${_breakpaddir}"        "${_daemondir}/libs/breakpad"
	ln -sfr "${_crunchdir}"          "${_daemondir}/libs/crunch"
	ln -sfr "${_recastdir}"          "${_daemondir}/libs/recastnavigation"
}

build() {
	cd "${srcdir}/${_unvdir}"

	mkdir -p build
	cd build

	cmake -D BUILD_CGAME=OFF -D BUILD_SGAME=OFF ..
	make
}

package() {
	# create installation directories
	cd "${pkgdir}"

	install -dm755 \
		etc/conf.d \
		etc/unvanquished \
		usr/bin \
		usr/lib/systemd/system \
		usr/lib/unvanquished \
		usr/share/applications \
		usr/share/icons/hicolor/128x128/apps \
		usr/share/licenses/unvanquished \
		usr/share/unvanquished/pkg \
		var/lib/unvanquished-server/config \
		var/lib/unvanquished-server/game

	# install content
	cd "${srcdir}/${_unvdir}"

	install -m 644 debian/unvanquished.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/"
	install -m 644 COPYING.txt             "${pkgdir}/usr/share/licenses/unvanquished/"

	cd "${srcdir}/${_unvdir}/build"

	install -m 755 daemon                  "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 daemonded               "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 daemon-tty              "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 irt_core-x86*.nexe      "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 nacl_helper_bootstrap   "${pkgdir}/usr/lib/unvanquished/"
	install -m 755 nacl_loader             "${pkgdir}/usr/lib/unvanquished/"

	# install starters and dedicated server config
	cd "${srcdir}/${_unvdir}/archlinux"

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

md5sums=('6d9430b5b06b93a43a1cb79e14637f0b'
         '9335bff250618ab2bab6d11437d6f3ac'
         '589523f6028bcd3869505b6a3968c411'
         '256f388e18018f638958a47f53f2a8d9'
         '356bbda9890f48dca1db3b80001d40c0'
	 '2b1989f17e3ae0cab77cae8d397deafb')
if test "$CARCH" == "x86_64"; then
	md5sums+=('2ba12c71625919ddc282172b74fa4887')
else
	md5sums+=('dd2cb5419bac9a1b81a8a996312e33ff')
fi
