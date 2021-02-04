# Maintainer: Alexander Nicholi <me@nicholatian.com>

pkgname=mingw-w64-unilib
pkgver=1.3.5
pkgrel=1
pkgdesc='unilib, the ANSI C support library (MinGW-W64)'
arch=('any')
url="https://github.com/aquefir/{$pkgname#mingw-w64-}"
license=('BSD')
makedepends=(mingw-w64-gcc 'slick>=1.3.1')
depends=(mingw-w64-crt)
options=(!libtool !buildflags)
provides=("$pkgname")
conflicts=("$pkgname")
_symver=1.1.2
source=("https://github.com/aquefir/${pkgname#mingw-w64-}/archive/v${_symver}-$pkgver.tar.gz")
sha1sums=('47f300471b36dfbddf1bb48103d3bbcfa6072782')

_subprojects='arr chkmath decl endian err futils himem log str mt19937'

prepare() {
	cp -rp "$srcdir/${pkgname#mingw-w64-}-${_symver}-$pkgver" "$srcdir/win32"
	mv "${pkgname#mingw-w64-}-${_symver}-$pkgver" "$srcdir/win64"
}

build() {
	cd "$srcdir/win64"

	if [ "$(uname -s)" = 'Darwin' ]; then
		_make=gmake
		_cores=$(($(sysctl -n hw.ncpu) * 2))
	else
		_make=make
		_cores=$(($(nproc) * 2))
	fi

	for _subproj in ${_subprojects}; do
		cd "${_subproj}"
		${_make} -j${_cores} release TP=WIN64
		cd ..
	done

	cd "$srcdir/win32"

	# 32-bit Windows
	for _subproj in ${_subprojects}; do
		cd "${_subproj}"
		${_make} -j${_cores} release TP=Win32
		cd ..
	done
}

package() {
	cd "$srcdir/win64"

	if [ "$(uname -s)" = 'Darwin' ]; then
		_make=gmake
		_prefix="${pkgdir}/usr/local/x86_64-w64-mingw32"
	else
		_make=make
		_prefix="${pkgdir}/usr/x86_64-w64-mingw32"
	fi

	mkdir -p "${_prefix}"

	cd log
	${_make} -i install PREFIX="${_prefix}" TP=WIN64
	cd ..
	for _subproj in ${_subprojects}; do
		cd "${_subproj}"
		${_make} install PREFIX="${_prefix}" TP=WIN64
		cd ..
	done

	cd "$srcdir/win32"

	if [ "$(uname -s)" = 'Darwin' ]; then
		_prefix="${pkgdir}/usr/local/i686-w64-mingw32"
	else
		_prefix="${pkgdir}/usr/i686-w64-mingw32"
	fi

	mkdir -p "${_prefix}"

	cd log
	${_make} -i install PREFIX="${_prefix}" TP=WIN32
	cd ..
	for _subproj in ${_subprojects}; do
		cd "${_subproj}"
		${_make} install PREFIX="${_prefix}" TP=WIN32
		cd ..
	done
}
