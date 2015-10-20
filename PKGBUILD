# Maintainer: Michal Lisowski <lisu87@gmail.com>
#
# Based on:
# cnijfilter-e400series by Kaan Karaagacli <kaankaraagacli@gmail.com>
#

pkgname=cnijfilter-mx530series
pkgver=4.10
pkgrel=1
pkgdesc="Canon IJ Printer Driver (for MX530 series)"
arch=('i686' 'x86_64')
url="http://www.canon.co.uk/support/consumer_products/products/fax__multifunctionals/inkjet/pixma_mx_series/pixma_mx535.aspx?type=drivers&language=&os=Linux%20%2832-bit%29"
license=('custom')
depends=('popt' 'libcups' 'libxml2')
source=('http://gdlp01.c-wss.com/gds/7/0100005877/01/cnijfilter-mx530series-4.10-1-deb.tar.gz')
md5sums=('3fcdd66493ce9082ad0456fdaa700b15')

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
    ar -x "$srcdir/${pkgname}-${pkgver}-1-deb/packages/cnijfilter-mx530series_${pkgver}-1_${debarch}.deb" data.tar.gz
    tar -xf data.tar.gz && rm data.tar.gz

    # Weird permissions error from namcap
    chmod 664 usr/lib/bjlib/cnnet.ini
    chown root:root usr/lib/bjlib/cnnet.ini

    # Move licenses to their proper locations
    install -d usr/share/licenses/cnijfilter-mx530series
    mv usr/share/doc/cnijfilter-common/LICENSE-cnijfilter-${pkgver}*.txt usr/share/licenses/cnijfilter-mx530series/
    rm -r usr/share/doc/

    # Move the udev rule to its proper location
    mv etc/udev usr/lib/
    rmdir etc/
}

