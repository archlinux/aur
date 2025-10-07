# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=ocompiler
_pkgname_atsource=o
pkgver=5+239
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
sha256sums=('533d99c791e5fde74d4f5c621e36c7a7f7ab02773f259948096b504c0e03cd39'
            'b86af0c430c0229fa57d765941fd6992471f6b885046a886d2b6bf2e65a73b9a')

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
