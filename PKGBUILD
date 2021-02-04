# Maintainer: Alexander Nicholi <me@nicholatian.com>
pkgname=agb-armv4t-eabi-unilib
pkgver=1.3.5
pkgrel=1
epoch=
pkgdesc='unilib, the ANSI C support library (GBA)'
arch=('any')
url="https://github.com/aquefir/${pkgname#agb-armv4t-eabi-}"
license=('BSD')
depends=()
makedepends=('slick>=1.3.1')
provides=("$pkgname")
conflicts=("$pkgname")
_symver=1.1.2
source=("https://github.com/aquefir/${pkgname#agb-armv4t-eabi-}/archive/v${_symver}-$pkgver.tar.gz")
sha1sums=('47f300471b36dfbddf1bb48103d3bbcfa6072782')

_subprojects='arr chkmath decl endian err futils himem log str mt19937'

build() {
	cd "$srcdir/${pkgname#agb-armv4t-eabi-}-${_symver}-$pkgver"

	if [ "$(uname -s)" = 'Darwin' ]; then
		_make=gmake
		_cores=$(($(sysctl -n hw.ncpu) * 2))
	else
		_make=make
		_cores=$(($(nproc) * 2))
	fi

	for _subproj in ${_subprojects}; do
		cd "${_subproj}"
		${_make} -j${_cores} release TP=GBA
		cd ..
	done
}

package() {
	cd "$srcdir/${pkgname#agb-armv4t-eabi-}-${_symver}-$pkgver"

	if [ "$(uname -s)" = 'Darwin' ]; then
		_make=gmake
		_prefix="${pkgdir}/usr/local/armv4t-agb-eabi"
	else
		_make=make
		_prefix="${pkgdir}/usr/armv4t-agb-eabi"
	fi

	mkdir -p "${_prefix}"

	cd log
	${_make} -i install PREFIX="${_prefix}" TP=GBA
	cd ..

	for _subproj in ${_subprojects}; do
		cd "${_subproj}"
		${_make} install PREFIX="${_prefix}" TP=GBA
		cd ..
	done
}
