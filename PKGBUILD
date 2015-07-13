# Maintainer: Raimar Bühmann <raimar _at_ buehmann _dot_ de>
# This PKGBUILD is based on poco to provide also the basic version of
# https://aur.archlinux.org/packages/poco/

pkgname=libpoco-basic
_pkgver_main=1.6.0
pkgver=${_pkgver_main}
pkgrel=1
pkgdesc="C++ class libraries for network-centric, portable applications, basic edition"
arch=('i686' 'x86_64')
url="http://www.pocoproject.org"
license=('custom:boost')
depends=('pcre' 'expat')
conflicts=('poco' 'poco-devel' 'poco-git')
makedepends=('gcc' 'make')
source=(
	${url}/releases/poco-${_pkgver_main}/poco-${pkgver}.tar.gz
	RegularExpression.h.patch
)
sha256sums=('8e745271d57db8d544d5c8e37b3b7db01d7934e0257a41af0b8da9ee8b1554ee'
            'af43ef3b60f4bfba49071d6393fa22311d65277ff05d335c3fe29283b3c04222')
prepare() {
	# apply patch for static build
	cd poco-$pkgver
	patch Foundation/include/Poco/RegularExpression.h < ../RegularExpression.h.patch
}

build() {
	cd poco-${pkgver}
	./configure --prefix=/usr --no-samples --no-tests --unbundled --static --shared
	make
}

package() {
	cd poco-${pkgver}
	make DESTDIR="${pkgdir}" install
	install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	# remove debug libraries
	rm "${pkgdir}/usr/lib/libPoco"*"d.so"*
	rm "${pkgdir}/usr/lib/libPoco"*"d.a"
}
