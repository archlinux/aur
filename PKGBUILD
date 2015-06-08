# Maintainer: Raimar Bühmann <raimar _at_ buehmann _dot_ de>
# This PKGBUILD is based on poco to provide also the basic version of
# https://aur.archlinux.org/packages/poco/

pkgname=libpoco-basic
_pkgver_main=1.4.7
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
	Makefile.patch
	pcre_internal.h.patch
)
sha256sums=('ec3f726d9a46273b407f86fac2fed55d4035039780ba9ba7b4e714ad52189d22'
            'cd8d4d6780d31ec7d1f935f9342c17fe04144c33934b12509cf942ff7fa44c0f'
            '874d9f29e46e43afad0a3c24376615349d1a7be2d19c4b1712efe600bcc665c0')
prepare() {
	# apply patch for static build
	cd poco-$pkgver
	patch Foundation/Makefile < ../Makefile.patch
	patch Foundation/src/pcre_internal.h < ../pcre_internal.h.patch
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
