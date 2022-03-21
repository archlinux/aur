# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=gtksheet-git
pkgver=4.3.9.r5.gecfe8eb
pkgrel=1
pkgdesc="A spreadsheet widget for gtk3"
arch=(x86_64)
url=http://fpaquet.github.io/gtksheet/
license=('GPL2')
conflicts=(gtksheet)
provides=(gtksheet)
depends=(
gtk3
pango
cairo
atk
glade
gobject-introspection
)
makedepends=(
meson
)
source=(
"git+https://github.com/fpaquet/gtksheet.git#branch=gtk3_fixes"
build_fix.patch
)
sha256sums=('SKIP'
            '4e1a273250f3a22e2e40d2942445e66dce1710037f411e2f3a7fd351f3f98e06')

pkgver() {
  cd gtksheet
  git describe --long --tags | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd gtksheet
  cat ../build_fix.patch | patch -p1
}

build() {
  arch-meson gtksheet build \
    -D enable-gtk-doc=false \
    -D enable-introspection=true \
    -D enable-glade=true \
    -D enable-tests=true

  meson compile -C build
}

check() {
  true
  # meson test -C build  # this is interactive
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:ts=2:sw=2:et:
