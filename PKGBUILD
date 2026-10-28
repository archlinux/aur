# Maintainer: robertfoster
pkgname=mesh-client-bin
_pkgname="${pkgname%-bin}"
pkgver=6.5.0 # renovate: datasource=github-releases depName=Colorado-Mesh/mesh-client
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

sha256sums_x86_64=('ad35dc47e89440d90a33674ed2399a9bd4880e61648ffac62dee3585368b4639')
sha256sums_aarch64=('78f97955300d3d232c5d073ed7dbc0e6e4fbefcd7f64d7ecefa837d904735d69')
