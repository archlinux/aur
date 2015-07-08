# Contributor: Andre Klitzing <andre () incubo () de>

pkgname=epson-inkjet-printer-201310w
_pkgname_filter=epson-inkjet-printer-filter
_suffix=1lsb3.2.src.rpm
pkgver=1.0.0
pkgrel=8
pkgdesc="Epson printer driver (L120)"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('LGPL' 'custom:Epson Licence Agreement')
depends=('cups' 'ghostscript')
#makedepends=('libtool' 'make' 'automake' 'autoconf')
source=(http://download.ebz.epson.net/dsc/op/stable/SRPMS/${pkgname}-${pkgver}-${_suffix})

build() {
  cd "$srcdir"
  tar xzf $pkgname-$pkgver.tar.gz
  FILTER_FILE=`ls $_pkgname_filter*.tar.gz`
  tar xzf $FILTER_FILE

  cd "${FILTER_FILE%.tar.gz}"
  aclocal
  libtoolize
  chmod +x configure
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
sha256sums=('d70e1f049c95bd77a704b58d37955393be9d9779ef5e88ae9f63efe0d5a1c76a')
