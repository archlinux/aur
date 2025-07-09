pkgname=epson-inkjet-printer-escpr2
pkgver=1.2.35
pkgrel=1
pkgdesc="Epson Inkjet Printer Driver 2 (ESC/P-R) for Linux"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://support.epson.net/linux/Printer/LSB_distribution_pages/en/escpr2.php"
# the sources are often (delayed) also available from the EPSON driver download page: https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX
license=('LGPL2' 'custom:COPYING.EPSON')
depends=('cups' 'ghostscript')
optdepends=('imagescan: scanner support')
options=('!libtool')
source=('https://download3.ebz.epson.net/dsc/f/03/00/17/28/09/4e8dc40219d4b52e414b608de92552af4fd46eca/epson-inkjet-printer-escpr2-1.2.35-1.tar.gz'
        'bug_x86_64.patch')
sha256sums=('69812e10838dfc2df6fd29e782b797fe7a8affa63392ec5fd24d07a5f7ab4d83'
            '57c7a32b7deac873d7e31f043a047e5d65b8e0a47c0d0c07c76c3e3bbd60430a')

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
