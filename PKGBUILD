# Maintainer:  Lukas Lamper <lukash.lamper@gmail.com>

pkgname=cups-xerox-b2xx
pkgver=1.0
pkgrel=1
pkgdesc='Xerox B205/B210/B215 printer driver for CUPS'
url='https://www.support.xerox.com/support/xerox-b215-multifunction-printer'
arch=('x86_64' 'i386')
license=('custom')
source=('http://download.support.xerox.com/pub/drivers/B215/drivers/linux/ar/Xerox_B215_Linux_PrintDriver_Utilities.tar.gz')
makedepends=('binutils' 'tar')
sha256sums=('ba510467069bf2b0bb13b0cee6f25516da490b0d2d5940846273dfe31a93eb3a')

build() {
    cd "uld"
    find -type f -name '*ppd' -execdir gzip -f {} \;
}

package() {
    cd "uld"
    find ./noarch/etc/ -type f -execdir install -Dm644 {} "$pkgdir/etc/{}" \; -print

    find ./noarch -type f \( -name '*B205*.ppd.gz' -o -name '*B210*.ppd.gz' -o -name '*B215*.ppd.gz' \) -execdir install -Dm644 {} "$pkgdir/usr/share/ppd/xerox/{}" \; -print
    find ./noarch -type f \( -name '*B205*.cts' -o -name '*B210*.cts' -o -name '*B215*.cts' \) -execdir install -Dm644 {} "$pkgdir/usr/share/ppd/cms/{}" \; -print

    install -Dm0755 ./$CARCH/pstosecps "$pkgdir/usr/lib/cups/filter/pstosecps"
    install -Dm0755 ./$CARCH/rastertospl "$pkgdir/usr/lib/cups/filter/rastertospl"
    install -Dm0755 ./$CARCH/libscmssc.so "$pkgdir/usr/lib/libscmssc.so"

    install -Dm0755 ./$CARCH/smfpnetdiscovery "$pkgdir/usr/lib/cups/backend/smfpnetdiscovery"
}
