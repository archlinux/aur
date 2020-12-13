# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>

pkgname=(lib32-harfbuzz-git lib32-harfbuzz-icu-git)
pkgver=2.7.1
pkgrel=1
pkgdesc="OpenType text shaping engine (32-bit)"
url="https://www.freedesktop.org/wiki/Software/HarfBuzz"
arch=(x86_64)
license=(MIT)
makedepends=(lib32-glib2 lib32-freetype2 lib32-cairo lib32-icu ragel git python
             meson harfbuzz harfbuzz-icu)
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
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  arch-meson harfbuzz build \
    --libdir=/usr/lib32 \
    -D introspection=disabled \
    -D docs=disabled
  meson compile -C build
}

#check() {
#  mkdir -p tmp
#  TMPDIR="$PWD/tmp" meson test -C build --print-errorlogs
#  rm -r tmp
#}

package_lib32-harfbuzz-git() {
  provides=(lib32-harfbuzz libharfbuzz.so libharfbuzz-subset.so libharfbuzz-gobject.so)
  conflicts=(lib32-harfbuzz)

  DESTDIR="$pkgdir" meson install -C build
  rm -rf "${pkgdir}"/usr/{include,share,bin}

  # Split harfbuzz-icu
  mkdir -p hb-icu/usr/lib32/pkgconfig
  mv -t hb-icu/usr/lib32 "$pkgdir"/usr/lib32/libharfbuzz-icu*
  mv -t hb-icu/usr/lib32/pkgconfig "$pkgdir"/usr/lib32/pkgconfig/harfbuzz-icu.pc

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 harfbuzz/COPYING
}

package_lib32-harfbuzz-icu-git() {
  pkgdesc="$pkgdesc (ICU integration)"
  provides=(lib32-harfbuzz-icu libharfbuzz-icu.so)
  conflicts=(lib32-harfbuzz-icu)

  mv hb-icu/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 harfbuzz/COPYING
}

