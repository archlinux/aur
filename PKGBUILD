# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgbase=(harfbuzz)
pkgname=(harfbuzz-git harfbuzz-icu-git)
pkgver=2.1.1+174+g6c22f3fd
pkgrel=1
pkgdesc="OpenType text shaping engine"
url="http://www.freedesktop.org/wiki/Software/HarfBuzz"
arch=(x86_64)
license=(MIT)
depends=(glib2 freetype2 graphite)
makedepends=(cairo icu gobject-introspection ragel git python)
checkdepends=(python-fonttools python-setuptools)
source=("git+https://anongit.freedesktop.org/git/harfbuzz")
sha256sums=('SKIP')

pkgver() {
  cd $pkgbase
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgbase
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgbase
  ./configure \
    --prefix=/usr \
    --with-cairo \
    --with-freetype \
    --with-glib \
    --with-gobject \
    --with-graphite2 \
    --with-icu \
    --disable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

#check() {
#  cd $pkgbase
#  make check
#}

package_harfbuzz-git() {
  optdepends=('cairo: hb-view program')
  provides=('harfbuzz')
  conflicts=('harfbuzz')

  cd $pkgbase
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/harfbuzz/COPYING"

# Split harfbuzz-icu
  mkdir -p ../hb-icu/usr/{include/harfbuzz,lib/pkgconfig}; cd ../hb-icu
  mv "$pkgdir"/usr/lib/libharfbuzz-icu* ./usr/lib
  mv "$pkgdir"/usr/lib/pkgconfig/harfbuzz-icu.pc ./usr/lib/pkgconfig
  mv "$pkgdir"/usr/include/harfbuzz/hb-icu.h ./usr/include/harfbuzz
}

package_harfbuzz-icu-git() {
  pkgdesc="$pkgdesc (ICU integration)"
  depends=(harfbuzz icu)
  provides=('harfbuzz-icu')
  conflicts=('harfbuzz-icu')

  mv hb-icu/* "$pkgdir"

  install -Dm644 $pkgbase/COPYING "$pkgdir/usr/share/licenses/harfbuzz-icu/COPYING"
}
