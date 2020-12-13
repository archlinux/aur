# Maintainer: Vincent Grande <shoober420@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=lib32-cairo-git
pkgver=1.17.2+17+g52a7c79fd
pkgrel=1
pkgdesc="2D graphics library with support for multiple output devices (32-bit)"
url="https://cairographics.org/"
arch=(x86_64)
license=(LGPL MPL)
provides=(lib32-cairo)
conflicts=(lib32-cairo)
depends=(lib32-libpng lib32-libxrender lib32-libxext lib32-fontconfig lib32-pixman lib32-glib2
         cairo)
makedepends=(lib32-librsvg lib32-gtk2 git)
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
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  cd cairo
  ./configure --prefix=/usr \
        --libdir=/usr/lib32 \
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
  rm -r "$pkgdir"/usr/{include,bin}
}
