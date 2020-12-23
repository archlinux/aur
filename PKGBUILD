# Maintainer:  Vincent Grande (shoober420) <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=(harfbuzz-minimal-git)
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
    -D docs=disabled \
    -D icu=disabled
  meson compile -C build
}

#check() {
#  mkdir -p tmp
#  TMPDIR="$PWD/tmp" meson test -C build --print-errorlogs
#  rm -r tmp
#}

package_harfbuzz-minimal-git() {
  provides=(harfbuzz libharfbuzz.so libharfbuzz-subset.so libharfbuzz-gobject.so)
  conflicts=(harfbuzz)
  optdepends=('cairo: hb-view program')

  DESTDIR="$pkgdir" meson install -C build

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 harfbuzz/COPYING
}
