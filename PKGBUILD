# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: xantares <xantares09@hotmail.com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Iwan Timmer <irtimmer@gmail.com>
# Contributor: Ricardo Band <me [at] xengi [dot] de>

pkgname=popcorntime
pkgver=0.3.9
pkgrel=3
pkgdesc="Stream movies from torrents. Skip the downloads. Launch, click, watch."
arch=('i686' 'x86_64')
url="http://popcorntime.sh/"
license=('GPL3')
makedepends=(
	'npm'
	'bower'
	'nodejs-grunt-cli'
	'gulp'
	'git'
)
depends=(
	'alsa-lib'
	'gconf'
	'gtk2'
	'libnotify'
	'libxtst'
	'nss'
	'ttf-font'
)
optdepends=('net-tools: vpn.ht client')
options=('!strip')
#install="popcorntime.install"
# Needed variables for sources downloads
_commit_hash="18156908dd1580db889f6fcb3d8dfe0fd3214808"
_pkgname="popcorn-desktop"
source=(
	"${_pkgname}_${pkgver}.tar.gz::https://github.com/popcorn-official/popcorn-desktop/archive/${_commit_hash}.tar.gz"
	"popcorntime.desktop"
)
sha256sums=('31b893cbcd730a0bc3be81566fee4de8d40a7071df88fba473fe95f1b8b107fe'
            '4422f21e16176fda697ed0c8a6d1fb6f9dd7c4bc3f3694f9bcc19cbe66630334')

# Useful variables for builds
[ "$CARCH" = "i686" ]   && _platform=linux32
[ "$CARCH" = "x86_64" ] && _platform=linux64
_srcdir="${_pkgname}-${_commit_hash}"
_bpath="${_srcdir}/build/Popcorn-Time/${_platform}"

# Building the package
prepare() {
	cd "${_srcdir}"

	#export PYTHON=/usr/bin/python2

	# Hacky way to only build
	sed 's/gulp start/gulp build/g' -i package.json

	npm install
}

build() {
	cd "${_srcdir}"

	npm start
}

package() {
	cd "${srcdir}/${_bpath}"

	mkdir -p "${pkgdir}/usr/share/${pkgname}"
	mkdir -p "${pkgdir}/usr/bin"

	find . -type f -exec install -D {} ${pkgdir}/usr/share/${pkgname}/{} \;

	install -Dm644 "${srcdir}/${_srcdir}/src/app/images/icon.png" "${pkgdir}/usr/share/pixmaps/popcorntime.png"
	chmod +x "${pkgdir}/usr/share/${pkgname}/Popcorn-Time"

	ln -s "/usr/share/${pkgname}/Popcorn-Time" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "${srcdir}/popcorntime.desktop" "${pkgdir}/usr/share/applications/popcorntime.desktop"
}
