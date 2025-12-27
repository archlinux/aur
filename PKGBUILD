# Maintainer: Dave Daynard <nardholio@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Adam Hani Schakaki <krzd@krzd.net>

pkgname=(caribou libcaribou)
pkgver=0.4.22
pkgrel=3
url="https://wiki.gnome.org/Projects/Caribou"
arch=(x86_64)
license=(LGPL)
depends=(at-spi2-atk python-atspi python-gobject gtk3 libxklavier libgee clutter dconf)
makedepends=(intltool docbook-xsl gobject-introspection vala git gnome-common)
options=(!emptydirs !debug)
source=("git+https://github.com/nardholio/caribou.git#tag=$pkgver")
sha256sums=('5b4b43b546884560805eb94d841717e62155d0aab1941567a079119344dd4355')

prepare() {
  cd caribou
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd caribou
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib \
    --disable-gtk2-module \
    --disable-static \
    --disable-schemas-compile
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
  make DESTDIR="${srcdir}/dest" install
}

check() {
  cd caribou
  make -k check
}

package_caribou() {
  pkgdesc="A text entry and UI navigation application (on-screen keyboard)"

  mkdir -p "${pkgdir}"
  cp -a "${srcdir}/dest/"{etc,usr} "${pkgdir}/"
  # Remove files packaged in libcaribou
  rm -rf "${pkgdir}/usr/include/libcaribou"
  rm "${pkgdir}/usr/lib/libcaribou".*
  rm "${pkgdir}/usr/lib/pkgconfig/caribou-1.0.pc"
  rm "${pkgdir}/usr/share/gir-1.0/Caribou-1.0.gir"
  rm "${pkgdir}/usr/lib/girepository-1.0/Caribou-1.0.typelib"
  rm "${pkgdir}/usr/share/vala/vapi/caribou"*
}

package_libcaribou() {
  pkgdesc="Input assistance library for caribou"
  provides=('libcaribou.so')

  mkdir -p "${pkgdir}/usr/"{include/libcaribou,lib/{girepository-1.0,pkgconfig},share/{gir-1.0,vala/vapi}}
  cp -a "${srcdir}/dest/usr/include/libcaribou"/* "${pkgdir}/usr/include/libcaribou/"
  cp -a "${srcdir}/dest/usr/lib/libcaribou".* "${pkgdir}/usr/lib/"
  cp -a "${srcdir}/dest/usr/lib/girepository-1.0/Caribou"* "${pkgdir}/usr/lib/girepository-1.0/"
  cp -a "${srcdir}/dest/usr/lib/pkgconfig/caribou"* "${pkgdir}/usr/lib/pkgconfig/"
  cp -a "${srcdir}/dest/usr/share/gir-1.0/Caribou"* "${pkgdir}/usr/share/gir-1.0/"
  cp -a "${srcdir}/dest/usr/share/vala/vapi/caribou"* "${pkgdir}/usr/share/vala/vapi/"
}

# vim:set ts=2 sw=2 et:
