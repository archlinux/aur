# Maintainer: Kaan Karaagacli <kaankaraagacli@gmail.com>
#
# Based on:
# cnijfilter2-mg7500 by Yuto Tokunaga (yuntan_t) <toku DOT yuuto AT gmail DOT com>
# cnijfilter-mg3500series by yaroslav <proninyaroslav@mail.ru>
#

pkgname=cnijfilter-e400series
pkgver=4.10
pkgrel=1
pkgdesc="Canon IJ Printer Driver (for E400 series)"
arch=('i686' 'x86_64')
url="http://www.canon-europe.com/support/consumer_products/products/printers/inkjet/other_pixma/pixma_e404.aspx?type=drivers&language=EN&os=Linux%20(64-bit)"
license=('custom')
depends=('popt' 'libcups' 'libxml2')
source=('http://gdlp01.c-wss.com/gds/1/0100005881/01/cnijfilter-e400series-4.10-1-deb.tar.gz')
md5sums=('0b8f335b6298561e67db957528f8ed34')

package() {
    if [ "${CARCH}" = 'x86_64' ]; then
      debarch="amd64"
    elif [ "${CARCH}" = 'i686' ]; then
      debarch="i386"
    fi

    cd "$pkgdir"

    # Common files
    ar -x "$srcdir/${pkgname}-${pkgver}-1-deb/packages/cnijfilter-common_${pkgver}-1_${debarch}.deb" data.tar.gz
    tar -xf data.tar.gz && rm data.tar.gz

    # Model specific files
    ar -x "$srcdir/${pkgname}-${pkgver}-1-deb/packages/cnijfilter-e400series_${pkgver}-1_${debarch}.deb" data.tar.gz
    tar -xf data.tar.gz && rm data.tar.gz

    # Weird permissions error from namcap
    chmod 664 usr/lib/bjlib/cnnet.ini
    chown root:root usr/lib/bjlib/cnnet.ini

    # Move licenses to their proper locations
    install -d usr/share/licenses/cnijfilter-e400series
    mv usr/share/doc/cnijfilter-common/LICENSE-cnijfilter-${pkgver}*.txt usr/share/licenses/cnijfilter-e400series/
    rm -r usr/share/doc/

    # Move the udev rule to its proper location
    mv etc/udev usr/lib/
    rmdir etc/
}
