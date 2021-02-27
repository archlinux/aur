# Maintainer: Alexander Nicholi <me@nicholatian.com>
pkgname=neopolitan
pkgver=1.4.2
pkgrel=2
epoch=
pkgdesc='A new city of code on a cosmopolitan foundation.'
arch=('i686' 'x86_64')
url="https://github.com/aquefir/$pkgname"
license=('BSD')
depends=()
makedepends=('slick>=1.3.4')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/aquefir/$pkgname/archive/$pkgver.tar.gz")
sha1sums=('0ac40fabeb1edba634619bb22998ef1b1efc20fe')

_subprojects='arr chkmath clarg decl endian err futils himem log mt19937 str
	table'

build() {
	cd "$srcdir/$pkgname-$pkgver"
	if [ "$(uname -s)" = 'Darwin' ]; then
		_make=gmake
	else
		_make=make
	fi
	for _subproj in ${_subprojects}; do
		cd "${_subproj}"
		${_make} -j$(($(nproc) * 2)) release
		cd ..
	done
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	if [ "$(uname -s)" = 'Darwin' ]; then
		_make=gmake
		_prefix="${pkgdir}/usr/local/x86_64-pc-ape"
	else
		_make=make
		_prefix="${pkgdir}/usr/x86_64-pc-ape"
	fi
	mkdir -p "${_prefix}"
	for _subproj in ${_subprojects}; do
		cd "${_subproj}"
		${_make} install PREFIX="${_prefix}"
		cd ..
	done
}
