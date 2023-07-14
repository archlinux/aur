# Maintainer: éclairevoyant
# Contributor:  Vincent Grande (shoober420) <shoober420 at gmail dot com>
# Contributor: Jan Alexander Steffens (heftig) <heftig at archlinux dot org>
# Contributor: Jan de Groot <jgc at archlinux dot org>

_pkgbase=harfbuzz
pkgbase="$_pkgbase-git"
pkgname=(
  harfbuzz-git
  harfbuzz-cairo-git
  harfbuzz-icu-git
  harfbuzz-utils-git
  harfbuzz-docs-git
)
pkgver=8.0.1.r1.5a65ede5d
pkgrel=1
pkgdesc="OpenType text shaping engine"
url="https://www.freedesktop.org/wiki/Software/HarfBuzz"
arch=(x86_64)
license=(MIT)
makedepends=(
  cairo
  chafa
  freetype2
  git
  glib2
  gobject-introspection
  graphite
  gtk-doc
  icu
  meson
  python
  ragel
)
checkdepends=(
  python-fonttools
  python-setuptools
)
source=("git+https://github.com/harfbuzz/harfbuzz")
b2sums=('SKIP')

pkgver() {
  git -C $_pkgbase describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  local meson_options=(
    -D graphite2=enabled
  )

  # Harfbuzz wants no exceptions
  CFLAGS="${CFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/-fexceptions/}"

  arch-meson $_pkgbase build "${meson_options[@]}"
  meson compile -C build
}

check() {
  mkdir -p tmp
  TMPDIR="$PWD/tmp" meson test -C build --print-errorlogs
  rm -r tmp
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_harfbuzz-git() {
  depends=(
    libfreetype.so
    libgraphite2.so
    libg{lib,object}-2.0.so
  )
  optdepends=('harfbuzz-utils: utilities')
  provides=("harfbuzz=${pkgver%%-.r*}" libharfbuzz{,-subset,-gobject}.so)
  conflicts=(harfbuzz)

  meson install -C build --destdir "$pkgdir"

  ( cd "$pkgdir"

    _pick hb-cairo usr/lib/libharfbuzz-cairo*
    _pick hb-cairo usr/lib/pkgconfig/harfbuzz-cairo.pc
    _pick hb-cairo usr/include/harfbuzz/hb-cairo.h

    _pick hb-icu usr/lib/libharfbuzz-icu*
    _pick hb-icu usr/lib/pkgconfig/harfbuzz-icu.pc
    _pick hb-icu usr/include/harfbuzz/hb-icu.h

    _pick hb-utils usr/bin

    _pick hb-docs usr/share/gtk-doc
  )

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 harfbuzz/COPYING
}

package_harfbuzz-cairo-git() {
  pkgdesc+=" - Cairo integration"
  depends=(
    libcairo.so
    libharfbuzz.so
  )
  provides=("harfbuzz-cairo=${pkgver%%-.r*}" libharfbuzz-cairo.so)
  conflicts=(harfbuzz-cairo)

  mv hb-cairo/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 harfbuzz/COPYING
}

package_harfbuzz-icu-git() {
  pkgdesc+=" - ICU integration"
  depends=(
    libharfbuzz.so
    libicuuc.so
  )
  provides=("harfbuzz-icu=${pkgver%%-.r*}" libharfbuzz-icu.so)
  conflicts=(harfbuzz-icu)

  mv hb-icu/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 harfbuzz/COPYING
}

package_harfbuzz-utils-git() {
  pkgdesc+=" - Utilities"
  depends=(
    harfbuzz
    harfbuzz-cairo
    libcairo.so
    libchafa.so
    libfreetype.so
    libglib-2.0.so
    libgobject-2.0.so
    libharfbuzz-cairo.so
    libharfbuzz-gobject.so
    libharfbuzz-subset.so
    libharfbuzz.so
  )
  provides=("harfbuzz-utils=${pkgver%%-.r*}")
  conflicts=(harfbuzz-utils)

  mv hb-utils/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 harfbuzz/COPYING
}

package_harfbuzz-docs-git() {
  pkgdesc+=" - Documentation"
  depends=()
  provides=("harfbuzz-docs=${pkgver%%-.r*}")
  conflicts=(harfbuzz-docs)

  mv hb-docs/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 harfbuzz/COPYING
}
