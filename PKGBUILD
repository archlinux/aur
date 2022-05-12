# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname='pangox-compat'
pkgver='0.0.2+2+gedb9e09'
pkgrel='3'
pkgdesc='X Window System font support for Pango'
arch=('x86_64')
url='http://www.pango.org/'
license=('LGPL')
depends=('pango')
makedepends=('git')
source=(
  "git+https://gitlab.gnome.org/Archive/pangox-compat.git"
  '0001-Re-add-pango_x_get_shaper_map-it-is-still-used-in-th.patch'
  '0002-disable-shaper.patch'
)
source[0]+='#commit=edb9e0904d04d1da02bba7b78601a2aba05aaa47'  # master
md5sums=('SKIP'
         'e4ab908c4501116d492c7cc0b70ab305'
         '8d78182e9747b425b223fa8a2b82d210')
sha256sums=('SKIP'
            'd5aad903439ede05b866c9a2962f293bec4897f07d5a7b07ebc5aa99eeb27e48'
            '0a33987e97807211bc74a851348bcee4a0a6147d2d7f1e23c9c7912505ba27db')

pkgver() {
  cd ${pkgname}
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd ${pkgname}
  patch -Nup1 -i '../0001-Re-add-pango_x_get_shaper_map-it-is-still-used-in-th.patch'
  # diff -pNau5 pangox-compat/pangox.c{.orig,} > '0002-disable-shaper.patch'
  patch -Nup1 -i '../0002-disable-shaper.patch'
}

build() {
  cd ${pkgname}

  if [ ! -s 'Makefile' ]; then
    NOCONFIGURE=1 ./autogen.sh
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --disable-static
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  fi
  make
}

package() {
  cd ${pkgname}
  make -j1 DESTDIR="${pkgdir}" install
}
