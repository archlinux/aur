# $Id$
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Unknown47 <unknown47r@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=libfm-gtk3
_pkgname=libfm
pkgver=1.2.3
pkgrel=1
pkgdesc='Library for file management (GTK+ 3 version)'
url='http://pcmanfm.sourceforge.net/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk3' 'menu-cache' 'desktop-file-utils' 'libexif' 'dbus-glib')
makedepends=('udisks' 'intltool' 'gtk-doc')
conflicts=($_pkgname)
source=(http://downloads.sourceforge.net/pcmanfm/$_pkgname-$pkgver.tar.xz)
md5sums=('3ff38200701658f7e80e25ed395d92dd')

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --enable-udisks \
    --with-gnu-ld \
    --with-gtk=3
  make
}

package() {
  depends+=('libfm-extra')
  install=libfm.install

  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  # Temporary fix to FS#32361
  rm -rf "$pkgdir"/usr/include/libfm
  mv "$pkgdir"/usr/include/libfm-1.0/ "$pkgdir"/usr/include/libfm

  # Split libfm-extra
  [[ -d $srcdir/libfm-extra ]] && rm -r "$srcdir/libfm-extra/"
  mkdir "$srcdir"/libfm-extra
  mv "$pkgdir"/usr/include/libfm/fm-{extra,version,xml-file}.h \
     "$pkgdir"/usr/lib/libfm-extra.so* \
     "$pkgdir"/usr/lib/pkgconfig/libfm-extra.pc \
     "$srcdir/libfm-extra/"
}
