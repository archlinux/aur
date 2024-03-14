# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: TheJackiMonster <jacki AT thejackimonster DOT de>

_framework='gnunet'
pkgname='libgnunetchat'
pkgver=0.3.0
pkgrel=3
pkgdesc='GNUnet chat library'
arch=('i686' 'x86_64')
url="http://${_framework}.org"
license=('AGPL')
conflicts=("${pkgname}-bin" "${pkgname}-git")
depends=("${_framework}")
makedepends=(meson check)
options=('!makeflags' '!buildflags')
source=("https://ftp.gnu.org/gnu/${_framework}/${pkgname}-${pkgver}.tar.gz"{,.sig})
validpgpkeys=('3D11063C10F98D14BD24D1470B0998EF86F59B6A')
sha256sums=('30d44298976c7c708c1ba595dde9455994415e05275f71bc3a7e8776c4e6b1ad'
            'SKIP')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	
	# Fix missing dependency from gnunet meson build
	sed -i '40d' meson.build
	
	meson setup --prefix /usr --buildtype release build
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	meson compile -C build
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	meson test -C build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	DESTDIR="$pkgdir" meson install -C build
}
