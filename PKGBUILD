pkgname=epson-inkjet-printer-escpr2
pkgver=1.2.27
pkgrel=1
pkgdesc="Epson Inkjet Printer Driver 2 (ESC/P-R) for Linux"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://support.epson.net/linux/Printer/LSB_distribution_pages/en/escpr2.php"
# the sources are often (delayed) also available from the EPSON driver download page: https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX
license=('LGPL2' 'custom:COPYING.EPSON')
depends=('cups' 'ghostscript')
optdepends=('imagescan: scanner support')
options=('!libtool')
source=('https://download3.ebz.epson.net/dsc/f/03/00/16/77/53/1540531c6f47c62d3846d9a8943b1ecec7f825a1/epson-inkjet-printer-escpr2-1.2.27-1.tar.gz'
        'bug_x86_64.patch')
sha256sums=('87545aaa437e85d546572d1a9dca9f62878da7f4d37c9632e6847184f8b33b64'
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
