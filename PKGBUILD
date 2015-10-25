# Maintainer: Ainola
# Contributor: bzt

pkgname=gnome-xcf-thumbnailer
pkgver=1.0
pkgrel=6
pkgdesc="GNOME thumbnailer for GIMP XCF files."
arch=('i686' 'x86_64')
url="http://packages.debian.org/sid/gnome-xcf-thumbnailer"
license=('GPL2')
depends=('glib2' 'libpng12>=1.2.13')
optdepends=('gimp: Required to create thumbnails')
source=("http://ftp.acc.umu.se/pub/gnome/sources/gnome-xcf-thumbnailer/${pkgver}/gnome-xcf-thumbnailer-${pkgver}.tar.bz2"
        "gnome-xcf-thumbnailer.thumbnailer")
sha256sums=('d0489a00a493242f65db22e2861d37f59c540055dd1aa573bb09886180ab4bd0'
            '401c9d7eb3a47a223110599c54af0b9feddc8026a1fc812df866ff19e7e33ac0')

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
