# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=ocompiler
pkgname_atsource=o
pkgver=1.5+227
pkgrel=1
pkgdesc="O language compiler"
arch=('x86_64')
url="https://github.com/colin-i/${pkgname_atsource}"
license=('0BSD')
depends=('lib32-glibc')
makedepends=('lib32-glibc' 'bc')
source=("${pkgname_atsource}-`echo ${pkgver} | sed 's/\./\-/'`.tar.gz::https://github.com/colin-i/${pkgname_atsource}/archive/`echo ${pkgver} | sed 's/\./\-/'`.tar.gz"
	"obj.txt.gz::https://github.com/colin-i/${pkgname_atsource}/releases/download/`echo ${pkgver} | sed 's/\./\-/'`/obj.txt.gz")
sha256sums=('b5a413a7db940ef0ee90d3521bcf6afd1f85df2246a5b6690fd4f098cf896fae'
            '1ac90e44a23448913f3b719ef4e7ffd3162cb1958a6ae857c1bc50d13d491a19')

_ver_atsource_fn() {
	cd "${pkgname_atsource}-`echo ${pkgver} | sed 's/\./\-/; s/+/\-/'`"
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
