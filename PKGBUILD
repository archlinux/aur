_pkgname=zigbee2mqtt
pkgname=zigbee2mqtt-git
pkgver=2.7.2.r0.g3a49c957
pkgrel=1
pkgdesc='A Zigbee to MQTT bridge'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.zigbee2mqtt.io'
license=('GPL-3.0-or-later')
depends=('nodejs')
conflicts=('zigbee2mqtt')
provides=('zigbee2mqtt')
makedepends=('git' 'typescript' 'npm' 'pnpm' 'python')
optdepends=(
  'mosquitto: MQTT broker')
source=(
  'zigbee2mqtt::git+https://github.com/Koenkk/zigbee2mqtt.git#branch=dev'
  'zigbee2mqtt.service'
  'zigbee2mqtt.sysusers'
  'zigbee2mqtt.tmpfiles')
backup=('etc/zigbee2mqtt/configuration.yaml')
options=('!strip' '!emptydirs')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  # Allow updating the lockfile to match the installed pnpm version
  pnpm i --no-frozen-lockfile
}

build() {
  cd "${_pkgname}"
  pnpm run build
}

package() {
  cd "${_pkgname}"
  # Remove devDependencies to reduce package size
  pnpm prune --prod

  install -m0755 -d "${pkgdir}/usr/share/webapps/${_pkgname}"
  cp -a node_modules dist "${pkgdir}/usr/share/webapps/${_pkgname}"

  install -m0644 cli.js -t "${pkgdir}/usr/share/webapps/${_pkgname}"
  install -m0644 index.js -t "${pkgdir}/usr/share/webapps/${_pkgname}"
  install -m0644 package.json -t "${pkgdir}/usr/share/webapps/${_pkgname}"

  install -Dm644 data/configuration.example.yaml "${pkgdir}/etc/${_pkgname}/configuration.yaml"

  install -Dm644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm644 "${srcdir}/${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -Dm644 "${srcdir}/${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}

sha256sums=('SKIP'
            '02dbaab1711521e3b4004dbf24084e736ae4c2eae97f5c5553c85b05fa807525'
            '8a0e9967ad95ee2464b08cf6e985c6b358272214fceb8fdee2eeaaf92e48d32a'
            '8f0fbe06c8d6e8fdf37feb31f244930025d76785451f9049fd90fe6e23c259f6')
