# Maintainer: Michael Stegeman <mstegeman@mozilla.com>
pkgname=webthings-gateway
pkgver=0.10.0
pkgrel=3
pkgdesc='WebThings Gateway by Mozilla'
url='https://iot.mozilla.org/gateway/'
arch=('x86_64')
license=('MPL2')
depends=(
  'lsb-release'
  'nodejs>=8.0.0'        # carbon (8.x) is what our other distros use
  'nodejs<13.0.0'        # we only test up to 12.x
  'pagekite'
  'python-adapt-parser'
  'python-argparse'      # this is really a dependency of python-adapt-parser
  'python-gateway-addon'
  'python-pip'
  'python-pyee'          # this is really a dependency of python-adapt-parser
  'python-six'           # this is really a dependency of python-adapt-parser
)
makedepends=(
  'git'
  'jq'
  'npm'
  'python-setuptools'
  'python2'
)
optdepends=(
  'avahi: mDNS hostname broadcast and resolution'
  'ffmpeg: required for video transcoding in ONVIF and virtual things add-on'
  'iputils: required for network presence add-on'
  'mosquitto: required for some MQTT add-ons'
)
backup=()
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/mozilla-iot/gateway/archive/${pkgver}.tar.gz"
  "gateway-addon-python.tar.gz::https://github.com/mozilla-iot/gateway-addon-python/archive/v0.10.0.tar.gz"
  "intent-parser.zip::https://github.com/mozilla-iot/intent-parser/archive/52b1d7f1f9d53d83adb813bc7bfbbbed203c0627.zip"
  "${pkgname}.conf"
  "${pkgname}.install"
  "${pkgname}.service"
  "${pkgname}-intent-parser.service"
  "${pkgname}.sh"
  "${pkgname}.sysusers"
)
sha256sums=(
  '1346efa975cc25d32c30a40620597e6af5c027e8b5dc975218cbf8a004ba5d57'
  'b288d3e5adaa9de103e8e340c82889f6afa9dfee1b1e6d01d175c55ccf1cc0f3'
  'b59382026981c14bd5a08c82cb88d9ebb159ed98b0fb7bcaf954bc2f41f7b2d5'
  '8c2f4a28c9bdd4571d27e98e1f4beecd9fc7d8bfa57c412f2d749d4c0a774cde'
  '60a275bf3a4b93defcc2a47a0833e9baf2e019443f401a4399e81277f8c9bf5c'
  'e8f4faa6fb1778157d9927d730038ef0f5520c6c3c5cc33222f155d9979238a5'
  '68685a10449c51fd8fa48fc8a4c399b36e22148a58d939e8f4b99a91c37c34e8'
  'e516c724bce5fa9ab9f0652f903c778609dd5b8a7682b169b881a8c0fcb41bbf'
  '38ac347a82f61525e762ba3dd129faf2eb5af03371599626bef7fc66e8bf8a32'
)
install="${pkgname}.install"

build() {
  # Build the gateway
  cd "${srcdir}/gateway-${pkgver}"
  rm -rf ./node_modules package-lock.json
  npm --user root --cache "${srcdir}/npm-cache" install
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
  rm node_modules/nanomsg/build/Makefile node_modules/nanomsg/build/config.gypi
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
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/${pkgname}-intent-parser.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}-intent-parser.service"
  install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

  # Intent parser
  install -Dm755 "${srcdir}/intent-parser-52b1d7f1f9d53d83adb813bc7bfbbbed203c0627/intent-parser-server.py" "${pkgdir}/opt/${pkgname}/intent-parser/intent-parser-server.py"
}

# vim:set ts=2 sw=2 et ft=sh:
