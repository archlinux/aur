# $Id: PKGBUILD 272756 2016-07-31 10:13:10Z andyrtr $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Brice Carpentier <brice@daknet.org>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=cairo-infinality
_name=cairo
pkgver=1.17.2+11+gdfe3aa6d8
pkgrel=1
pkgdesc="2D graphics library with support for multiple output devices (infinality version)"
url="https://cairographics.org/"
arch=(x86_64)
license=(LGPL MPL)
groups=(infinality-bundle)
depends=(libpng libxrender libxext fontconfig-infinality pixman glib2 lzo)
makedepends=(librsvg gtk2 poppler-glib libspectre gtk-doc valgrind git)
provides=(cairo)
conflicts=(cairo cairo-cleartype cairo-git cairo-gl-git cairo-glitz cairo-ocaml-git cairo-small cairo-ubuntu)
source=("git+https://gitlab.freedesktop.org/cairo/cairo.git#commit=$_commit"
        cairo-make-lcdfilter-default.patch
        cairo-respect-fontconfig_pb.patch
        cairo-server-side-gradients.patch
        cairo-webkit-html5-fix.patch)
sha1sums=('SKIP'
          'b0cc2466cc5479f055ca2148cfa37fe13a1e78a6'
          'd8ffcb4c4745f7e61671109362a80a872ac989d3'
          '72ecf2dda8462e1588512de257ccbe18642d507f'
          '5bff494f52a16114f4cf6d04bfb0b9d7c4e9da23')

pkgver() {
  cd cairo
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd cairo

  patch -Np1 -i "${srcdir}"/cairo-make-lcdfilter-default.patch
  patch -Np1 -i "${srcdir}"/cairo-respect-fontconfig_pb.patch
  patch -Np1 -i "${srcdir}"/cairo-server-side-gradients.patch
  patch -Np1 -i "${srcdir}"/cairo-webkit-html5-fix.patch

  # Update gtk-doc
  cp /usr/share/aclocal/gtk-doc.m4 build/aclocal.gtk-doc.m4
  cp /usr/share/gtk-doc/data/gtk-doc.make build/Makefile.am.gtk-doc

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
        --enable-gtk-doc \
        --enable-full-testing \
        --enable-test-surfaces
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
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
