pkgname=epson-inkjet-printer-escpr2
pkgver=1.2.24
pkgrel=1
pkgdesc="Epson Inkjet Printer Driver 2 (ESC/P-R) for Linux"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://support.epson.net/linux/Printer/LSB_distribution_pages/en/escpr2.php"
# the sources are often (delayed) also available from the EPSON driver download page: https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX
license=('LGPL2' 'custom:COPYING.EPSON')
depends=('cups' 'ghostscript')
optdepends=('imagescan: scanner support')
options=('!libtool')
source=('https://download3.ebz.epson.net/dsc/f/03/00/16/58/59/38ceb34cda1d8e34f270e860a2f77dc22a16783b/epson-inkjet-printer-escpr2-1.2.24-1.tar.gz'
        'bug_x86_64.patch')
sha256sums=('6968a79f3e71c68cd83f4376f7b5927886fc68a5442a6edb27d122957584c7a8'
            '1baff7a23db91544fec6ff5a27ba8fe4f05958b7f2f95f0c087518b9c0e1b733')

prepare() {
  tar xvf "$pkgname-$pkgver-$pkgrel.tar.gz"

  cd "$pkgname-$pkgver"

  patch -p1 -i "${srcdir}/bug_x86_64.patch"
}

build() {
  cd "$pkgname-$pkgver"

  autoreconf -f -i

  ./configure --prefix=/usr \
              --with-cupsfilterdir=/usr/lib/cups/filter \
              --with-cupsppddir=/usr/share/ppd
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
