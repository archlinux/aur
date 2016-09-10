# Maintainer: Ainola
# Contributor: bzt

pkgname=gnome-xcf-thumbnailer
pkgver=1.0
pkgrel=7
pkgdesc="GNOME thumbnailer for GIMP XCF files."
arch=('i686' 'x86_64')
url="https://download.gnome.org/sources/gnome-xcf-thumbnailer/"
license=('GPL2')
depends=('glib2' 'libpng12>=1.2.13')
optdepends=('gimp: Required to create thumbnails')
source=("https://download.gnome.org/sources/gnome-xcf-thumbnailer/${pkgver}/gnome-xcf-thumbnailer-${pkgver}.tar.bz2"
        "gnome-xcf-thumbnailer.thumbnailer"
        "no-popt.patch"
        "CVE-2009-0217.patch")
sha256sums=('d0489a00a493242f65db22e2861d37f59c540055dd1aa573bb09886180ab4bd0'
            '401c9d7eb3a47a223110599c54af0b9feddc8026a1fc812df866ff19e7e33ac0'
            '9f3e31804362a7c6d3224e9fd61dd3c4cddc872eafa9b754ddab7aaa30bad8aa'
            '8a56cf5cd9fdb1aa677f93236c110572450c5f702cd3cb8fa5517ecbe6b0f1a8')

prepare(){
  patch -d gnome-xcf-thumbnailer-$pkgver -p1 < no-popt.patch
  patch -d gnome-xcf-thumbnailer-$pkgver -p1 < CVE-2009-0217.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  LIBPNG_CFLAGS=-I/usr/include/libpng12 \
    LIBPNG_LIBS=-lpng12 \
    ./configure --prefix=/usr
  
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  make DESTDIR="$pkgdir" install
  
  mkdir -p "$pkgdir/usr/share/thumbnailers"
  cp ../gnome-xcf-thumbnailer.thumbnailer "$pkgdir/usr/share/thumbnailers"
  
  install -m755 -d "$pkgdir/usr/share/gconf/schemas"
  gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/${pkgname}.schemas" \
    --domain gnome-xcf-thumbnailer "$pkgdir/usr/share/$pkgname/${pkgname}.sc"
}

# vim: et sw=2 ts=2
