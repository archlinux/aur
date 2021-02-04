# Maintainer: Michael Stegeman <team@webthings.io>
pkgname=webthings-gateway
pkgver=1.0.0
pkgrel=3
pkgdesc='WebThings Gateway'
url='https://webthings.io/gateway/'
arch=('x86_64')
license=('MPL2')
depends=(
  'lsb-release'
  'nodejs>=10.0.0'       # dubnium (10.x) is what our other distros use
  'nodejs<15.0.0'        # we only test up to 14.x
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
  "${pkgname}-${pkgver}.tar.gz::https://github.com/WebThingsIO/gateway/archive/${pkgver}.tar.gz"
  "${pkgname}.conf"
  "${pkgname}.install"
  "${pkgname}.profile"
  "${pkgname}.service"
  "${pkgname}.sh"
  "${pkgname}.sysusers"
)
sha256sums=(
  'a5274e370e358c6cdfd667c02cc70dbf599af73605eaecab425f07b8cc2a6e71'
  '649135f4ed1fdf557deeba604197f33891d538b4bcf13f9faaa822b3319d1141'
  '6bda15a6d276d5b7f060121bc72f43edb46b40c6670419a1ce3113042fb47381'
  '1a5e41278b02a8c509edaf86d510b4739efb90bbfed4b85df9f2da9ff4eef9a7'
  'e8f4faa6fb1778157d9927d730038ef0f5520c6c3c5cc33222f155d9979238a5'
  '6e424b9563c759b43c21c3104acc73adb706ef1083d176c6019c01dd22a39004'
  'aa94d3c56eae58483b6c0cd860c01ecbb7810db10056d18cbdadac4e86b452ca'
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
