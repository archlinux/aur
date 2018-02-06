# Maintainer: Raimar Bühmann <raimar _at_ buehmann _dot_ de>
# This PKGBUILD is based on poco to provide also the basic version of
# https://aur.archlinux.org/packages/poco/

pkgname=libpoco-basic
pkgver=1.8.1
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
sha256sums=('6d6ae5f06ef512580c8fab120b81fe90647c24b40654093248c589f4ae515478')
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
