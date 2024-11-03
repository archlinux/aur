# Contributor: Andre Klitzing <andre () incubo () de>
# Contributor: Rohit Singh

pkgname=epson-inkjet-printer-202101w
_pkgname_filter=epson-inkjet-printer-filter
_suffix=1.src.rpm
pkgver=1.0.2
pkgrel=1
pkgdesc="Epson printer driver (L3210)"
arch=('i686' 'x86_64')
install="${pkgname}.install"
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('LGPL' 'custom:Epson Licence Agreement')
depends=('cups' 'ghostscript')
optdepends=('epsonscan2: Epson scanner management utility
             epson-printer-utility: This is a Printer Utility program for Epson. Using this software, you can check ink levels, view error and other status... on EPSON Printers.')
#makedepends=('libtool' 'make' 'automake' 'autoconf')
source=(https://download3.ebz.epson.net/dsc/f/03/00/15/15/02/f5cba2761f2f501363cdbf7e1b9b9879b0715aa5/${pkgname}-${pkgver}-${_suffix} fixbuild.patch)


build() {
  cd "$srcdir" || exit
  tar xzf $pkgname-$pkgver.tar.gz
  FILTER_FILE=$(ls $_pkgname_filter*.tar.gz)
  tar xzf $FILTER_FILE
  cd "${FILTER_FILE%.tar.gz}" || exit
  # patch -p1 -i "$srcdir"/fixbuild.patch
  autoreconf -f -i
  # if you have runtime problems: add "--enable-debug" and look into /tmp/epson-inkjet-printer-filter.txt
  ./configure LDFLAGS="$LDFLAGS -Wl,--no-as-needed" --prefix=/opt/$pkgname
  make
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

}
sha256sums=('9f415fdb07e13ebb98873007d06ae1a58a6475d890deb918ba4bd9c9182b9f9e'
            '2e613da0a2cb86367d7f73612dc381d489a92311b099c048698eac173a7e0c55')
