pkgname=epson-inkjet-printer-escpr2
pkgver=1.2.44
pkgrel=1
pkgdesc="Epson Inkjet Printer Driver 2 (ESC/P-R) for Linux"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://support.epson.net/linux/Printer/LSB_distribution_pages/en/escpr2.php"
# the sources are often (delayed) also available from the EPSON driver download page: https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX
license=('LGPL-2.1-only' 'LicenseRef-EPSON-EULA')
depends=('cups' 'ghostscript')
optdepends=('imagescan: scanner support')
options=('!libtool')
source=('https://download-center.epson.com/f/module/9d94d78a-8f8c-44da-adbb-4b9026bcf218/epson-inkjet-printer-escpr2-1.2.44-1.tar.gz'
        'bug_x86_64.patch')
sha256sums=('cc938c00bd02618757b643891cd8a28d52f9539c9865874a3cdca379ebb85cd5'
            '57c7a32b7deac873d7e31f043a047e5d65b8e0a47c0d0c07c76c3e3bbd60430a')
DLAGENTS=('https::/usr/bin/curl --user-agent Firefox -qgb "" -fLC - --retry 3 --retry-delay 3 -o %o %u')

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
  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 COPYING.LIB -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 COPYING.EPSON -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
