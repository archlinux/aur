# Maintainer: Michael Stegeman <mstegeman@mozilla.com>
pkgname=webthings-gateway
pkgver=0.12.0
pkgrel=1
pkgdesc='WebThings Gateway by Mozilla'
url='https://iot.mozilla.org/gateway/'
arch=('x86_64')
license=('MPL2')
depends=(
  'lsb-release'
  'nodejs>=10.0.0'       # dubnium (10.x) is what our other distros use
  'nodejs<13.0.0'        # we only test up to 12.x
  'pagekite'
  'python-gateway-addon'
)
makedepends=(
  'git'
  'jq'
  'npm'
  'python2'
)
optdepends=(
  'alsa-utils: required for internet radio add-on'
  'avahi: mDNS hostname broadcast and resolution'
  'ffmpeg: required for video transcoding in ONVIF and virtual things add-on'
  'iputils: required for network presence add-on'
  'mosquitto: required for some MQTT add-ons'
)
backup=()
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/mozilla-iot/gateway/archive/${pkgver}.tar.gz"
  "${pkgname}.conf"
  "${pkgname}.install"
  "${pkgname}.profile"
  "${pkgname}.service"
  "${pkgname}.sh"
  "${pkgname}.sysusers"
)
sha256sums=(
  '70297de904cc480396fd71dd2991dd4c45daa9dd67916a92ff1575f6003fc476'
  '36d1e319305f7da9f678f614387f6a23cd9d660b704932d566a3308819be2260'
  '6bda15a6d276d5b7f060121bc72f43edb46b40c6670419a1ce3113042fb47381'
  '1a5e41278b02a8c509edaf86d510b4739efb90bbfed4b85df9f2da9ff4eef9a7'
  'e8f4faa6fb1778157d9927d730038ef0f5520c6c3c5cc33222f155d9979238a5'
  'e516c724bce5fa9ab9f0652f903c778609dd5b8a7682b169b881a8c0fcb41bbf'
  '38ac347a82f61525e762ba3dd129faf2eb5af03371599626bef7fc66e8bf8a32'
)
install="${pkgname}.install"

build() {
  # Build the gateway
  cd "${srcdir}/gateway-${pkgver}"
  npm --user root --cache "${srcdir}/npm-cache" ci
  ./node_modules/.bin/webpack
  npm --cache "${srcdir}/npm-cache" prune --production

  # Remove references to $srcdir
  find node_modules -name package.json -exec sh -c '
    tmp="$(mktemp)"
    f="{}"
    jq ".|=with_entries(select(.key|test(\"^_.+|^man\$\")|not))" "$f" > "$tmp"
    mv "$tmp" "$f"
    chmod 644 "$f"
    ' \;
  rm -rf node_modules/sqlite3/build
}

package() {
  # Install the code to the package directory
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/gateway-${pkgver}/build" "${pkgdir}/opt/${pkgname}/"
  cp -r "${srcdir}/gateway-${pkgver}/node_modules" "${pkgdir}/opt/${pkgname}/"
  cp -r "${srcdir}/gateway-${pkgver}/src" "${pkgdir}/opt/${pkgname}/"
  cp -r "${srcdir}/gateway-${pkgver}/static" "${pkgdir}/opt/${pkgname}/"
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 0755 '{}' +
  install -Dm644 "${srcdir}/${pkgname}.conf" "${pkgdir}/opt/${pkgname}/config/default.js"
  install -Dm644 "${srcdir}/gateway-${pkgver}/package.json" "${pkgdir}/opt/${pkgname}/package.json"
  install -Dm644 "${srcdir}/gateway-${pkgver}/package-lock.json" "${pkgdir}/opt/${pkgname}/package-lock.json"
  install -Dm644 "${srcdir}/gateway-${pkgver}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

  # System config files
  install -Dm644 "${srcdir}/${pkgname}.profile" "${pkgdir}/etc/profile.d/${pkgname}.sh"
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}

# vim:set ts=2 sw=2 et ft=sh:
