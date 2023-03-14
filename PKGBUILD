# Contributor: linksoft at gmx dot de

pkgname=epson-inkjet-printer-l805
_pkgname_filter=epson-inkjet-printer-filter
_suffix=1lsb3.2.src.rpm
pkgver=1.0.0
pkgrel=2
pkgdesc="Epson printer driver (L805)"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('LGPL' 'custom:Epson Licence Agreement')
depends=('cups' 'ghostscript')
#makedepends=('libtool' 'make' 'automake' 'autoconf')
source=(https://download3.ebz.epson.net/dsc/f/03/00/05/30/95/61e3ce77e3c2fcdbea81efde2fa6dfb93446686b/${pkgname}-${pkgver}-${_suffix})
sha512sums=('9bd0378e74a760d68db31c2382486a0d5697fc267384b7f6aed77dd381b42395770718a605061725d834dd2d2245cd5507b92bc9884273076b405beda8d2f198')

build() {
  cd "$srcdir"
  tar xzf $pkgname-$pkgver.tar.gz
  FILTER_FILE=`ls $_pkgname_filter*.tar.gz`
  tar xzf $FILTER_FILE

  cd "${FILTER_FILE%.tar.gz}"
  aclocal
  libtoolize
  chmod +x configure
  automake --add-missing
  # if you have runtime problems: add "--enable-debug" and look into /tmp/epson-inkjet-printer-filter.txt
  ./configure LDFLAGS="$LDFLAGS -Wl,--no-as-needed" --prefix=/opt/$pkgname
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir/opt/$pkgname/"
  if [ "$CARCH" = "x86_64" ]; then
     cp -a --no-preserve=mode lib64 "$pkgdir/opt/$pkgname/"
  else
     cp -a --no-preserve=mode lib "$pkgdir/opt/$pkgname/"
  fi
  cp -a --no-preserve=mode resource "$pkgdir/opt/$pkgname/"

  if [ -e "watermark" ]; then
      cp -a --no-preserve=mode watermark "$pkgdir/opt/$pkgname/"
  fi
  install -d "$pkgdir/usr/share/cups/model/$pkgname"
  install -m 644 ppds/* "$pkgdir/usr/share/cups/model/$pkgname"

  cd "$srcdir"
  FILTER_FILE=`ls $_pkgname_filter*.tar.gz`
  cd "${FILTER_FILE%.tar.gz}"
  install -d "$pkgdir/opt/$pkgname/cups/lib/filter/"
  install -m 755 src/epson_inkjet_printer_filter "$pkgdir/opt/$pkgname/cups/lib/filter/epson_inkjet_printer_filter"
}
