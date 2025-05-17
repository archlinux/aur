# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=ocompiler
pkgname_atsource=o
pkgver=2.5+232
pkgrel=1
pkgdesc="O language compiler"
arch=('x86_64')
url="https://github.com/colin-i/${pkgname_atsource}"
license=('0BSD')
depends=('lib32-glibc')
makedepends=('lib32-glibc' 'bc')
source=("${pkgname_atsource}-`echo ${pkgver} | sed 's/\./\-/'`.tar.gz::https://github.com/colin-i/${pkgname_atsource}/archive/`echo ${pkgver} | sed 's/\./\-/'`.tar.gz"
	"obj.txt.gz::https://github.com/colin-i/${pkgname_atsource}/releases/download/`echo ${pkgver} | sed 's/\./\-/'`/obj.txt.gz")
sha256sums=('3f25c0d39ee70bda59283eb20cfdeadf60ca8d4f556b6607a678283e66e5da55'
            'b053025bb182197de909d7ce809b5cae23c16adf30fa286d74fd2f2c1a57eec0')

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
