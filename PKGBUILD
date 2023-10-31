pkgname=epson-inkjet-printer-escpr2
pkgver=1.2.9
pkgrel=1
pkgdesc="Epson Inkjet Printer Driver 2 (ESC/P-R) for Linux"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://support.epson.net/linux/Printer/LSB_distribution_pages/en/escpr2.php"
# the sources are often (delayed) also available from the EPSON driver download page: https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX
license=('LGPL2' 'custom:COPYING.EPSON')
depends=('cups' 'ghostscript')
optdepends=('imagescan: scanner support')
options=('!libtool')
source=('https://download3.ebz.epson.net/dsc/f/03/00/15/33/96/607198a4f064daa9e7931913eaf27f3a58125f2b/epson-inkjet-printer-escpr2-1.2.9-1.tar.gz'
        'bug_x86_64.patch')
sha256sums=('83a62af161d1b5127d4aacd50dcc09f668dfd7f35537a43dbcc5da891641888b'
            'ae480931863a195fb924fc5e5ea00478b3faa6cfb1507919d462f122be7d7084')

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
