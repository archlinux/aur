# Maintainer: Alexander Nicholi <me@nicholatian.com>
pkgname=unilib
pkgver=1.3.4
pkgrel=1
epoch=
pkgdesc='unilib, the ANSI C support library'
arch=('i686' 'x86_64')
url="https://github.com/aquefir/$pkgname"
license=('BSD')
depends=()
makedepends=('slick>=1.2.2')
provides=("$pkgname")
conflicts=("$pkgname")
_symver=1.1.2
source=("https://github.com/aquefir/$pkgname/archive/v${_symver}-$pkgver.tar.gz")
sha1sums=('e8b9f29561477ed27cd02cd8be1b6061bb82cf70')

_subprojects='arr chkmath decl endian err futils himem log str'

build() {
	cd "$srcdir/$pkgname-${_symver}-$pkgver"
	if [ "$(uname -s)" = 'Darwin' ]; then
		_make=gmake
	else
		_make=make
	fi
	for _subproj in ${_subprojects}; do
		cd "${_subproj}"
		${_make} -j$(($(nproc) * 2))
		cd ..
	done
}

package() {
	cd "$srcdir/$pkgname-${_symver}-$pkgver"
	if [ "$(uname -s)" = 'Darwin' ]; then
		_make=gmake
		_prefix="${pkgdir}/usr/local"
	else
		_make=make
		_prefix="${pkgdir}/usr"
	fi
	for _subproj in ${_subprojects}; do
		cd "${_subproj}"
		${_make} install PREFIX="${_prefix}"
		cd ..
	done
}
