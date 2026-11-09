# Maintainer: mensylisir <710080675@qq.com>

# Kimi Work 官方 Windows 客户端的 Linux 重打包，国际版：区域判定被固定为
# overseas，不随登录账号或区域标记切换。应用资源放在独立 /opt 前缀，
# 通过系统 electron43 运行，与国内版、kimi-work-bin 可并存。

pkgname=kimi-work-intl-bin
pkgver=3.2.26
pkgrel=2
_prefix='/opt/kimi-work-intl'
pkgdesc='Kimi Work desktop client, international build pinned to the overseas region'
arch=('x86_64')
url='https://www.kimi.ai/products/kimi-work'
license=('LicenseRef-proprietary')
depends=(
  'electron43'
  'git'
  'python'
  'uv'
)
makedepends=('7zip' 'asar' 'nodejs')
conflicts=('kimi-work-bin' 'kimi-bin')
options=('!strip')

source=(
  'daimon.sh'
  'node.sh'
  'patch-region.js'
  'kimi-work-intl.sh'
  'kimi-work-intl.desktop'
  'LICENSE'
  'kimi-work-intl-16.png'
  'kimi-work-intl-24.png'
  'kimi-work-intl-32.png'
  'kimi-work-intl-48.png'
  'kimi-work-intl-64.png'
  'kimi-work-intl-128.png'
  'kimi-work-intl-256.png'
  'kimi-work-intl-512.png'
)
source_x86_64=("kimi_${pkgver}.exe::https://kimi-img.moonshot.cn/app/download/windows/kimi_${pkgver}.exe")
noextract=("kimi_${pkgver}.exe")
sha256sums=(
  '85e9c4268a8ee267755f0f3faa4b7cd957db27d57d0c22d53cb2c691d34f0ec2'
  '817e0d47bca30dfb87aa2e9df40fb94ba1d3704305d2b6b0f2b4359e4ab7e304'
  '2c7d8e52e5f4793d8e456ea31c9b151dbd0ff40ce124d6253804cbdc538257e9'
  'dc2c12c5fff0b616dd983b6fb07f426dcefa1167e0d05bbc807fc7346da0ef9b'
  '3f7d7bbc4b0f443344755ac0dee7d5752e3c51018134467f8748b0862b86f41a'
  'ab973d8d007cfed09bf051378baf4fd220f545a5533ab5e9269aad8674e7f468'
  '0b3fd635d39ca19cf65ee9f0f0da0e849e247181e67dcefa06fbf52d4f11d91d'
  '776895c61c5c4104bc79b8326ad815e8432087227f6aed26d717557a6f9fde27'
  '82802d706349c1a490a1335fe782e4eb1c0002f5296c2444c789d573f01abd51'
  'f1e5cc4aa55029472928fabc5cbdc5898cb6fe954d463e3ac106ca05542b763f'
  '2ab7cbc702197c1e1c0a001df756a278b34b7e9aa43578c1c17c8e93489ce3d5'
  'e6a18593bf98f987efb31f1cff26e0b4b6b20496706e7738a2a1cbf1342b7611'
  '6eb3d22d134011b4abd6a1bca09ba4e1147a972873f457db3b8d96a262774e0e'
  '00e33811cde3a6c40c14ff8ab9d7a2ed94492608bd93ca5a026ed1c24735c300'
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

  node "${srcdir}/patch-region.js" "${srcdir}/app" overseas kimi-desktop-intl
  grep -qF 'return "overseas";' "${srcdir}/app/out/main/index.js"
  grep -qF 'const _0x1bf09b = "kimi-work-intl.desktop";' \
    "${srcdir}/app/out/main/index.js"

  asar pack "${srcdir}/app" "${srcdir}/app.asar"
}

package() {
  install -Dm644 "${srcdir}/app.asar" "${pkgdir}${_prefix}/app.asar"

  install -dm755 "${pkgdir}${_prefix}/resources"
  cp -a "${srcdir}/payload/resources/resources/." \
    "${pkgdir}${_prefix}/resources/"
  find "${pkgdir}${_prefix}/resources" -type d -exec chmod 755 '{}' +

  install -Dm755 "${srcdir}/kimi-work-intl.sh" "${pkgdir}/usr/bin/kimi-work"
  install -Dm644 "${srcdir}/kimi-work-intl.desktop" \
    "${pkgdir}/usr/share/applications/kimi-work-intl.desktop"
  local _size
  for _size in 16 24 32 48 64 128 256 512; do
    install -Dm644 "${srcdir}/kimi-work-intl-${_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/kimi-work-intl.png"
  done
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
