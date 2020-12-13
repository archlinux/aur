# Maintainer: Vincent Grande <shoober420@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Brice Carpentier <brice@daknet.org>

pkgname=cairo-git
pkgver=1.17.2+17+g52a7c79fd
pkgrel=1
pkgdesc="2D graphics library with support for multiple output devices"
url="https://cairographics.org/"
arch=(x86_64)
license=(LGPL MPL)
provides=(cairo)
conflicts=(cairo)
depends=(libpng libxrender libxext fontconfig pixman glib2 lzo)
optdepends=("valgrind: valgrind support")
makedepends=(librsvg gtk2 poppler-glib libspectre git)
#checkdepends=(ttf-dejavu gsfonts)
source=("git+https://gitlab.freedesktop.org/cairo/cairo.git")
sha256sums=('SKIP')

pkgver() {
  cd cairo
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd cairo

# Fix typo
sed -i 's/have_png/use_png/g' configure.ac

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd cairo
  ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --disable-static \
        --disable-gl \
        --enable-tee \
        --enable-svg \
        --enable-ps \
        --enable-pdf \
        --enable-gobject \
        --disable-gtk-doc \
        --enable-full-testing \
        --enable-test-surfaces
  sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

#check() {
#  cd cairo
  # FIXME: tests don't pass
#  env CAIRO_TEST_TARGET=image \
#      CAIRO_TEST_TARGET_FORMAT=rgba \
#      CAIRO_TESTS='!pthread-show-text' make -k check || :
#}

package() {
  cd cairo
  make DESTDIR="$pkgdir" install
}
