# Maintainer: Raimar Bühmann <raimar _at_ buehmann _dot_ de>
# This PKGBUILD is based on poco to provide also the basic version of
# https://aur.archlinux.org/packages/poco/

pkgname=libpoco-basic
pkgver=1.12.4
_subrel=
pkgrel=1
pkgdesc="C++ class libraries for network-centric, portable applications, basic edition"
arch=('i686' 'x86_64')
url="http://www.pocoproject.org"
license=('custom:boost')
depends=('pcre' 'expat')
conflicts=('poco' 'poco-devel' 'poco-git')
makedepends=('gcc' 'make')
source=(
	${url}/releases/poco-${pkgver}/poco-${pkgver}${_subrel}.tar.gz
#	RegularExpression.h.patch
)
sha256sums=('917d6ed92f47eb980b78a1369c0d7293c4b5eba09c40e7912617c9028c3537da')
prepare() {
	# apply patch for static build
	cd poco-${pkgver}${_subrel}
#	patch Foundation/include/Poco/RegularExpression.h < ../RegularExpression.h.patch
}

build() {
	cd poco-${pkgver}${_subrel}
	./configure --prefix=/usr --no-samples --no-tests --unbundled --static --shared
	make
}

package() {
	cd poco-${pkgver}${_subrel}
	make DESTDIR="${pkgdir}" install
	install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	# remove debug libraries
	rm "${pkgdir}/usr/lib/libPoco"*"d.so"*
	rm "${pkgdir}/usr/lib/libPoco"*"d.a"
}
