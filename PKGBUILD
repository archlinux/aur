# Maintainer: mensylisir <710080675@qq.com>

# 国内版官方 deb，区域判定被改成固定 mainland-cn：不使用登录态或区域标记切换 API。
# 应用整体安装在独立 /opt 前缀，命令名 kimi-code-cn，与国际版可并存。

pkgname=kimi-code-cn-bin
pkgver=1.3.2
pkgrel=1
_appname='Kimi Code'
_prefix='/opt/kimi-code-cn'
pkgdesc='Kimi Code Desktop, mainland China build pinned to the China API'
arch=('x86_64')
url='https://code.kimi.com/'
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
options=('!strip' '!debug')

source=(
  "KimiCode-${pkgver}-linux-amd64.deb::https://code.kimi.com/kimi-code/desktop/binaries/${pkgver}/KimiCode-${pkgver}-linux-amd64.deb"
  'patch-region.js'
  'kimi-code-cn.sh'
  'kimi-code-cn.desktop'
)
noextract=("KimiCode-${pkgver}-linux-amd64.deb")
sha256sums=(
  '2e1ed27232c1166a521741833ee77233a0793c8719b7f2b2b05d2d9895c53422'
  'ea518e5c5eae5f1e2c7d7a4e8dfa62609169d05845b8d9b7d3ae7c4500996f2d'
  '37c495e6f19acba4847361aff61dd9cdb4540adca2de51b315181a53967cb509'
  '85d85fd09213f93b5f05b36b366fa0198015ac37b6050b4e2779c4e33fbfd8c3'
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
  node "${srcdir}/patch-region.js" "${srcdir}/asar" mainland-cn kimi-code-app-cn
  asar pack "${srcdir}/asar" "${srcdir}/app.asar"

  # 确认补丁确实落到了唯一的区域判定函数上。
  grep -rqF 'function Ei(e){return{region:`mainland-cn`' "${srcdir}/asar/out"
  # 国内版使用自己的自定义协议，避免与国际版抢 kimi-code:// 的默认处理程序。
  grep -rqF 'const gn=`kimi-code-cn`' "${srcdir}/asar/out"
}

package() {
  install -dm755 "${pkgdir}/opt"
  cp -a "${srcdir}/payload/opt/${_appname}" "${pkgdir}${_prefix}"

  # 可执行文件改名，让 Electron 以 kimi-code-cn 作为 WM_CLASS，
  # 与国际版的 kimi-code 区分开，任务栏不会合并两版窗口。
  mv "${pkgdir}${_prefix}/kimi-code" "${pkgdir}${_prefix}/kimi-code-cn"

  install -Dm644 "${srcdir}/app.asar" "${pkgdir}${_prefix}/resources/app.asar"
  # 上游自动更新会覆盖打过补丁的 asar，这里移除更新源配置。
  rm -f "${pkgdir}${_prefix}/resources/app-update.yml"

  # 上游 postinst 在禁用 user namespace 时依赖 setuid 的 chrome-sandbox。
  chmod 4755 "${pkgdir}${_prefix}/chrome-sandbox"

  install -Dm755 "${srcdir}/kimi-code-cn.sh" "${pkgdir}/usr/bin/kimi-code-cn"
  install -Dm644 "${srcdir}/kimi-code-cn.desktop" \
    "${pkgdir}/usr/share/applications/kimi-code-cn.desktop"
  install -Dm644 \
    "${srcdir}/payload/usr/share/icons/hicolor/512x512/apps/kimi-code.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/kimi-code-cn.png"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${_prefix}/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  ln -s "${_prefix}/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
