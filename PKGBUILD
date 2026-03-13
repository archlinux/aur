pkgname=epson-inkjet-printer-escpr2
pkgver=1.2.38
pkgrel=1
pkgdesc="Epson Inkjet Printer Driver 2 (ESC/P-R) for Linux"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://support.epson.net/linux/Printer/LSB_distribution_pages/en/escpr2.php"
# the sources are often (delayed) also available from the EPSON driver download page: https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX
license=('LGPL2' 'custom:COPYING.EPSON')
depends=('cups' 'ghostscript')
optdepends=('imagescan: scanner support')
options=('!libtool')
source=('https://download-center.epson.com/f/module/42a6470c-53bf-4993-abad-ba5b4a1d5d84/epson-inkjet-printer-escpr2-1.2.38-1.tar.gz'
        'bug_x86_64.patch'
        'enable_velvet_fine_art_paper.patch')
sha256sums=('655b9afc5ca7dcba939d67fac67edd0209fe94decd168b78c0503868fd94f7a1'
            '57c7a32b7deac873d7e31f043a047e5d65b8e0a47c0d0c07c76c3e3bbd60430a'
            '84692c469fb18832344b2c5a31b46f10dd7f87691d0c63a8f14adbc06ade114a')

prepare() {
  tar xvf "$pkgname-$pkgver-$pkgrel.tar.gz"

  cd "$pkgname-$pkgver"

  patch -p1 -i "${srcdir}/bug_x86_64.patch"
  patch -p1 -i "${srcdir}/enable_velvet_fine_art_paper.patch"
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
