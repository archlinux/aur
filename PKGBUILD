# Maintainer: robertfoster
pkgname=mesh-client-bin
_pkgname="${pkgname%-bin}"
pkgver=6.11.1 # renovate: datasource=github-releases depName=Colorado-Mesh/mesh-client
pkgrel=1
pkgdesc="Electron desktop client for Meshtastic, MeshCore and Reticulum with BLE, USB serial, TCP and MQTT transports"
arch=('x86_64' 'aarch64')
url="https://github.com/Colorado-Mesh/mesh-client"
license=('GPL-3.0-or-later')
depends=('at-spi2-core' 'gcc-libs' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libnotify'
  'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'xdg-utils')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_arm64.deb")

prepare() {
  bsdtar -xf data.tar.* -C "${srcdir}"

  # upstream points at its own /opt prefix and ships no keywords
  sed -i -e "s|^Exec=.*|Exec=${_pkgname} %U|" \
    -e '/^Categories=/s|Utility;|Network;Utility;|' \
    "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}

package() {
  install -d "${pkgdir}/usr/lib" "${pkgdir}/usr/bin"
  cp -a "${srcdir}/opt/Mesh-client" "${pkgdir}/usr/lib/${_pkgname}"
  ln -s "/usr/lib/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # Electron's SUID sandbox helper; without the bit the app refuses to start
  chmod 4755 "${pkgdir}/usr/lib/${_pkgname}/chrome-sandbox"

  install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  local _size
  for _size in 16 32 64 128 256; do
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${_pkgname}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${_pkgname}.png"
  done
}

sha256sums_x86_64=('861a988bb9e58eca22212b2dd0a97091fbe55652bee00512d2dd510b239e9042')
sha256sums_aarch64=('8e2e8279afbb9de2d08c4befa0a899945c0df5287fc337aab42bdc718d22f4f7')
