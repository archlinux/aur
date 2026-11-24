# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=ocompiler
_pkgname_atsource=o
pkgver=5+251
_pkgver_atsource=`echo ${pkgver} | sed s/+/-/`
pkgrel=1
_rel_at_source=0
pkgdesc="O language compiler"
arch=('x86_64')
url="https://github.com/colin-i/${_pkgname_atsource}"
license=('0BSD')
depends=('lib32-glibc')
makedepends=('bc')

source=("${pkgname}-${pkgver}-${_rel_at_source}.tar.gz::https://github.com/colin-i/${_pkgname_atsource}/archive/${pkgname}-${pkgver}-${_rel_at_source}.tar.gz"
	"${pkgname}-${pkgver}-${_rel_at_source}-obj.txt.gz::https://github.com/colin-i/${_pkgname_atsource}/releases/download/${pkgname}-${pkgver}-${_rel_at_source}/obj.txt.gz")
sha256sums=('0438442f701881416865b31a9bb3e35accf0b0f870044a4ca1c0d978a12e4035'
            'aa38a1485e1e6cbf1e39f4a4fbd0fabc73ae109bb507d9c1456d165e7ff1d2cf')

_ver_atsource_fn() {
	cd "${_pkgname_atsource}-${pkgname}-${_pkgver_atsource}-${_rel_at_source}"
}

prepare() {
	_patches="`cat ../list`"
	_ver_atsource_fn
	for _var in ${_patches[@]}; do
		echo ${_var}
		patch --strip=1 --input=../../${_var}
	done
	ln "../${pkgname}-${pkgver}-${_rel_at_source}-obj.txt" src/obj.txt
	touch include_dev
}

build() {
	_ver_atsource_fn
	L=-L/usr/lib32 make
}

check() {
	_ver_atsource_fn
	L=-L/usr/lib32 make test
}

package() {
	_ver_atsource_fn
	make DESTDIR="$pkgdir/" install
}
