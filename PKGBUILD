# Maintainer: PopeRigby <poperigby at tuta dot io>

pkgname=daemon-engine
pkgver=0.51.1
pkgrel=1
pkgdesc="The standalone engine that powers the multiplayer first person shooter Unvanquished."
arch=('x86_64' 'i686')
url='http://unvanquished.net'
license=('BSD' 'GPL3')
makedepends=('cmake')
depends=('zlib' 'gmp' 'nettle' 'geoip' 'curl' 'sdl2' 'glew' 'libpng'
         'libjpeg>=8.0.0' 'libwebp>=0.2.0' 'freetype2' 'openal' 'libogg'
         'libvorbis' 'libtheora' 'opusfile' 'ncurses')

# Daemon is the game's engine.
_daemonver="v${pkgver}"
_daemondir="Daemon-${pkgver}"

# breakpad, crunch, and recastnavigation are Daemon submodules.
_breakpadver=15fbc760aa1e4db2a3b36493ff3b4cf49e3df282
_crunchver=559a1b045b50b5f716294b47325c0170c8236dbc
_recastver=6b68934d6d2715501e01b1e115413cefaa0aa7d3
_breakpaddir="breakpad-${_breakpadver}"
_crunchdir="crunch-${_crunchver}"
_recastdir="recastnavigation-${_recastver}"

# NaCL SDK is a buildtime dependency of Daemon.
# Note that due to enormous compile times, we use a binary distribution.
_naclsdkbasever="4"
if test "$CARCH" == "x86_64"; then
	_naclsdkarch=linux64
else
	_naclsdkarch=linux32
fi
_naclsdkver="${_naclsdkarch}-${_naclsdkbasever}"
_naclsdkdir="${_naclsdkver}"

source=("daemon_${pkgver}.tar.gz::https://github.com/DaemonEngine/Daemon/archive/${_daemonver}.tar.gz"
        "breakpad_${_breakpadver}.tar.gz::https://github.com/DaemonEngine/breakpad/archive/${_breakpadver}.tar.gz"
        "crunch_${_crunchver}.tar.gz::https://github.com/DaemonEngine/crunch/archive/${_crunchver}.tar.gz"
        "recast_${_recastver}.tar.gz::https://github.com/DaemonEngine/recastnavigation/archive/${_recastver}.tar.gz"
	"naclsdk_${_naclsdkver}.tar.bz2::https://dl.unvanquished.net/deps/${_naclsdkver}.tar.bz2")

# The prepare function mimics the git submodule dance.
prepare() {
	cd "${srcdir}"

	# From Daemon: Remove empty submodule directories.
	rmdir --ignore-fail-on-non-empty "${_daemondir}/libs/breakpad"
	rmdir --ignore-fail-on-non-empty "${_daemondir}/libs/crunch"
	rmdir --ignore-fail-on-non-empty "${_daemondir}/libs/recastnavigation"

	# Link the NaCL SDK in the Dæmon source tree.
    	ln -sfr "${_naclsdkdir}"         "${_daemondir}/external_deps/${_naclsdkdir}"

    	# Link Dæmon's submodules.
    	ln -sfr "${_breakpaddir}"        "${_daemondir}/libs/breakpad"
    	ln -sfr "${_crunchdir}"          "${_daemondir}/libs/crunch"
    	ln -sfr "${_recastdir}"          "${_daemondir}/libs/recastnavigation"
}

build() {
	cd "${srcdir}/${_daemondir}"

	mkdir -p build
	cd build

	cmake -D BUILD_CGAME=OFF -D BUILD_SGAME=OFF ..
	make
}

package() {
	# create installation directories
	cd "${pkgdir}"

	install -dm755 \
		usr/lib/daemon-engine \
		usr/share/licenses/daemon-engine

	# install content
	cd "${srcdir}/${_daemondir}"

	install -m 644 COPYING.txt             "${pkgdir}/usr/share/licenses/daemon-engine/"

	cd "${srcdir}/${_daemondir}/build"

	install -m 755 daemon                  "${pkgdir}/usr/lib/daemon-engine/"
	install -m 755 daemonded               "${pkgdir}/usr/lib/daemon-engine/"
	install -m 755 daemon-tty              "${pkgdir}/usr/lib/daemon-engine/"
	install -m 755 irt_core-x86*.nexe      "${pkgdir}/usr/lib/daemon-engine/"
	install -m 755 nacl_helper_bootstrap   "${pkgdir}/usr/lib/daemon-engine/"
	install -m 755 nacl_loader             "${pkgdir}/usr/lib/daemon-engine/"
}

md5sums=('589523f6028bcd3869505b6a3968c411'
         '256f388e18018f638958a47f53f2a8d9'
         '356bbda9890f48dca1db3b80001d40c0'
         '2b1989f17e3ae0cab77cae8d397deafb'
         '2ba12c71625919ddc282172b74fa4887')
