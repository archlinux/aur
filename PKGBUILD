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
pkgrel=1
pkgdesc="Stream movies from torrents. Skip the downloads. Launch, click, watch."
arch=('i686' 'x86_64')
url="http://popcorntime.sh/"
license=('GPL3')
makedepends=(
	'bower'
	'nodejs-grunt-cli'
	'npm'
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
install="popcorntime.install"
# Needed variables for sources downloads
_commit_hash="7d66143b05813b6541be37a767be4e06f323249f"
_pkgname="popcorn-desktop"
source=(
	"${_pkgname}_${pkgver}.zip::https://github.com/popcorn-official/popcorn-desktop/archive/${_commit_hash}.zip"
	"popcorntime.desktop"
)
sha256sums=('2e8eb0882fad29e1b8c0175eee9af4f84bc644c5df143e030ef3a0843b5abf7f'
            '4422f21e16176fda697ed0c8a6d1fb6f9dd7c4bc3f3694f9bcc19cbe66630334')

# Useful variables for builds
_srcdir="${_pkgname}-${_commit_hash}"
_platform=linux64
if [ "$CARCH" = 'i686' ]; then
  _platform=linux32
fi
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
