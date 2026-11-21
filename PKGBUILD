# Maintainer: duanluan <duanluan@outlook.com>

pkgname=mirasim
pkgver=0.0.828
pkgrel=1
pkgdesc='Terminal, agent, model and tool orchestrator for shared team spaces'
arch=('x86_64' 'aarch64')
url='https://mirasim.ai/'
license=('LicenseRef-Proprietary')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libdrm'
  'libnotify'
  'libsecret'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'libxtst'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'util-linux-libs'
  'xdg-utils'
)
optdepends=(
  'libappindicator-gtk3: system tray icon support'
)
conflicts=('mirasim-bin')
options=('!strip')
source_x86_64=(
  "Mirasim-${pkgver}-linux-amd64.deb::https://cdn-assets.mirasim.ai/mirasim/releases/v${pkgver}/Mirasim-${pkgver}-linux-amd64.deb"
)
source_aarch64=(
  "Mirasim-${pkgver}-linux-arm64.deb::https://cdn-assets.mirasim.ai/mirasim/releases/v${pkgver}/Mirasim-${pkgver}-linux-arm64.deb"
)
noextract=(
  "Mirasim-${pkgver}-linux-amd64.deb"
  "Mirasim-${pkgver}-linux-arm64.deb"
)
sha256sums_x86_64=(
  '53d775d713e4abf79fa468068b118c7ff9ff85aa37ac632c03f1e1776ee0cf79'
)
sha256sums_aarch64=(
  '2b0463667ef84ffbb327f2b7012e588ba5d6cf5d2c1738e4dd46b27d44d00985'
)

package() {
  local deb_arch
  case "${CARCH}" in
    x86_64) deb_arch='amd64' ;;
    aarch64) deb_arch='arm64' ;;
  esac

  cd "${srcdir}"

  bsdtar -xf "Mirasim-${pkgver}-linux-${deb_arch}.deb" data.tar.xz
  bsdtar -xf data.tar.xz -C "${pkgdir}"

  # The deb's postinst sets this bit; the launcher keeps the sandbox path only
  # when the helper is setuid root.
  chmod 4755 "${pkgdir}/opt/Mirasim/chrome-sandbox"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/Mirasim/mirasim-desktop "${pkgdir}/usr/bin/mirasim-desktop"

  install -Dm644 "${pkgdir}/opt/Mirasim/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 "${pkgdir}/opt/Mirasim/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
