# Maintainer: mensylisir <710080675@qq.com>

# Kimi Work 官方 Windows 客户端的 Linux 重打包，国内版：区域判定被固定为
# china，不随登录账号或区域标记切换。应用资源放在独立 /opt 前缀，
# 通过系统 electron43 运行，与国际版、kimi-work-bin 可并存。

pkgname=kimi-work-cn-bin
pkgver=3.2.26
pkgrel=1
_prefix='/opt/kimi-work-cn'
pkgdesc='Kimi Work desktop client, mainland China build pinned to the China region'
arch=('x86_64')
url='https://www.kimi.com/products/kimi-work'
license=('LicenseRef-proprietary')
depends=(
  'electron43'
  'git'
  'python'
  'uv'
)
makedepends=('7zip' 'asar' 'nodejs')
options=('!strip')

source=(
  'daimon.sh'
  'node.sh'
  'patch-region.js'
  'kimi-work-cn.sh'
  'kimi-work-cn.desktop'
  'LICENSE'
)
source_x86_64=("kimi_${pkgver}.exe::https://kimi-img.moonshot.cn/app/download/windows/kimi_${pkgver}.exe")
noextract=("kimi_${pkgver}.exe")
sha256sums=(
  '85e9c4268a8ee267755f0f3faa4b7cd957db27d57d0c22d53cb2c691d34f0ec2'
  '817e0d47bca30dfb87aa2e9df40fb94ba1d3704305d2b6b0f2b4359e4ab7e304'
  '2c7d8e52e5f4793d8e456ea31c9b151dbd0ff40ce124d6253804cbdc538257e9'
  '51c1c2a95bc83082315531565fdb240af49967614c6eb098e339ae8594782e6f'
  '45c7624addd5a291ee020b20f7f890608c9291306a9d65905371583636648e41'
  'ab973d8d007cfed09bf051378baf4fd220f545a5533ab5e9269aad8674e7f468'
)
sha256sums_x86_64=('cdaf24b59918379cd7e3f539f0434fbafbf92b0497968a0baf2a22dcb7f03e39')

prepare() {
  local _res="${srcdir}/payload/resources/resources"
  local _daimon="${_res}/daimon-bundle"

  rm -rf "${srcdir}/nsis" "${srcdir}/payload" "${srcdir}/app" \
    "${srcdir}/app.asar"
  mkdir -p "${srcdir}/nsis" "${srcdir}/payload"

  7z x -y "${srcdir}/kimi_${pkgver}.exe" -o"${srcdir}/nsis"
  7z x -y "${srcdir}/nsis/\$PLUGINSDIR/app-64.7z" -o"${srcdir}/payload"
  asar extract "${srcdir}/payload/resources/app.asar" "${srcdir}/app"
  install -dm755 "${_daimon}"
  tar -xzf "${_res}/daimon-bundle.tar.gz" -C "${_daimon}"

  # Windows 可执行文件和 win32 工具链无法在 Linux 运行；依赖系统 git/python/uv。
  find "${srcdir}/app" "${_daimon}" -type f -iname '*.exe' -delete
  find "${_res}" -maxdepth 1 -type f -iname '*.exe' -delete
  rm -f "${_res}/daimon-bundle.tar.gz" "${_res}/daimon-bundle.tar.gz.stamp"
  find "${_res}/runtime" -maxdepth 1 -type f -iname '*.cmd' -delete
  find "${_daimon}/runtime" -type f \( \
    -iname '*.dll' -o \
    -iname '*.cmd' -o \
    -iname '*.ps1' -o \
    -iname '*.bat' \
  \) -delete
  find "${_daimon}/runtime" -type d -empty -delete

  # TypeScript 源码不是运行时资源。
  find "${srcdir}/app" "${_daimon}" -type f \( \
    -iname '*.ts' -o \
    -iname '*.mts' -o \
    -iname '*.cts' -o \
    -iname '*.tsx' \
  \) -delete

  # daimon 的 package.json 列出了构建期 devDependencies；删除后必须确认已移除，
  # 上游改格式时让构建失败而不是静默打包进无用依赖。
  sed -i \
    '/^  "devDependencies": {$/,/^  },$/d' \
    "${_daimon}/app/daimon/package.json"
  if grep -q '"devDependencies"' "${_daimon}/app/daimon/package.json"; then
    echo "error: devDependencies still present in daimon package.json" >&2
    return 1
  fi

  # 上游 kimi-daimon 会在运行时下载 Node v24.15.0，且 payload 里没有 Linux 版
  # bin/daimon；这里换成离线包装脚本。
  install -Dm755 "${srcdir}/daimon.sh" "${_daimon}/bin/daimon"
  install -Dm755 "${srcdir}/node.sh" "${_daimon}/runtime/node"

  node "${srcdir}/patch-region.js" "${srcdir}/app" china kimi-desktop-cn
  grep -qF 'return "china";' "${srcdir}/app/out/main/index.js"
  grep -qF 'const _0x1bf09b = "kimi-work-cn.desktop";' \
    "${srcdir}/app/out/main/index.js"

  asar pack "${srcdir}/app" "${srcdir}/app.asar"
}

package() {
  install -Dm644 "${srcdir}/app.asar" "${pkgdir}${_prefix}/app.asar"

  install -dm755 "${pkgdir}${_prefix}/resources"
  cp -a "${srcdir}/payload/resources/resources/." \
    "${pkgdir}${_prefix}/resources/"
  find "${pkgdir}${_prefix}/resources" -type d -exec chmod 755 '{}' +

  install -Dm755 "${srcdir}/kimi-work-cn.sh" "${pkgdir}/usr/bin/kimi-work-cn"
  install -Dm644 "${srcdir}/kimi-work-cn.desktop" \
    "${pkgdir}/usr/share/applications/kimi-work-cn.desktop"
  install -Dm644 "${srcdir}/app/assets/tray-icon@2x.png" \
    "${pkgdir}/usr/share/icons/hicolor/64x64/apps/kimi-work-cn.png"
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
