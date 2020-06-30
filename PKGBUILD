# Maintainer: Vladimir Borisov <vladimir@stremio.com>
# Contributor: Prasad Kumar
_pkgname=stremio
pkgname=${_pkgname}-beta
pkgver=4.4.116
pkgrel=1
pkgdesc="Watch videos, movies, TV series and TV channels instantly. (Beta Version)"
arch=(any)
url="https://www.stremio.com"
license=("MIT")
groups=()
depends=("nodejs" "ffmpeg" "qt5-webengine" "qt5-webchannel" "qt5-declarative" "qt5-quickcontrols" "qt5-quickcontrols2" "qt5-translations" "mpv" "openssl")
makedepends=("git" "wget" "qt5-tools" "librsvg")
provides=("${pkgname}")
conflicts=("${pkgname}" "stremio-legacy" "stremio")

install=${_pkgname}.install

source=("${_pkgname}::git+https://github.com/Stremio/stremio-shell.git#tag=v${pkgver}")
noextract=()
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/${_pkgname}"
	grep -oPm1 'VERSION=\K.+' stremio.pro
	# Git, tags available
	#printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${_pkgname}"

	git submodule update --init
	make -f release.makefile clean
}

build() {
	cd "$srcdir/${_pkgname}"
	make -f release.makefile PREFIX="$pkgdir"
}

package() {
	cd "$srcdir/${_pkgname}"
	export PREFIX="$pkgdir";
	make -f release.makefile install
}
