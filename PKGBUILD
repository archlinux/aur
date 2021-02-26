# Contributor: Andre Klitzing <andre () incubo () de>

pkgname=epson-inkjet-printer-201113w
_pkgname_filter=epson-inkjet-printer-filter
_suffix=1lsb3.2.src.rpm
pkgver=1.0.2
pkgrel=10
pkgdesc="Epson printer driver (WP-4010, WP-4011, WP-4015, WP-4020, WP-4022, WP-4023, WP-4025, WP-4090, WP-4091, WP-4092, WP-4095, WP-4511, WP-4515, WP-4520, WP-4521, WP-4525, WP-4530, WP-4531, WP-4532, WP-4533, WP-4535, WP-4540, WP-4545, WP-4590, WP-4592, WP-4595)"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('LGPL' 'custom:Epson Licence Agreement')
depends=('cups' 'ghostscript')
#makedepends=('libtool' 'make' 'automake' 'autoconf')
source=(http://download.ebz.epson.net/dsc/op/stable/SRPMS/${pkgname}-${pkgver}-${_suffix} fixbuild.patch)

build() {
  cd "$srcdir" || exit
  tar xzf $pkgname-$pkgver.tar.gz
  FILTER_FILE=$(ls $_pkgname_filter*.tar.gz)
  tar xzf $FILTER_FILE

  cd "${FILTER_FILE%.tar.gz}" || exit
  patch -p1 -i "$srcdir"/fixbuild.patch
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
sha256sums=('40257bcd9d35584087712d3c02c01ee2a207ace66d96dee1fdcbbc2823c1c700'
            '85b0493972dcb92befd2bbf8d0ce705fc6280d54d83e985e9f7d0301bb01af50')
