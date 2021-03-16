# Original Contributor: Andre Klitzing <andre () incubo () de>
# Contributor: Moises Serrano <linkmoises at gmail dot com>

pkgname=epson-inkjet-printer-201401w
_pkgname_filter=epson-inkjet-printer-filter
_suffix=1lsb3.2.src.rpm
pkgver=1.0.0
pkgrel=10
pkgdesc="Epson printer driver (L456, L455, L366, L365, L362, L360, L312, L310, L222, L220, L132, L130)"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('LGPL' 'custom:Epson Licence Agreement')
depends=('cups' 'ghostscript')
#makedepends=('libtool' 'make' 'automake' 'autoconf')
source=(https://download3.ebz.epson.net/dsc/f/03/00/03/45/41/92e9c9254f0ee4230a069545ba27ec2858a2c457/${pkgname}-${pkgver}-${_suffix} fixbuild.patch)

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
sha256sums=('7d4c4ff143a3a50eb254aa863dc10ab01dc5a3b585353454d344a7d274a8c030'
            '2e613da0a2cb86367d7f73612dc381d489a92311b099c048698eac173a7e0c55')
