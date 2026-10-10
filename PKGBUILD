pkgname=epson-inkjet-printer-escpr2
pkgver=1.2.43
pkgrel=1
pkgdesc="Epson Inkjet Printer Driver 2 (ESC/P-R) for Linux"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://support.epson.net/linux/Printer/LSB_distribution_pages/en/escpr2.php"
# the sources are often (delayed) also available from the EPSON driver download page: https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX
license=('LGPL2' 'custom:COPYING.EPSON')
depends=('cups' 'ghostscript')
optdepends=('imagescan: scanner support')
options=('!libtool')
source=('https://download-center.epson.com/f/module/69c52e3b-13a9-47ff-ba74-84047324a47b/epson-inkjet-printer-escpr2-1.2.43-1.tar.gz'
        'bug_x86_64.patch')
sha256sums=('b93db25c34eb54bf31ef607f15f45f9b883cd5c604f99720d4f4e46165e8b340'
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
}
