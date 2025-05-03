# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=ocompiler
pkgname_atsource=o
pkgver=1.5+228
pkgrel=1
pkgdesc="O language compiler"
arch=('x86_64')
url="https://github.com/colin-i/${pkgname_atsource}"
license=('0BSD')
depends=('lib32-glibc')
makedepends=('lib32-glibc' 'bc')
source=("${pkgname_atsource}-`echo ${pkgver} | sed 's/\./\-/'`.tar.gz::https://github.com/colin-i/${pkgname_atsource}/archive/`echo ${pkgver} | sed 's/\./\-/'`.tar.gz"
	"obj.txt.gz::https://github.com/colin-i/${pkgname_atsource}/releases/download/`echo ${pkgver} | sed 's/\./\-/'`/obj.txt.gz")
sha256sums=('8d138a95ee26898194b4e7e7b41f0dfb3c806a9a4eeb6a3fbf7aab0b8eb80deb'
            '5de71a679b99d9a42679968484a91b4efdfeb2f3dcd84af2d980ac87de54b0c5')

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
