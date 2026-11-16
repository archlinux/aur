# Maintainer: duanluan <duanluan@outlook.com>

pkgname=qoder-cn
pkgver=0.5.13
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
  '13ea9a91b9475572fe10538d87b632ee0a91e7c0f666f72d40c90a2f6706dd78'
)
sha256sums_aarch64=(
  'bf2943f1584e88e5ddaaf52283073182b10ce10296e43dfc75c3ae4ee78cc15f'
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
