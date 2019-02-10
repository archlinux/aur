# Maintainer: osch <oliver@luced.de>
# This PKGBUILD is modifed copy from https://www.archlinux.org/packages/extra/x86_64/cairo/
# Installs under /opt/cairo-xml alongside official cairo lib,
# use with PKG_CONFIG_PATH=/opt/cairo-xml/lib/pkgconfig/ in dependant projects.
pkgname=cairo-xml
pkgver=1.16.0
pkgrel=2
pkgdesc="cairo graphics library with support for xml surfaces enabled"
url="https://cairographics.org/"
arch=(x86_64)
license=(LGPL MPL)
depends=(libpng libxrender libxext fontconfig pixman glib2 lzo)
makedepends=(librsvg gtk2 poppler-glib libspectre gtk-doc valgrind git)
checkdepends=(ttf-dejavu gsfonts)
_commit=3ad43122b21a3299dd729dc8462d6b8f7f01142d  # tags/1.16.0^0
source=("git+https://gitlab.freedesktop.org/cairo/cairo.git#commit=$_commit")
sha1sums=('SKIP')

pkgver() {
  cd cairo
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd cairo
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/opt/cairo-xml \
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
        --enable-test-surfaces \
        --enable-xml \
        --enable-static  --disable-shared \
        --disable-gtk-doc-html
  sed -i -e 's:-L${libdir} -lcairo:${libdir}/libcairo.a:g' src/cairo.pc
  sed -i -e 's:-L${libdir} -lcairo-gobject:${libdir}/libcairo-gobject.a:g' src/cairo-gobject.pc
  make
}

package() {
  cd cairo
  make DESTDIR="$pkgdir" install
}
