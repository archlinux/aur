# Maintainer: Sebastian Zwierzchowski <seba@angrysoft.ovh>

pkgname=zigbee2mqtt
pkgver=1.22.2
pkgrel=1
pkgdesc='A Zigbee to MQTT bridge'
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://www.zigbee2mqtt.io'
license=('GPL3')
depends=('nodejs>=10.0' 'nodejs<17')
makedepends=('typescript' 'npm')
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
  find ${pkgdir} -name "*.d.ts" -delete
  find ${pkgdir} -name "*.d.ts.map" -delete
  find ${pkgdir} -name "*.js.map" -delete

  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"

  find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  cd "${pkgname}-${pkgver}"
  install -Dm644 data/configuration.yaml "${pkgdir}/etc/${pkgname}/configuration.yaml"

  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
sha256sums=('0b48dbb8442964be46e6a3293531e8fae768ab454177a103598f0fd4cdaa9b52'
            '3e065dd87c9ae7573165721a60d56756952bd8199b411a508dd343f64c755c7a'
            '3a86716e9036e97d885e9b5f37c7f87d9c2872435e4acf9fc4c9157264cf387b'
            '8f0fbe06c8d6e8fdf37feb31f244930025d76785451f9049fd90fe6e23c259f6')
