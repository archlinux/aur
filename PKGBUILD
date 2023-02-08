# Maintainer: David Gonzalez <neko.eth0 AT gmail DOT com>
# Contributor: 10101000 <10101000_proton [at] pm.me>
# Contributor: Jeff Henson <jeff [at] henson.io>
# Contributor: Justin Settle <jus10 [at] partlycloudy.org>
# Contributor: Kyle Keen <keenerd [at] gmail.com>, das-ich <das-ich [at] yandex.ru>

pkgname=powerpanel
pkgver=1.4.1
pkgrel=3
pkgdesc="CyberPower UPS daemon"
arch=("x86_64" "i686")
url="https://www.cyberpowersystems.com/product/software/powerpanel-for-linux/"
license=("custom:CyberPower")
depends=('libusb' 'openssl-1.1' 'paho-mqtt-c')
backup=(etc/powerpanel/pwrstatd-{powerfail,lowbatt,email}.sh
        etc/powerpanel/{hibernate,shutdown}.sh
        etc/pwrstatd.conf)

source=('pwrstatd.service'
        'hibernate.sh'
        'shutdown.sh')
sha256sums=('255e5958346daa9d7c0e96ae3d86095afd3b3ec99880205d15d51b8f20a602df'
            'c710ea7765a24fb469adf601f44c8d3857634336bdfc263434ce86c3d67a4a80'
            '10badc96b0ac990959ddc53d1d1cbba6b904e648b54d0eea085194e48d6a0998')

if [[ $CARCH = 'x86_64' ]]; then
  # Filename has two dots at the source
  source+=("https://dl4jz3rbrsfum.cloudfront.net/software/PPL_64bit_v${pkgver}.tar..gz")
  sha256sums+=('6240dae59202531df91ccf0655cf6c61120fe64dc14642c46579366ed0d8212d')
fi

if [[ $CARCH = 'i686' ]]; then
  source+=("https://dl4jz3rbrsfum.cloudfront.net/software/PPL_32bit_v${pkgver}.tar.gz")
  sha256sums+=('25921b474ae5795f7a905368dc06b37b9e49d328cd162a032bcb171a5954d7d1')
fi

package() {
  cd "${srcdir}/$pkgname-$pkgver"

  # PowerPanel for Linux client program
  install -Dm755 bin/pwrstat "${pkgdir}/usr/bin/pwrstat"

  # PowerPanel for Linux daemon program
  install -Dm755 bin/pwrstatd "${pkgdir}/usr/bin/pwrstatd"

  # PowerPanel for Linux daemon configuration
  install -Dm600 conf/pwrstatd.conf "${pkgdir}/etc/pwrstatd.conf"
  sed -e 's#/etc#/etc/powerpanel#' -i "${pkgdir}/etc/pwrstatd.conf"

  # Script command for event of power failure
  install -Dm755 script/pwrstatd-powerfail.sh "${pkgdir}/etc/powerpanel/pwrstatd-powerfail.sh"
  sed -e 's#/etc#/etc/powerpanel#' -i "${pkgdir}/etc/powerpanel/pwrstatd-powerfail.sh"

  # Script command for event of battery low
  install -Dm755 script/pwrstatd-lowbatt.sh "${pkgdir}/etc/powerpanel/pwrstatd-lowbatt.sh"
  sed -e 's#/etc#/etc/powerpanel#' -i "${pkgdir}/etc/powerpanel/pwrstatd-lowbatt.sh"

  # Script command for e-mail notification
  install -Dm755 script/pwrstatd-email.sh "${pkgdir}/etc/powerpanel/pwrstatd-email.sh"

  # Script for hibernate support
  install -Dm755 "${srcdir}/hibernate.sh" "${pkgdir}/etc/powerpanel/hibernate.sh"
  ln -s powerpanel/hibernate.sh "${pkgdir}/etc/hibernate.sh"

  # Script for shutdown support
  install -Dm755 "${srcdir}/shutdown.sh" "${pkgdir}/etc/powerpanel/shutdown.sh"
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
