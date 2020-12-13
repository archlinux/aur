# Maintainer:  Vincent Grande (shoober420) <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=harfbuzz-git
pkgname=(harfbuzz-git harfbuzz-icu-git)
pkgver=2.7.0
pkgrel=1
pkgdesc="OpenType text shaping engine"
url="https://www.freedesktop.org/wiki/Software/HarfBuzz"
arch=(x86_64)
license=(MIT)
makedepends=(glib2 freetype2 graphite harfbuzz cairo icu gobject-introspection
             ragel git python meson)
#checkdepends=(python-fonttools python-setuptools)
source=("git+https://github.com/harfbuzz/harfbuzz")
sha256sums=('SKIP')

pkgver() {
  cd harfbuzz
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd harfbuzz
}

build() {
  arch-meson harfbuzz build \
    -D graphite=enabled \
    -D docs=false
  meson compile -C build
}

#check() {
#  mkdir -p tmp
#  TMPDIR="$PWD/tmp" meson test -C build --print-errorlogs
#  rm -r tmp
#}

package_harfbuzz-git() {
  provides=(harfbuzz libharfbuzz.so libharfbuzz-subset.so libharfbuzz-gobject.so)
  conflicts=(harfbuzz)
  optdepends=('cairo: hb-view program')

  DESTDIR="$pkgdir" meson install -C build

  # Split harfbuzz-icu
  mkdir -p hb-icu/usr/{include/harfbuzz,lib/pkgconfig}
  mv -t hb-icu/usr/lib "$pkgdir"/usr/lib/libharfbuzz-icu*
  mv -t hb-icu/usr/lib/pkgconfig "$pkgdir"/usr/lib/pkgconfig/harfbuzz-icu.pc
  mv -t hb-icu/usr/include/harfbuzz "$pkgdir"/usr/include/harfbuzz/hb-icu.h

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 harfbuzz/COPYING
}

package_harfbuzz-icu-git() {
  pkgdesc="$pkgdesc (ICU integration)"
  provides=(harfbuzz-icu libharfbuzz-icu.so)
  conflicts=(harfbuzz-icu)

  mv hb-icu/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 harfbuzz/COPYING
}

