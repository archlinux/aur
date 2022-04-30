_pkgname=zigbee2mqtt
pkgname=zigbee2mqtt-git
pkgver=1.25.0.r68.g7d7f8aab
pkgrel=2
pkgdesc='A Zigbee to MQTT bridge'
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://www.zigbee2mqtt.io'
license=('GPL3')
depends=('nodejs>=10.0' 'nodejs<17')
conflicts=('zigbee2mqtt')
provides=('zigbee2mqtt')
makedepends=('git' 'typescript' 'npm')
optdepends=(
  'cc-tool: To flash Texas Instruments CC2531 debugger'
  'mosquitto: MQTT broker')
source=(
  'zigbee2mqtt::git+https://github.com/Koenkk/zigbee2mqtt.git#branch=dev'
  'zigbee2mqtt.service'
  'zigbee2mqtt.sysusers'
  'zigbee2mqtt.tmpfiles')
backup=('etc/zigbee2mqtt/configuration.yaml')
install='zigbee2mqtt.install'
options=('!strip')
  
pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

package() {
  cd "$srcdir"
  local _tmp_tar="_tmp.tar"
  tar cf "$_tmp_tar" --exclude=".git" ${_pkgname}
  npm install -g --prefix "${pkgdir}/usr" --cache "${srcdir}/npm-cache" "$_tmp_tar"
  rm "$_tmp_tar"

  cd "${pkgdir}/usr/lib/node_modules/zigbee2mqtt"
  npm install --save-dev
  tsc -b .
  npm prune --production
  node index.js writehash

  cp lib/util/settings.schema.json dist/util
  find ${pkgdir} -name "*.d.ts" -delete
  find ${pkgdir} -name "*.d.ts.map" -delete
  find ${pkgdir} -name "*.js.map" -delete

  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"

  find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  install -Dm644 data/configuration.yaml "${pkgdir}/etc/${_pkgname}/configuration.yaml"

  install -Dm644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm644 "${srcdir}/${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -Dm644 "${srcdir}/${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}

sha256sums=('SKIP'
            '386ec3aa56c0ce0a761459fe72c2852e05eb094b49ff02d8911ac63cbc708ab7'
            '8a0e9967ad95ee2464b08cf6e985c6b358272214fceb8fdee2eeaaf92e48d32a'
            '8f0fbe06c8d6e8fdf37feb31f244930025d76785451f9049fd90fe6e23c259f6')
