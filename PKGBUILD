_pkgname=zigbee2mqtt
pkgname=zigbee2mqtt-git
pkgver=1.7.1.r0.gb459c35
pkgrel=1
pkgdesc="A Zigbee to MQTT bridge for domotic devices."
arch=('any')
url="https://www.zigbee2mqtt.io"
license=('GPLv3')
depends=('nodejs>=10.0', 'npm')
conflicts=('zigbee2mqtt')
makedepends=('git')
optdepends=(
  'cc-tool: To flash Texas Instruments CC2531 debugger'
  'mosquitto: MQTT broker')
source=(
  'zigbee2mqtt::git+https://github.com/Koenkk/zigbee2mqtt.git'
  'zigbee2mqtt.service'
  'zigbee2mqtt.sysusers'
  'zigbee2mqtt.tmpfiles')
sha256sums=(
  'SKIP'
  '831ce970669d29ba2db208bec8245c97e80540981dd23276bba10a9b7b699e1b'
  'bf3e49cfb86df460b4db16b280839dc7f0c73fbfd29ea6d86040f711606abf65'
  '5861e6e25350b32fc81cf1a43802470e8ff033a019cba4d28b3bd48c6cb5ddf6')
backup=('opt/zigbee2mqtt/data/configuration.yaml')
  
pkgver() {

  cd zigbee2mqtt
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'

}

package() {

  cd "$_pkgname"
  npm install --cache "${srcdir}/npm-cache" --user root
  install -d -m 650 "${pkgdir}/opt/${_pkgname}"
  cp -dpr --no-preserve=ownership "${srcdir}/${_pkgname}/" "${pkgdir}/opt/"
  install -Dm644 "$srcdir/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm644 "$srcdir/${_pkgname}.sysusers" "$pkgdir/usr/lib/sysusers.d/${_pkgname}.conf"
  install -Dm644 "$srcdir/${_pkgname}.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
