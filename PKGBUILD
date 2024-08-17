# Original Contributor: Andre Klitzing <andre () incubo () de>
# Contributor: Moises Serrano <linkmoises at gmail dot com>

pkgname=epson-inkjet-printer-201401w
_pkgname_filter=epson-inkjet-printer-filter
_suffix=src.rpm
pkgver=1.0.1
pkgrel=1
pkgdesc="Epson printer driver (L456, L455, L366, L365, L362, L360, L312, L310, L222, L220, L132, L130)"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('LGPL' 'custom:Epson Licence Agreement')
depends=('cups' 'ghostscript')
#makedepends=('libtool' 'make' 'automake' 'autoconf')
source=(https://download3.ebz.epson.net/dsc/f/03/00/15/66/49/15de0a76a6f210cd3dcff8bafd80bbf2c89e2f3e/${pkgname}-${pkgver}-${pkgrel}.${_suffix})


build() {
  cd "$srcdir" || exit
  tar xzf $pkgname-$pkgver.tar.gz
  FILTER_FILE=$(ls $_pkgname_filter*.tar.gz)
  tar xzf $FILTER_FILE

  cd "${FILTER_FILE%.tar.gz}" || exit
  autoreconf -f -i
  # if you have runtime problems: add "--enable-debug" and look into /tmp/epson-inkjet-printer-filter.txt
  ./configure LDFLAGS="$LDFLAGS -Wl,--no-as-needed" --prefix=/opt/$pkgname
  make -j$(nproc)
}

package() {
  cd "$srcdir/$pkgname-$pkgver" || exit
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

  cd "$srcdir" || exit
  FILTER_FILE=$(ls $_pkgname_filter*.tar.gz)
  cd "${FILTER_FILE%.tar.gz}" || exit
  install -d "$pkgdir/opt/$pkgname/cups/lib/filter/"
  install -m 755 src/epson_inkjet_printer_filter "$pkgdir/opt/$pkgname/cups/lib/filter/epson_inkjet_printer_filter"
  install -d "$pkgdir/usr/lib/cups/filter/"
  install -m 755 src/epson_inkjet_printer_filter "$pkgdir/usr/lib/cups/filter/epson_inkjet_printer_filter"
}

sha256sums=('05dda3ae3f128cd3f2411ce32d79f4549e11e41e28b0de47cce9cdbde2cf1e66')