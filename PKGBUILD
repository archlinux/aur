# Maintainer: Ben Alex <ben.alex@acegi.com.au>
pkgname=broadlink-mqtt-git
pkgver=r100.d16c9ee
pkgrel=1
pkgdesc='mqtt client to control broadlink devices'
arch=('any')
url=https://github.com/eschava/broadlink-mqtt
license=('MIT')

backup=('etc/broadlink-mqtt.conf')
source=('git+https://github.com/eschava/broadlink-mqtt.git'
        'broadlink-mqtt.service'
        'broadlink-mqtt.sysusers'
        'broadlink-mqtt.tmpfiles'
        'logging.conf')
sha256sums=('SKIP'
            '75fd82b6ad0383c9648d5bbd7000742f6f747b5492bf66bd13463485011cd1e3'
            '57053c5e5e440128b38557587c0a94951b00a5fd25fc1e2c6e1ec61de8a1d7e1'
            'dab3828f253ce892a49907dcf704a9875b136838c860ca2b966d1277a41a6bb2'
            'f2c45e497ab765b1a610763d890c8991b375505d6d543866a1478e5c0b9736d8')

depends=('python' 'python-paho-mqtt' 'python-broadlink')

pkgver() {
  cd broadlink-mqtt
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
    install -Dm644 broadlink-mqtt.sysusers "${pkgdir}/usr/lib/sysusers.d/broadlink-mqtt.conf"
    install -Dm644 broadlink-mqtt.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/broadlink-mqtt.conf"
    install -Dm644 broadlink-mqtt.service "${pkgdir}/usr/lib/systemd/system/broadlink-mqtt.service"
    install -Dm644 logging.conf "${pkgdir}/usr/lib/broadlink-mqtt/logging.conf"
    cd broadlink-mqtt/
    install -Dm644 custom.conf "${pkgdir}/etc/broadlink-mqtt.conf"
    install -Dm644 mqtt.py "${pkgdir}/usr/lib/broadlink-mqtt/mqtt.py"
    install -Dm644 test.py "${pkgdir}/usr/lib/broadlink-mqtt/test.py"
    install -Dm644 mqtt.conf "${pkgdir}/usr/lib/broadlink-mqtt/mqtt.conf"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
