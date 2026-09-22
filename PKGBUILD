# Maintainer: robertfoster
pkgname=mesh-client-bin
_pkgname="${pkgname%-bin}"
pkgver=5.37.1 # renovate: datasource=github-releases depName=Colorado-Mesh/mesh-client
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

sha256sums_x86_64=('cca0e83d3b35a26b0ae0534c574a70deb5aab96d4c6fbd12965d55d802f4b021')
sha256sums_aarch64=('a6ce05f61795bfc17a560f6a7d897847ff0e9129884e4aff788a69413b748a32')
