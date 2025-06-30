# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=ocompiler
_pkgname_atsource=o
pkgver=5+235
_pkgver_atsource=`echo ${pkgver} | sed s/+/-/`
pkgrel=0
pkgdesc="O language compiler"
arch=('x86_64')
url="https://github.com/colin-i/${_pkgname_atsource}"
license=('0BSD')
depends=('lib32-glibc')
makedepends=('lib32-glibc' 'bc')

source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/colin-i/${_pkgname_atsource}/archive/${pkgname}-${pkgver}-${pkgrel}.tar.gz"
	"obj.txt.gz::https://github.com/colin-i/${_pkgname_atsource}/releases/download/${pkgname}-${pkgver}-${pkgrel}/obj.txt.gz")
sha256sums=('94b085c27bf1aa10431b02e07ba7703ddfd7ea675bf53ccc412d0cf0d9d6c4bf'
            'd4aac88fb73e127bc7cfe5c3bad62cd29450ceb99855dedbfdf2373ca2d20dd9')

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
