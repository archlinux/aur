# Maintainer: mensylisir <710080675@qq.com>

# 国际版官方 deb，区域判定被改成固定 global：不使用登录态或区域标记切换 API。
# 应用整体安装在独立 /opt 前缀，命令名 kimi-code，与国内版可并存。

pkgname=kimi-code-intl-bin
pkgver=1.3.2
pkgrel=2
_appname='Kimi Code'
_prefix='/opt/kimi-code-intl'
pkgdesc='Kimi Code Desktop, international build pinned to the global API'
arch=('x86_64')
url='https://code.kimi.ai/'
license=('LicenseRef-proprietary')
depends=(
  'gtk3'
  'alsa-lib'
  'mesa'
  'libnotify'
  'nss'
  'libxss'
  'libxtst'
  'libsecret'
  'at-spi2-core'
  'xdg-utils'
)
makedepends=('asar' 'nodejs')
conflicts=('kimi-code-desktop-bin')
options=('!strip' '!debug')

source=(
  "KimiCode-${pkgver}-linux-amd64.deb::https://code.kimi.ai/kimi-code/desktop/binaries/${pkgver}/KimiCode-${pkgver}-linux-amd64.deb"
  'patch-region.js'
  'kimi-code-intl.sh'
  'kimi-code-intl.desktop'
  'kimi-code-intl-16.png'
  'kimi-code-intl-24.png'
  'kimi-code-intl-32.png'
  'kimi-code-intl-48.png'
  'kimi-code-intl-64.png'
  'kimi-code-intl-128.png'
  'kimi-code-intl-256.png'
  'kimi-code-intl-512.png'
)
noextract=("KimiCode-${pkgver}-linux-amd64.deb")
sha256sums=(
  '2e1ed27232c1166a521741833ee77233a0793c8719b7f2b2b05d2d9895c53422'
  'ea518e5c5eae5f1e2c7d7a4e8dfa62609169d05845b8d9b7d3ae7c4500996f2d'
  'ab395aa009b442d4a30a2c682fe3ce07930abdf814b2fae59a41f20d032c9c55'
  'c2ce2c7e3267701aa192cae428bf9aebb356402c5bb04131c1d89a361d5f1457'
  'dd64d29089377b6718b81eeb2e63c83c8e31d3f817d3893a3439c445b3b8d47f'
  'dacb9f0687f7003444c2587716ae89eb9fb81a4f933934162880289f9a5d2da8'
  '776043375559876bccf9a58b95de8863857338ad4b0b046b878a7d616535f7c9'
  '34b289cc68a6c623b731e38e0ae8bdb46d39a3ae6928cddc44b813e63e3e8649'
  'cea3db969116b4d584c12f7b552d1bf6ca0f20d1242f89265517a1878cfdee0a'
  'fe90e2c0517bd140dd8d6b1d9fca22c93d442dbfdbfd7adfc41eeef2727bb1b4'
  'aa3823fd955206bb4f41fa9f66b091d17bde468c4f452e7157a6889d3a8e3e44'
  'b92b3f6010913466704593e429f2a51d4e64195571652b32d63305f181fb12dd'
)

prepare() {
  local _deb="${srcdir}/KimiCode-${pkgver}-linux-amd64.deb"

  rm -rf "${srcdir}/deb" "${srcdir}/payload" "${srcdir}/asar" \
    "${srcdir}/app.asar"
  mkdir -p "${srcdir}/deb" "${srcdir}/payload"

  bsdtar -xf "${_deb}" -C "${srcdir}/deb"
  for _member in "${srcdir}"/deb/data.tar.*; do
    bsdtar -xf "${_member}" -C "${srcdir}/payload"
  done

  asar extract "${srcdir}/payload/opt/${_appname}/resources/app.asar" \
    "${srcdir}/asar"
  node "${srcdir}/patch-region.js" "${srcdir}/asar" global kimi-code-app-intl
  asar pack "${srcdir}/asar" "${srcdir}/app.asar"

  # 确认补丁确实落到了唯一的区域判定函数上。
  grep -rqF 'function Ei(e){return{region:`global`' "${srcdir}/asar/out"
}

package() {
  install -dm755 "${pkgdir}/opt"
  cp -a "${srcdir}/payload/opt/${_appname}" "${pkgdir}${_prefix}"

  install -Dm644 "${srcdir}/app.asar" "${pkgdir}${_prefix}/resources/app.asar"
  # 上游自动更新会覆盖打过补丁的 asar，这里移除更新源配置。
  rm -f "${pkgdir}${_prefix}/resources/app-update.yml"

  # 上游 postinst 在禁用 user namespace 时依赖 setuid 的 chrome-sandbox。
  chmod 4755 "${pkgdir}${_prefix}/chrome-sandbox"

  install -Dm755 "${srcdir}/kimi-code-intl.sh" "${pkgdir}/usr/bin/kimi-code"
  install -Dm644 "${srcdir}/kimi-code-intl.desktop" \
    "${pkgdir}/usr/share/applications/kimi-code-intl.desktop"
  local _size
  for _size in 16 24 32 48 64 128 256 512; do
    install -Dm644 "${srcdir}/kimi-code-intl-${_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/kimi-code-intl.png"
  done

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${_prefix}/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  ln -s "${_prefix}/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
