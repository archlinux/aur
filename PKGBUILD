# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Radu Andries <admiral0@tuxfamily.org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
#
pkgname="python2-zbar"
pkgver="0.23.1"
pkgrel="2"
pkgdesc="Application and library for reading bar codes from various sources"
arch=('x86_64')
url="https://github.com/mchehab/zbar"
license=('LGPL')
depends=('gdk-pixbuf2' 'python2' 'zbar')
makedepends=('gtk3' 'imagemagick' 'libxv' 'v4l-utils' 'qt5-x11extras' 'python2' 'xmlto'
             'docbook-xsl' 'gobject-introspection')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('297439f8859089d2248f55ab95b2a90bba35687975365385c87364c77fdb19f3')

build() {
  cd zbar-$pkgver
  autoreconf -vfi
  ./configure --prefix=/usr --with-qt --with-gtk=gtk3 --with-python=python2 CFLAGS="$CFLAGS -DNDEBUG"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {

  cd zbar-$pkgver
  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir"/usr/lib/*.so* \
        "$pkgdir"/usr/lib/*.a \
        "$pkgdir"/usr/include \
        "$pkgdir"/usr/lib/pkgconfig \
        "$pkgdir"/usr/{bin,share} \
        "$pkgdir"/etc \
        "$pkgdir"/usr/lib/girepository-1.0
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
