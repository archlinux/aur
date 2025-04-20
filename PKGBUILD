# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=ocompiler
pkgname_atsource=o
pkgver=1.5+226
pkgrel=1
pkgdesc="O language compiler"
arch=('x86_64')
url="https://github.com/colin-i/${pkgname_atsource}"
license=('0BSD')
depends=('lib32-glibc')
makedepends=('lib32-glibc' 'bc')
source=("${pkgname_atsource}-`echo ${pkgver} | sed 's/\./\-/'`.tar.gz::https://github.com/colin-i/${pkgname_atsource}/archive/`echo ${pkgver} | sed 's/\./\-/'`.tar.gz"
	"obj.txt.gz::https://github.com/colin-i/${pkgname_atsource}/releases/download/`echo ${pkgver} | sed 's/\./\-/'`/obj.txt.gz")
sha256sums=('7f7be126c790ae078344c3dfe69dc01b816e048c4212fb92a5c7d5a584f2f5dc'
	'c3b262ddd499a3c36a1d40d0d3b3ccd75c5237b478d344b3e72fcb65db48b04c')

ver_atsource_fn() {
	cd "${pkgname_atsource}-`echo ${pkgver} | sed 's/\./\-/; s/+/\-/'`"
}

prepare() {
	patches="`cat ../list`"
	ver_atsource_fn
	for var in ${patches[@]}; do
		echo ${var}
		patch --strip=1 --input=../../${var}
	done
	ln ../obj.txt src
}

build() {
	ver_atsource_fn
	L=-L/usr/lib32 make
}

check() {
	ver_atsource_fn
	L=-L/usr/lib32 make test
}

package() {
	ver_atsource_fn
	make DESTDIR="$pkgdir/" install
}
