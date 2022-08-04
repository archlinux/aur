# Maintainer: Mattias Giese <mattias.giese@posteo.net>
pkgname=beammp-server
_pkgname=BeamMP-Server
pkgver=v3.0.1.r38.05251ef
_pkgver=3.0.2
pkgrel=1
pkgdesc="Server for BeamMP, providing multiplayer support for the driving simulator beamng.drive"
arch=(x86_64)
url="https://beammp.com/"
license=('proprietary')
groups=()
depends=('lua53' 'zlib' 'openssl' 'rapidjson' 'boost' 'websocketpp')
makedepends=('git' 'gcc' 'make' 'cmake') # 'bzr', 'git', 'mercurial' or 'subversion'
replaces=()
backup=()
options=()
install=
source=("git+https://github.com/BeamMP/${_pkgname}.git#tag=v${_pkgver}" "beammp.sysusers" "beammp.service")
noextract=()
md5sums=('SKIP' 'SKIP' 'SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${_pkgname}"

# The examples below are not absolute and need to be adapted to each repo. The
# primary goal is to generate version numbers that will increase according to
# pacman's version comparisons with later commits to the repo. The format
# VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH
# are not available, is recommended.

# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${_pkgname}"
	git submodule update --init --recursive
}

build() {
	cd "$srcdir/${_pkgname}"
	cmake . -DCMAKE_BUILD_TYPE=Release
	make
}

check() {
	true
}

package() {
	install -D beammp.sysusers "${pkgdir}/usr/lib/sysusers.d/beammp.conf"
	install -D beammp.service "${pkgdir}/usr/lib/systemd/system/beammp.service"
	cd "$srcdir/${_pkgname}"
	install -D BeamMP-Server "${pkgdir}/opt/beammp/beammp-server"
}
