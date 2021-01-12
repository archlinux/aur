# Maintainer: buckket <felix@buckket.org>

_pkgname=zigbee2mqtt
pkgname=zigbee2mqtt-git
pkgver=1.12.0.r0.g840b9d9
pkgrel=4
pkgdesc='A Zigbee to MQTT bridge'
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://www.zigbee2mqtt.io'
license=('GPL3')
depends=('nodejs>=10.0')
conflicts=('zigbee2mqtt')
provides=('zigbee2mqtt')
makedepends=('git' 'npm')
optdepends=(
  'cc-tool: To flash Texas Instruments CC2531 debugger'
  'mosquitto: MQTT broker')
source=(
  'zigbee2mqtt::git+https://github.com/Koenkk/zigbee2mqtt.git'
  'zigbee2mqtt.service'
  'zigbee2mqtt.sysusers'
  'zigbee2mqtt.tmpfiles')
sha256sums=('SKIP'
            '36fdca9c274fc143a85cc57d70a36e0ec9455cf86b85d0690ccf0090ee8d682d'
            '3a86716e9036e97d885e9b5f37c7f87d9c2872435e4acf9fc4c9157264cf387b'
            '8f0fbe06c8d6e8fdf37feb31f244930025d76785451f9049fd90fe6e23c259f6')
backup=('etc/zigbee2mqtt/configuration.yaml')
install='zigbee2mqtt.install'
options=('!strip')
  
pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" --cache "${srcdir}/npm-cache" "${srcdir}/${pkgver}.tar.gz"

  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"

  find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  cd "${pkgname}-${pkgver}"
  install -Dm644 data/configuration.yaml "${pkgdir}/etc/${pkgname}/configuration.yaml"

  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

