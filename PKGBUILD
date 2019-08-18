# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>

pkgname=(lib32-harfbuzz-git lib32-harfbuzz-icu-git)
pkgver=2.1.1+174+g6c22f3fd
pkgrel=1
pkgdesc="OpenType text shaping engine (32-bit)"
url="http://www.freedesktop.org/wiki/Software/HarfBuzz"
arch=(x86_64)
license=(MIT)
depends=(lib32-glib2 lib32-freetype2 harfbuzz)
makedepends=(lib32-cairo lib32-icu gcc-multilib ragel git python)
checkdepends=(python-fonttools python-setuptools)
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
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd harfbuzz
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --with-cairo \
    --with-freetype \
    --with-glib \
    --with-gobject \
    --without-graphite2 \
    --with-icu \
    --disable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

#check() {
#  cd harfbuzz
#  make check
#}

package_lib32-harfbuzz-git() {

  provides=('lib32-harfbuzz')
  conflicts=('lib32-harfbuzz')

  cd harfbuzz
  make DESTDIR="$pkgdir" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s harfbuzz "$pkgdir/usr/share/licenses/lib32-harfbuzz"

# Split harfbuzz-icu
  mkdir -p ../hb-icu/usr/lib32/pkgconfig; cd ../hb-icu
  mv "$pkgdir"/usr/lib32/libharfbuzz-icu* ./usr/lib32
  mv "$pkgdir"/usr/lib32/pkgconfig/harfbuzz-icu.pc ./usr/lib32/pkgconfig
}

package_lib32-harfbuzz-icu-git() {
  pkgdesc="OpenType text shaping engine (32-bit, ICU integration)"
  depends=(lib32-harfbuzz lib32-icu harfbuzz-icu)
  provides=('lib32-harfbuzz-icu')
  conflicts=('lib32-harfbuzz-icu')

  mv hb-icu/* "$pkgdir"

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s harfbuzz-icu "$pkgdir/usr/share/licenses/lib32-harfbuzz-icu"
}
