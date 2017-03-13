# Maintainer: Justin Settle <jus10 [at] partlycloudy.org>
# Contributor: Kyle Keen <keenerd [at] gmail.com>, das-ich <das-ich [at] yandex.ru>
pkgname=powerpanel
pkgver=1.3.2
pkgverdl=132 # new URL doesn't include the decimal
pkgrel=2
pkgdesc="CyberPower UPS daemon"
arch=("x86_64" "i686")
url="http://www.cyberpowersystems.com"
license=("custom:CyberPower")
depends=('libusb')
backup=(etc/powerpanel/pwrstatd-{powerfail,lowbatt,email}.sh
    etc/pwrstatd.conf)

if [[ $CARCH = 'x86_64' ]]; then
  source=(https://dl4jz3rbrsfum.cloudfront.net/software/powerpanel-$pkgverdl-x86_64.tar.gz pwrstatd.service)
  sha256sums=('265099590e82303fa1082a84dda02488d41762ca5b94f2bb7fd395c9b4ac1c36'
            '2bcf5ba2c5d8c9ab886b6a5aba06f0da1630fabb440621860b2da221fcf9eb34')
fi

if [[ $CARCH = 'i686' ]]; then
  source=( https://dl4jz3rbrsfum.cloudfront.net/software/powerpanel-$pkgverdl-i386.tar.gzpwrstatd.service)
  sha256sums=('a0931fe71b7def7b72a1a80b9fc9a6419032eb98f78ad9da2971c904f88dc8f3'
  	    '2bcf5ba2c5d8c9ab886b6a5aba06f0da1630fabb440621860b2da221fcf9eb34')

fi

package() {
    cd ${srcdir}/$pkgname-$pkgver
#
# copy files
#

# PowerPanel for Linux client program
install -Dm755 bin/pwrstat ${pkgdir}/usr/bin/pwrstat

# PowerPanel for Linux daemon program
install -Dm755 bin/pwrstatd ${pkgdir}/usr/bin/pwrstatd

# PowerPanel for Linux daemon configuration
install -Dm600 conf/pwrstatd.conf ${pkgdir}/etc/pwrstatd.conf
sed -e 's#/etc#/etc/powerpanel#' -i ${pkgdir}/etc/pwrstatd.conf

# Script command for event of power failure
install -Dm755 script/pwrstatd-powerfail.sh ${pkgdir}/etc/powerpanel/pwrstatd-powerfail.sh
sed -e 's#/etc#/etc/powerpanel#' -i ${pkgdir}/etc/powerpanel/pwrstatd-powerfail.sh

# Script command for event of battery low
install -Dm755 script/pwrstatd-lowbatt.sh ${pkgdir}/etc/powerpanel/pwrstatd-lowbatt.sh
sed -e 's#/etc#/etc/powerpanel#' -i ${pkgdir}/etc/powerpanel/pwrstatd-lowbatt.sh

# Script command for e-mail notification
install -Dm755 script/pwrstatd-email.sh ${pkgdir}/etc/powerpanel/pwrstatd-email.sh

# Systemd unit
install -Dm644 ../pwrstatd.service ${pkgdir}/usr/lib/systemd/system/pwrstatd.service

# PowerPanel for Linux client man-page
install -Dm644 doc/pwrstat.8 ${pkgdir}/usr/share/man/man8/pwrstat.8

# PowerPanel for Linux daemon man-page
install -Dm644 doc/pwrstatd.8 ${pkgdir}/usr/share/man/man8/pwrstatd.8

#
# compress the man page file
#
gzip -9 ${pkgdir}/usr/share/man/man8/pwrstat.8
gzip -9 ${pkgdir}/usr/share/man/man8/pwrstatd.8

# Install License
install -D -m644 doc/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
