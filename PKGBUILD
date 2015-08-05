# Maintainer: Justin Settle <jus10 [at] partlycloudy.org>
# Contributor: Kyle Keen <keenerd [at] gmail.com>, das-ich <das-ich [at] yandex.ru>
pkgname=powerpanel
pkgver=1.3.2
pkgrel=1
pkgdesc="CyberPower UPS daemon"
arch=("x86_64" "i686")
url="http://www.cyberpowersystems.com"
license=("custom:CyberPower")
depends=('libusb')
backup=(etc/powerpanel/pwrstatd-{powerfail,lowbatt,email}.sh
    etc/pwrstatd.conf)

if [[ $CARCH = 'x86_64' ]]; then
  source=(http://www.cyberpowersystems.com/software/powerpanel-$pkgver-$CARCH.tar.gz pwrstatd.service)
  md5sums=('d69233e117f92611931cb820bad141df'
         'b945ff7c15ef206022c8df29a96338c8')
fi

if [[ $CARCH = 'i686' ]]; then
  source=(http://www.cyberpowersystems.com/software/powerpanel-$pkgver-i386.tar.gz pwrstatd.service)
  md5sums=('833f35179a8b0ca303698de08f048c8b'
       'b945ff7c15ef206022c8df29a96338c8')
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

# Script command for event of battery low
install -Dm755 script/pwrstatd-lowbatt.sh ${pkgdir}/etc/powerpanel/pwrstatd-lowbatt.sh

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
