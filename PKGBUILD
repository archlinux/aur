# Maintainer: buckket <felix@buckket.org>

pkgname=zigbee2mqtt
pkgver=1.18.1
pkgrel=2
pkgdesc='A Zigbee to MQTT bridge'
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://www.zigbee2mqtt.io'
license=('GPL3')
depends=('nodejs>=10.0')
makedepends=('npm')
conflicts=('zigbee2mqtt')
provides=('zigbee2mqtt')
optdepends=(
  'cc-tool: To flash Texas Instruments CC2531 debugger'
  'mosquitto: MQTT broker')
source=("https://github.com/Koenkk/${pkgname}/archive/${pkgver}.tar.gz"
  'zigbee2mqtt.service'
  'zigbee2mqtt.sysusers'
  'zigbee2mqtt.tmpfiles')
sha256sums=('9ce1b113743b9d5f722c7a8707d51afd0a85853c0f1bc67c85418749d64f1de3'
            '36fdca9c274fc143a85cc57d70a36e0ec9455cf86b85d0690ccf0090ee8d682d'
            '3a86716e9036e97d885e9b5f37c7f87d9c2872435e4acf9fc4c9157264cf387b'
            '8f0fbe06c8d6e8fdf37feb31f244930025d76785451f9049fd90fe6e23c259f6')
backup=('etc/zigbee2mqtt/configuration.yaml')
install='zigbee2mqtt.install'
options=('!strip')

package() {
  npm install -g --prefix "${pkgdir}/usr" --cache "${srcdir}/npm-cache" "${srcdir}/${pkgver}.tar.gz"

  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"

  find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  cd "${pkgname}-${pkgver}"
  install -Dm644 data/configuration.yaml "${pkgdir}/etc/${pkgname}/configuration.yaml"

  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
