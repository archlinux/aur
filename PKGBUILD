# Maintainer: éclairevoyant
# Contributor: GordonGR <ntheo1979 at gmail dot com>
# Contributor: drrossum <d dot r dot vanrossum ag gmx dot de>
# Contributor: josephgbr <rafael dot f dot f1 at gmail dot com>

_pkgname='pangox-compat'
pkgname="lib32-$_pkgname"
pkgver='0.0.2+2+gedb9e09'
pkgrel=3
pkgdesc='X Window System font support for Pango (32bit)'
arch=('x86_64')
url='http://www.pango.org/'
license=('LGPL')
depends=('pango' 'lib32-pango' "$_pkgname")
makedepends=('git' 'gcc-multilib')
source=("git+https://gitlab.gnome.org/Archive/$_pkgname#commit=edb9e0904d04d1da02bba7b78601a2aba05aaa47"
        '0001-Re-add-pango_x_get_shaper_map-it-is-still-used-in-th.patch'
        '0002-disable-shaper.patch')
b2sums=('SKIP'
        '297fda421694ca8a540171d1f564d8fad8f57a771f89d41dead260591438415169167127e3bce32e011634e878bf6f4754c2f48357c6cf216b1f3235016c73ec'
        'cf719589e81f9c53814b2271555a59063008fa8ab6ab7081a2a7c76d568c3920f6957a4955ee7c27d30e06e3dfa2de47b898b52eb6fb77f188ad334610bd6452')

prepare() {
	cd $_pkgname
	patch -Nup1 -i '../0001-Re-add-pango_x_get_shaper_map-it-is-still-used-in-th.patch'
	patch -Nup1 -i '../0002-disable-shaper.patch'
}

build() {
	export CC='gcc -m32'
	export CXX="g++ -m32"
	export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
	cd $_pkgname

	if [ ! -s 'Makefile' ]; then
		NOCONFIGURE=1 ./autogen.sh
		./configure \
			--prefix=/usr \
			--sysconfdir=/etc \
			--localstatedir=/var \
			--disable-static \
			--libdir=/usr/lib32 \
			--libexecdir=/usr/lib32
		sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
	fi

	make
}

package() {
	cd $_pkgname
	make -j1 DESTDIR="${pkgdir}" install
	rm -rf "$pkgdir"/{etc,usr/include}
}
