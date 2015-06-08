# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=texinfo-legacy
pkgver=4.13a
pkgrel=3
pkgdesc="GNU documentation suite - legacy version"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/texinfo/"
license=('GPL3')
groups=('base')
depends=('ncurses' 'findutils' 'gzip')
install=texinfo.install
source=(ftp://ftp.gnu.org/pub/gnu/${pkgname%-legacy}/${pkgname%-legacy}-${pkgver}.tar.gz
        texinfo-4.13a-data_types.patch)
md5sums=('71ba711519209b5fb583fed2b3d86fcb'
         'd8574782ff7def1e2dc5c291dbeaec18')

build() {
  cd ${srcdir}/${pkgname%-legacy}-${pkgver//a/}
  patch -Np1 -i $srcdir/texinfo-4.13a-data_types.patch
  ./configure --prefix=/usr --program-suffix="-$pkgver"
  make
}

package() {
  cd ${srcdir}/${pkgname%-legacy}-${pkgver//a/}
  make DESTDIR=${pkgdir} install 

  # fix this here as it prevents make from trying to rebuild manual pages
  sed -i 's#A-z#A-Za-z#' ${pkgdir}/usr/bin/texi2dvi-$pkgver
  rm -r $pkgdir/usr/share/locale/
  mv $pkgdir/usr/share/info/info-stnd.info \
    $pkgdir/usr/share/info/info-stnd-$pkgver.info
  mv $pkgdir/usr/share/info/info.info \
    $pkgdir/usr/share/info/info-$pkgver.info
  mv $pkgdir/usr/share/texinfo $pkgdir/usr/share/texinfo-legacy
}
