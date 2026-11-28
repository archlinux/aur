# Maintainer: duanluan <duanluan@outlook.com>

pkgname=qoder-cn
pkgver=0.5.21
pkgrel=1
pkgdesc='Qoder CN desktop app, an agentic coding workbench from Alibaba'
arch=('x86_64' 'aarch64')
url='https://qoder.cn/'
license=('LicenseRef-Proprietary')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'gtk3'
  'hicolor-icon-theme'
  'libnotify'
  'libsecret'
  'libxss'
  'libxtst'
  'nss'
  'util-linux-libs'
  'xdg-utils'
)
optdepends=(
  'libappindicator-gtk3: system tray icon support'
)
conflicts=('qoder-cn-bin')
options=('!strip')
source_x86_64=(
  "Qoder-CN-linux-${pkgver}-amd64.deb::https://qoder-app.oss-cn-beijing.aliyuncs.com/qoder-app/releases/${pkgver}/Qoder-CN-linux-amd64.deb"
)
source_aarch64=(
  "Qoder-CN-linux-${pkgver}-arm64.deb::https://qoder-app.oss-cn-beijing.aliyuncs.com/qoder-app/releases/${pkgver}/Qoder-CN-linux-arm64.deb"
)
noextract=(
  "Qoder-CN-linux-${pkgver}-amd64.deb"
  "Qoder-CN-linux-${pkgver}-arm64.deb"
)
sha256sums_x86_64=(
  '12a67e10694e91c88a71b5061aeb7936eab7b804efad374ffcbaaa3a939e5ea2'
)
sha256sums_aarch64=(
  '1be187bb210c000474c31a88eb2dbf554b7e73127d2091190f060b98dbf85859'
)

package() {
  local deb_arch
  case "${CARCH}" in
    x86_64) deb_arch='amd64' ;;
    aarch64) deb_arch='arm64' ;;
  esac

  cd "${srcdir}"

  bsdtar -xf "Qoder-CN-linux-${pkgver}-${deb_arch}.deb" data.tar.xz
  bsdtar -xf data.tar.xz -C "${pkgdir}"

  # Electron's sandbox helper must retain its setuid bit for sandboxed renderers.
  chmod 4755 "${pkgdir}/opt/Qoder-CN/chrome-sandbox"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/Qoder-CN/qoder-cn" "${pkgdir}/usr/bin/qoder-cn"

  install -Dm644 "${pkgdir}/opt/Qoder-CN/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 "${pkgdir}/opt/Qoder-CN/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
