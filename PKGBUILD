# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=ocompiler
pkgname_atsource=o
pkgver=1.5+229
pkgrel=1
pkgdesc="O language compiler"
arch=('x86_64')
url="https://github.com/colin-i/${pkgname_atsource}"
license=('0BSD')
depends=('lib32-glibc')
makedepends=('lib32-glibc' 'bc')
source=("${pkgname_atsource}-`echo ${pkgver} | sed 's/\./\-/'`.tar.gz::https://github.com/colin-i/${pkgname_atsource}/archive/`echo ${pkgver} | sed 's/\./\-/'`.tar.gz"
	"obj.txt.gz::https://github.com/colin-i/${pkgname_atsource}/releases/download/`echo ${pkgver} | sed 's/\./\-/'`/obj.txt.gz")
sha256sums=('ca63e7b77804288da19b0cd27d50b2a74724edbac0afeef6579fe9c2e428d70d'
            '7b3583c06d4b751b5761de7f0565a5f6c4edb7d25e981365fc0738a554acd27a')

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
