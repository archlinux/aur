# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=ocompiler
_pkgname_atsource=o
pkgver=5+241
_pkgver_atsource=`echo ${pkgver} | sed s/+/-/`
pkgrel=0
pkgdesc="O language compiler"
arch=('x86_64')
url="https://github.com/colin-i/${_pkgname_atsource}"
license=('0BSD')
depends=('lib32-glibc')
makedepends=('lib32-glibc' 'bc')

source=("${pkgname}-${pkgver}-0.tar.gz::https://github.com/colin-i/${_pkgname_atsource}/archive/${pkgname}-${pkgver}-0.tar.gz"
	"obj.txt.gz::https://github.com/colin-i/${_pkgname_atsource}/releases/download/${pkgname}-${pkgver}-0/obj.txt.gz")
sha256sums=('f07919fd117e40f91c7ded8130d6a1224555c44bf0a6742083ed0496d2b65ab2'
            'c346d57778c2b36a1d43dfca50c5e25a8e57d758224589923265dc13bd0e4cf4')

_ver_atsource_fn() {
	cd "$_pkgname_atsource-$pkgname-$_pkgver_atsource-0"
}

prepare() {
	_patches="`cat ../list`"
	_ver_atsource_fn
	for _var in ${_patches[@]}; do
		echo ${_var}
		patch --strip=1 --input=../../${_var}
	done
	ln ../obj.txt src
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
