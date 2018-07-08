# $Id$
# Maintainer: Iraklis Karagkiozoglou <iraklisk@outlook.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Radu Andries <admiral0@tuxfamily.org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgbase=zbar-comp
pkgname=(zbar-comp zbar-gtk-comp zbar-qt-comp python2-zbar-comp)
pkgver=0.20
pkgrel=3
pkgdesc="Application and library for reading bar codes from various sources (imagemagick 6)"
arch=('x86_64')
url="https://github.com/procxx/zbar"
license=('LGPL')
makedepends=('libmagick6' 'libxv' 'v4l-utils' 'qt5-x11extras' 'pygtk' 'python' 'xmlto' 'docbook-xsl')
conflits=('zbar')
source=("$pkgname-$pkgver.tar.gz::https://github.com/procxx/zbar/archive/$pkgver.tar.gz")
sha512sums=('b013dc5f72f910e8e0dc73de1705684f76e5cb5b2026d48d3e149d3e8b46afdf273d06f32738c588c272218e95b5cd39d3c0b8be4eb9be17553504a13b11c144')

prepare() {
  cd zbar-$pkgver
  autoreconf -vfi
}

build() {
  cd zbar-$pkgver
  PKG_CONFIG_PATH="/usr/lib/imagemagick6/pkgconfig" \
  PYTHON="/usr/bin/python2" \
  ./configure --prefix=/usr --with-qt --with-gtk CFLAGS="$CFLAGS -DNDEBUG"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package_zbar-comp() {
  depends=('libmagick6' 'libsm' 'libxv' 'v4l-utils')

  cd zbar-$pkgver
  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir"/usr/lib/libzbar{gtk,qt}.so* \
        "$pkgdir"/usr/lib/*.a \
        "$pkgdir"/usr/include/zbar/zbargtk.h \
        "$pkgdir"/usr/include/zbar/QZBar*.h \
        "$pkgdir"/usr/lib/pkgconfig/zbar-{gtk,qt}.pc \
        "$pkgdir"/usr/lib/python2.7 \
        "$pkgdir"/usr/bin/zbarcam-*
}

package_zbar-gtk-comp() {
  depends=('zbar-comp' 'gtk2')

  cd zbar-$pkgver
  make DESTDIR="$pkgdir" install

  mv "$pkgdir"/usr/include/zbar/zbargtk.h ./

  rm -r "$pkgdir"/usr/lib/libzbar{,qt}.so* \
        "$pkgdir"/usr/lib/*.a \
        "$pkgdir"/usr/include/zbar/*.h \
        "$pkgdir"/usr/include/zbar.h \
        "$pkgdir"/usr/lib/pkgconfig/zbar{,-qt}.pc \
        "$pkgdir"/usr/lib/python2.7 \
        "$pkgdir"/usr/share \
        "$pkgdir"/usr/bin/{zbarimg,zbarcam,zbarcam-qt}

  mv ./zbargtk.h "$pkgdir"/usr/include/zbar/
}

package_zbar-qt-comp() {
  depends=('zbar-comp' 'qt5-x11extras')

  cd zbar-$pkgver
  make DESTDIR="$pkgdir" install

  mv "$pkgdir"/usr/include/zbar/QZBar*.h ./

  rm -r "$pkgdir"/usr/lib/libzbar{,gtk}.so* \
        "$pkgdir"/usr/lib/*.a \
        "$pkgdir"/usr/include/zbar/*.h \
        "$pkgdir"/usr/include/zbar.h \
        "$pkgdir"/usr/lib/pkgconfig/zbar{,-gtk}.pc \
        "$pkgdir"/usr/lib/python2.7 \
        "$pkgdir"/usr/share \
        "$pkgdir"/usr/bin/{zbarimg,zbarcam,zbarcam-gtk}

  mv ./QZBar*.h "$pkgdir"/usr/include/zbar/
}

package_python2-zbar-comp() {
  depends=('zbar-gtk-comp' 'pygtk')

  cd zbar-$pkgver
  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir"/usr/lib/*.so* \
        "$pkgdir"/usr/include \
        "$pkgdir"/usr/lib/pkgconfig \
        "$pkgdir"/usr/{bin,share}
}
