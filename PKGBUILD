# Maintainer: duanluan <duanluan@outlook.com>

pkgname=mirasim
pkgver=0.0.842
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
  '6f5d978d7cf27bd7b010d5b292e7c48caec4a1815ad1e131addb89c144ae1ac9'
)
sha256sums_aarch64=(
  'dcd98c48d25cbf1df45f6bb85a53722913aa9fda144cbec79f4d840a1cc48df3'
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
