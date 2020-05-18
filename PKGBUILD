# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: drrossum <d.r.vanrossum ag gmx.de>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgname='pangox-compat'
pkgname=lib32-${_pkgname}
pkgver='0.0.2+2+gedb9e09'
pkgrel=3
pkgdesc='X Window System font support for Pango (32bit)'
arch=('x86_64')
url='http://www.pango.org/'
license=('LGPL')
depends=('pango' 'lib32-pango' "${_pkgname}")
makedepends=('git' 'gcc-multilib' 'pkgconf')
source=("git+https://gitlab.gnome.org/Archive/pangox-compat"
		'0001-Re-add-pango_x_get_shaper_map-it-is-still-used-in-th.patch'
		'0002-disable-shaper.patch')
source[0]+='#commit=edb9e0904d04d1da02bba7b78601a2aba05aaa47'  # master
md5sums=('SKIP'
         'e4ab908c4501116d492c7cc0b70ab305'
         '8d78182e9747b425b223fa8a2b82d210')

prepare() {
  cd ${_pkgname}
  patch -Nup1 -i '../0001-Re-add-pango_x_get_shaper_map-it-is-still-used-in-th.patch'
  # diff -pNau5 pangox-compat/pangox.c{.orig,} > '0002-disable-shaper.patch'
  patch -Nup1 -i '../0002-disable-shaper.patch'
}

build() {
export CC='gcc -m32'
export CXX="g++ -m32"
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
cd ${_pkgname}

if [ ! -s 'Makefile' ]; then
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static --libdir=/usr/lib32 --libexecdir=/usr/lib32
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
fi
make
}

package() {
  cd ${_pkgname}
  make -j1 DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/include}
}









