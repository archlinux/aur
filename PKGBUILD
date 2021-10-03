# Maintainer: Sebastian Zwierzchowski <seba@angrysoft.ovh>

pkgname=zigbee2mqtt
pkgver=1.21.2
pkgrel=1
pkgdesc='A Zigbee to MQTT bridge'
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://www.zigbee2mqtt.io'
license=('GPL3')
depends=('nodejs>=10.0' 'npm')
makedepends=('typescript')
conflicts=('zigbee2mqtt')
provides=('zigbee2mqtt')
optdepends=(
  'cc-tool: To flash Texas Instruments CC2531 debugger'
  'mosquitto: MQTT broker')
source=("https://github.com/Koenkk/${pkgname}/archive/${pkgver}.tar.gz"
  'zigbee2mqtt.service'
  'zigbee2mqtt.sysusers'
  'zigbee2mqtt.tmpfiles')

backup=('etc/zigbee2mqtt/configuration.yaml')
install='zigbee2mqtt.install'
options=('!strip')

package() {
  npm install -g --prefix "${pkgdir}/usr" --cache "${srcdir}/npm-cache" "${srcdir}/${pkgver}.tar.gz"
  cd "${pkgdir}/usr/lib/node_modules/zigbee2mqtt"
  npm install --save-dev
  tsc -b .
  npm prune --production
  node index.js writehash
  cp lib/util/settings.schema.json dist/util
  cd -

  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"

  find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  cd "${pkgname}-${pkgver}"
  install -Dm644 data/configuration.yaml "${pkgdir}/etc/${pkgname}/configuration.yaml"

  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
sha256sums=('0709ed078132012afe17c0913bd282050c330e86767bbf11af3aebf9685225d4'
            'ba2fe8f428b3db56fdee622b3db0d9265e34275218cfbae9866be2000fde9df4'
            '3a86716e9036e97d885e9b5f37c7f87d9c2872435e4acf9fc4c9157264cf387b'
            '8f0fbe06c8d6e8fdf37feb31f244930025d76785451f9049fd90fe6e23c259f6')
