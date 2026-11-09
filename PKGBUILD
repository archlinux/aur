# Maintainer: mensylisir <710080675@qq.com>

# 国内版官方 deb，区域判定被改成固定 mainland-cn：不使用登录态或区域标记切换 API。
# 应用整体安装在独立 /opt 前缀，命令名 kimi-code-cn，与国际版可并存。

pkgname=kimi-code-cn-bin
pkgver=1.3.2
pkgrel=2
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
  'kimi-code-cn-16.png'
  'kimi-code-cn-24.png'
  'kimi-code-cn-32.png'
  'kimi-code-cn-48.png'
  'kimi-code-cn-64.png'
  'kimi-code-cn-128.png'
  'kimi-code-cn-256.png'
  'kimi-code-cn-512.png'
)
noextract=("KimiCode-${pkgver}-linux-amd64.deb")
sha256sums=(
  '2e1ed27232c1166a521741833ee77233a0793c8719b7f2b2b05d2d9895c53422'
  'ea518e5c5eae5f1e2c7d7a4e8dfa62609169d05845b8d9b7d3ae7c4500996f2d'
  '37c495e6f19acba4847361aff61dd9cdb4540adca2de51b315181a53967cb509'
  '85d85fd09213f93b5f05b36b366fa0198015ac37b6050b4e2779c4e33fbfd8c3'
  '2c26abb1ca0208f866db6975a894570d55bd94cb08fb2f1feb183a9d98443ba8'
  '884ac98a6e69847d68cc4ea3fb92d203ceccd1b4dd652c17fb74d0a824648f54'
  '148c2ac9b3985f4d8f8c7167998d543d861aa7e54533d52aace9f8e8086b951d'
  'd8eec165a90bc1f58c3ace00713ab1609af22c5ba91b12367fc58068405c1e6b'
  '057eb3aea6fa95f87501b29109d5bef3ca650251f677fccd67b2e414aaf419b7'
  'eec3d1f9ca77cfbbbf06d65213649e815aba4a2c4bce91d605af8a9a34d4fc1c'
  'd3e41fdbab2249a67ae8a8febaed83bfe37c22440246ccc54b6c193713bb9790'
  '719e62a25e3ce9644f727629f1e7d5c4f6f94a41046f7dc4bd749b5164129bd5'
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
  local _size
  for _size in 16 24 32 48 64 128 256 512; do
    install -Dm644 "${srcdir}/kimi-code-cn-${_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/kimi-code-cn.png"
  done

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${_prefix}/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  ln -s "${_prefix}/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
