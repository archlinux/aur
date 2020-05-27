# Maintainer: Vincent Grande <shoober420@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

#pkgbase=(harfbuzz)
pkgname=(harfbuzz-git harfbuzz-icu-git)
pkgver=2.1.1+174+g6c22f3fd
pkgrel=1
pkgdesc="OpenType text shaping engine"
url="http://www.freedesktop.org/wiki/Software/HarfBuzz"
arch=(x86_64)
license=(MIT)
depends=(freetype2 graphite)
makedepends=(glib2 freetype2 graphite cairo icu gobject-introspection ragel git python)
#checkdepends=(python-fonttools python-setuptools)
source=("git+https://github.com/harfbuzz/harfbuzz")
sha256sums=('SKIP')

pkgver() {
  cd harfbuzz
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd harfbuzz
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd harfbuzz
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
  depends=(freetype2 graphite)
  optdepends=('cairo: hb-view program')
  provides=(harfbuzz libharfbuzz.so libharfbuzz-subset.so libharfbuzz-gobject.so)
  conflicts=(harfbuzz)

  cd harfbuzz
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
  depends=(harfbuzz icu libharfbuzz.so)
  provides=(harfbuzz-icu libharfbuzz-icu.so)
  conflicts=(harfbuzz-icu)

  mv hb-icu/* "$pkgdir"

  install -Dm644 harfbuzz/COPYING "$pkgdir/usr/share/licenses/harfbuzz-icu/COPYING"
}
