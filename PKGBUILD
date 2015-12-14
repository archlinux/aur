# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgbase=(harfbuzz-git)
pkgname=(harfbuzz harfbuzz-icu)
pkgver=1.1.2.r19.g15f2c05
pkgrel=1
pkgdesc="OpenType text shaping engine"
arch=(i686 x86_64)
url="http://www.freedesktop.org/wiki/Software/HarfBuzz"
license=(MIT)
makedepends=(glib2 freetype2 graphite cairo icu gobject-introspection)
conflicts="harfbuzz harfbuzz-icu"
provides="harfbuzz harfbuzz-icu"

source=(git://github.com/behdad/harfbuzz.git)
sha256sums=('SKIP')
_gitname=harfbuzz

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir path
  ln -s /usr/bin/python2 path/python

  cd "$_gitname"
}


build() {
  cd "$_gitname"
  ./autogen.sh
  ./configure --prefix=/usr \
    --with-glib --with-freetype --with-cairo --with-icu --with-graphite2 \
    --with-gobject
  make
}

check() {
  cd "$_gitname"
  PATH="$srcdir/path:$PATH" make -k check || :
}

package_harfbuzz() {
  depends=(glib2 freetype2 graphite)
  optdepends=('cairo: hb-view program')

  cd "$_gitname"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/harfbuzz/COPYING"

# Split harfbuzz-icu
  mkdir -p ../hb-icu/usr/{include/harfbuzz,lib/pkgconfig}; cd ../hb-icu
  mv "$pkgdir"/usr/lib/libharfbuzz-icu* ./usr/lib
  mv "$pkgdir"/usr/lib/pkgconfig/harfbuzz-icu.pc ./usr/lib/pkgconfig
  mv "$pkgdir"/usr/include/harfbuzz/hb-icu.h ./usr/include/harfbuzz
}

package_harfbuzz-icu(){
  pkgdesc="$pkgdesc (ICU integration)"
  depends=(harfbuzz icu)

  mv hb-icu/* "$pkgdir"

  install -Dm644 $_gitname/COPYING "$pkgdir/usr/share/licenses/harfbuzz-icu/COPYING"
}
