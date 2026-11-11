# Maintainer: duanluan <duanluan@outlook.com>

pkgname=coze
pkgver=1.1.49
pkgrel=1
pkgdesc='Coze desktop app repackaged from the official macOS release'
arch=('x86_64')
url='https://www.coze.cn'
license=('LicenseRef-Proprietary')
# Upstream publishes Windows and macOS desktop builds only (verified against
# its update service, which has no linux target). This repacks the official
# macOS dmg: the app is a plain Electron bundle whose JS and native modules
# (koffi, tree-sitter) ship linux-x64 prebuilds, so it runs on the distro
# electron after prepare-app.mjs patches the few mac-only bits.
depends=(
  'electron39'
  'hicolor-icon-theme'
  'xdg-utils'
)
makedepends=(
  '7zip'
  'nodejs'
)
conflicts=('coze-bin')
options=('!strip' '!lto')
# buildId is a per-release CDN path segment maintained by upstream's update
# service; update.sh rewrites it together with pkgver.
_buildid=554528883
source=(
  "coze-${pkgver}-mac-x64.dmg::https://lf3-cdn-tos.bytegoofy.com/obj/tron-demo/7617773946401724698/${_buildid}/${pkgver}/darwin-x64/扣子-v${pkgver}-darwin-x64.dmg"
  'coze.sh'
  'coze.desktop'
  'prepare-app.mjs'
)
sha256sums=(
  '67d14336cca540a8edd764ccf7dc4dd13322710470fedbe1350a6d1ca27b19cf'
  'SKIP'
  'SKIP'
  'SKIP'
)

prepare() {
  cd "${srcdir}"
  rm -rf dmg resources coze-icon-*.png
  mkdir dmg resources

  7z x -bd -y "coze-${pkgver}-mac-x64.dmg" -odmg >/dev/null

  local appdir
  appdir="$(find dmg -maxdepth 4 -type d -name '*.app' ! -path '*/__MACOSX/*' -print -quit)"
  [[ -n "${appdir}" ]] || {
    echo "Could not find the app bundle in upstream dmg"
    return 1
  }
  local resdir="${appdir}/Contents/Resources"

  # app.asar -> resources/app（提取 + Linux 运行修补）+ icns -> PNG 图标
  node "${srcdir}/prepare-app.mjs" \
    "${resdir}/app.asar" resources/app \
    "${resdir}/icon.icns" "${srcdir}/coze-icon"

  # 上游入口在打包布局下要读 resources/manifest.json（mac 版放在框架目录里）
  install -Dm644 \
    "${appdir}/Contents/Frameworks/Electron Framework.framework/Versions/A/Resources/manifest.json" \
    resources/manifest.json

  # coze-daemon / coze-drive 是 Mach-O mac 二进制，Linux 上不打包；
  # 应用运行时会按平台自行安装对应的小助手。
  rm -rf "${resdir}/coze-daemon" "${resdir}/coze-drive"
}

package() {
  cd "${srcdir}"

  install -dm755 \
    "${pkgdir}/usr/bin" \
    "${pkgdir}/usr/lib/${pkgname}/resources" \
    "${pkgdir}/usr/share/applications" \
    "${pkgdir}/usr/share/doc/${pkgname}" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps" \
    "${pkgdir}/usr/share/pixmaps"

  install -Dm755 "${srcdir}/coze.sh" "${pkgdir}/usr/bin/coze"

  cp -a resources/. "${pkgdir}/usr/lib/${pkgname}/resources/"

  install -Dm644 resources/app/package.json \
    "${pkgdir}/usr/share/doc/${pkgname}/package.json"
  install -Dm644 "${srcdir}/coze.desktop" \
    "${pkgdir}/usr/share/applications/coze.desktop"

  install -Dm644 "${srcdir}/coze-icon-512.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
  install -Dm644 "${srcdir}/coze-icon-256.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  install -Dm644 "${srcdir}/coze-icon-512.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
