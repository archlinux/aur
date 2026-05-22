# Maintainer: 0x2501 <0x2501 [at] sol740.net>
# Contributor: 10101000 <10101000_proton [at] pm.me>
# Contributor: Jeff Henson <jeff [at] henson.io>
# Contributor: Justin Settle <jus10 [at] partlycloudy.org>
# Contributor: Kyle Keen <keenerd [at] gmail.com>, das-ich <das-ich [at] yandex.ru>

pkgname=powerpanel
pkgver=1.4.2
pkgrel=3
pkgdesc="CyberPower UPS daemon"
arch=("x86_64" "i686")
url="https://www.cyberpowersystems.com/product/software/power-panel-personal/powerpanel-personal-linux/"
license=("LicenseRef-CyberPower")
options=('staticlibs')
backup=(etc/powerpanel/pwrstatd-{powerfail,lowbatt,email}.sh
        etc/powerpanel/{hibernate,shutdown}.sh
        etc/pwrstatd.conf)
source=('hibernate.sh'
        'shutdown.sh'
        'pwrstatd.service')
source_x86_64=("https://dl4jz3rbrsfum.cloudfront.net/software/PPL_64bit_v${pkgver}.tar.gz")
source_i686=("https://dl4jz3rbrsfum.cloudfront.net/software/PPL_32bit_v${pkgver}.tar.gz")
sha256sums=('c710ea7765a24fb469adf601f44c8d3857634336bdfc263434ce86c3d67a4a80'
            '10badc96b0ac990959ddc53d1d1cbba6b904e648b54d0eea085194e48d6a0998'
            '9a9e8d4156351542acc55c74ca37aa34297709ac000dccd9e370c731591e0d2e')
sha256sums_x86_64=('f257af0fcb5c5df8ba2732b1e0a8a427608f6cef9a7c6ce8ed83d2db2078b859')
sha256sums_i686=('d7ae8ec3c27cb5525fb5cdd840c8e17785294084296b3277f5218d18e97f3f25')

package() {
  cd "${srcdir}/$pkgname-$pkgver"

  # PowerPanel for Linux client program
  install -g power -Dm750 bin/pwrstat "${pkgdir}/usr/bin/pwrstat"
  
  # PowerPanel for Linux daemon program
  install -Dm700 bin/pwrstatd "${pkgdir}/usr/bin/pwrstatd"

  # json-c shared library
  install -Dm644 lib/libjson-c.so.5.1.0 "${pkgdir}/usr/local/lib/powerpanel/libjson-c.so.5.1.0"
  ln -s libjson-c.so.5.1.0 "${pkgdir}/usr/local/lib/powerpanel/libjson-c.so.5"
  
  # paho-mqtt-c shared library
  install -Dm644 lib/libpaho-mqtt3cs.so.1.3.1 "${pkgdir}/usr/local/lib/powerpanel/libpaho-mqtt3cs.so.1.3.1"
  ln -s libpaho-mqtt3cs.so.1.3.1 "${pkgdir}/usr/local/lib/powerpanel/libpaho-mqtt3cs.so.1"

  # crypto shared library
  install -Dm644 lib/libcrypto.so.1.1 "${pkgdir}/usr/local/lib/powerpanel/libcrypto.so.1.1"

  # ssl shared library
  install -Dm644 lib/libssl.so.1.1 "${pkgdir}/usr/local/lib/powerpanel/libssl.so.1.1"

  # PowerPanel for Linux daemon configuration
  install -Dm644 conf/pwrstatd.conf "${pkgdir}/etc/pwrstatd.conf"
  sed -e 's#/etc#/etc/powerpanel#' -i "${pkgdir}/etc/pwrstatd.conf"

  # Script command for event of power failure
  install -Dm700 script/pwrstatd-powerfail.sh "${pkgdir}/etc/powerpanel/pwrstatd-powerfail.sh"
  sed -e 's#/etc#/etc/powerpanel#' -i "${pkgdir}/etc/powerpanel/pwrstatd-powerfail.sh"

  # Script command for event of battery low
  install -Dm700 script/pwrstatd-lowbatt.sh "${pkgdir}/etc/powerpanel/pwrstatd-lowbatt.sh"
  sed -e 's#/etc#/etc/powerpanel#' -i "${pkgdir}/etc/powerpanel/pwrstatd-lowbatt.sh"

  # Script command for e-mail notification
  install -Dm700 script/pwrstatd-email.sh "${pkgdir}/etc/powerpanel/pwrstatd-email.sh"

  # Script for hibernate support
  install -Dm700 "${srcdir}/hibernate.sh" "${pkgdir}/etc/powerpanel/hibernate.sh"
  ln -s powerpanel/hibernate.sh "${pkgdir}/etc/hibernate.sh"

  # Script for shutdown support
  install -Dm700 "${srcdir}/shutdown.sh" "${pkgdir}/etc/powerpanel/shutdown.sh"
  ln -s powerpanel/shutdown.sh "${pkgdir}/etc/shutdown.sh"

  # Systemd unit
  install -Dm644 "${srcdir}/pwrstatd.service" "${pkgdir}/usr/lib/systemd/system/pwrstatd.service"
  
  # PowerPanel for Linux client man-page
  install -Dm644 doc/pwrstat.8 "${pkgdir}/usr/share/man/man8/pwrstat.8"

  # PowerPanel for Linux daemon man-page
  install -Dm644 doc/pwrstatd.8 "${pkgdir}/usr/share/man/man8/pwrstatd.8"

  #
  # compress the man page file
  #
  gzip -9 "${pkgdir}/usr/share/man/man8/pwrstat.8"
  gzip -9 "${pkgdir}/usr/share/man/man8/pwrstatd.8"

  # Install License
  install -D -m644 doc/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
