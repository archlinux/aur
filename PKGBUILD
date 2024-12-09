# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgbase=superconductor
pkgname=('superconductor' 'tsr-bridge')
pkgver=0.11.3
pkgrel=5
_pkgname=SuperConductor
_njsver=18.20.5
arch=('x86_64')
url="https://github.com/SuperFlyTV/SuperConductor"
license=('LicenseRef-unknown' 'AGPL-3.0-only')
_common_deps=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libdrm'
  'libvips'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'python'
)
makedepends=('nvm' 'yarn' 'python-setuptools' "${_common_deps[@]}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "superconductor.desktop"
        "tsr-bridge.desktop")
sha256sums=('b3ce1cfaca92a21bdd20ff20b5ec32a109f5a9f93e7ffdcd29a87c2ab0a18590'
            '40968067cd055add4f6cfbffa4ca52155abc5771a44df2fca548d691b433bb3a'
            '7e3f99900f3feb6f4d9bae385adaa42a6aae46a8ac8ebcd2bd69b9dfac5e93ea')

_ensure_local_nvm() {
  # Ensure NVM is properly loaded
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
  export NVM_DIR="${srcdir}/.nvm"
  if ! source /usr/share/nvm/init-nvm.sh; then
    echo "Error: Failed to initialize NVM."
    exit 1
  fi
}

prepare() {
  cd "${_pkgname}-${pkgver}"
  _ensure_local_nvm

  # Install required Node.js version using NVM
  nvm install ${_njsver}

  # Workaround for husky requiring a .git directory
  mkdir -p .git
  yarn install --silent --cache "${srcdir}/yarn-cache"
}

build() {
  cd "${_pkgname}-${pkgver}"
  _ensure_local_nvm

  # Build the project and binaries
  yarn build
  yarn build:binary
}

package_superconductor() {
  pkgdesc="Playout client to control CasparCG Server, BMD ATEM, OBS Studio, and more"
  depends=("${_common_deps[@]}")
  optdepends=('tsr-bridge: External application for playout and device control')

  # Install main application
  install -dm755 "${pkgdir}/usr/bin" "${pkgdir}/opt/${pkgbase}"
  cp -Pr --no-preserve=ownership,mode "${srcdir}/${_pkgname}-${pkgver}/apps/app/dist/linux-unpacked"/* "${pkgdir}/opt/${pkgbase}"
  chmod 755 "${pkgdir}/opt/${pkgbase}/${pkgbase}"
  ln -s "/opt/${pkgbase}/${pkgbase}" "${pkgdir}/usr/bin/${pkgbase}"

  # Install icons
  for icon in "${srcdir}/${_pkgname}-${pkgver}/apps/app/build/icons/"*.png; do
    size=$(basename "$icon" .png)
    install -Dm644 "$icon" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${pkgbase}.png"
  done

  # Install desktop entry and license
  install -Dm644 "${srcdir}/superconductor.desktop" "${pkgdir}/usr/share/applications/${pkgbase}.desktop"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

package_tsr-bridge() {
  pkgdesc="Handles playout and control of connected devices"
  depends=("${_common_deps[@]}")

  # Install TSR-Bridge application
  install -dm755 "${pkgdir}/usr/bin" "${pkgdir}/opt/tsr-bridge"
  cp -Pr --no-preserve=ownership,mode "${srcdir}/${_pkgname}-${pkgver}/apps/tsr-bridge/dist/linux-unpacked"/* "${pkgdir}/opt/tsr-bridge"
  chmod 755 "${pkgdir}/opt/tsr-bridge/tsr-bridge"
  ln -s "/opt/tsr-bridge/tsr-bridge" "${pkgdir}/usr/bin/tsr-bridge"

  # Install icon
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/apps/tsr-bridge/assets/tray.png" \
    "${pkgdir}/usr/share/icons/hicolor/48x48/apps/tsr-bridge.png"

  # Install desktop entry and license
  install -Dm644 "${srcdir}/tsr-bridge.desktop" "${pkgdir}/usr/share/applications/tsr-bridge.desktop"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/tsr-bridge/LICENSE"
}

# vim: set ts=2 sw=2 et:
