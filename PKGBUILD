# Maintainer: AUR package maintainer

pkgname=kimi-bin
pkgver=3.1.7
pkgrel=1
pkgdesc='Kimi desktop client, repackaged for the system Electron runtime'
arch=('x86_64')
url='https://www.kimi.com/'
license=('LicenseRef-proprietary')
depends=('electron41' 'git' 'python' 'uv')
makedepends=('7zip' 'asar')
provides=('kimi')
conflicts=('kimi')
options=('!strip')
source=(
  'LICENSE'
  'daimon'
  'kimi.desktop'
  'kimi.sh'
)
source_x86_64=(
  "kimi_${pkgver}.exe::https://kimi-img.moonshot.cn/app/upgrade/Kimi-Setup-${pkgver}.exe"
  'better-sqlite3-v12.8.0-electron-v145-linux-x64.tar.gz::https://github.com/WiseLibs/better-sqlite3/releases/download/v12.8.0/better-sqlite3-v12.8.0-electron-v145-linux-x64.tar.gz'
)
noextract=("kimi_${pkgver}.exe")
sha256sums=('3d0ecc0dd3c31a9aaa58f4be041e10c9850e85505975642a40be1aea39ed9587'
            'a50cb2d9d215fa61a62daa55ba4f555a3b12330b1f35d70327855d11f1360544'
            '256891c355a265625e641c637d611ad401d3714f0e46b063346caafd802949e7'
            '7d85bbea6f043c28474aaa6a33b5a9acb2c0ca3c5bdc1b74977cce9394579a50')
sha256sums_x86_64=('74e3612ad6201f75ac4767ee16f0f1ec6972b5950cf7b0990e83a8d3a6205ccf'
                   '6a818b219018175261e1c0e9cd8f7de52d89ed9b4d2f97173e1b255b30a1db88')

prepare() {
  rm -rf "${srcdir}/nsis" "${srcdir}/payload" "${srcdir}/app" \
    "${srcdir}/daimon-bundle"
  mkdir -p "${srcdir}/nsis" "${srcdir}/payload" \
    "${srcdir}/daimon-bundle"

  7z x -y "${srcdir}/kimi_${pkgver}.exe" -o"${srcdir}/nsis"
  7z x -y "${srcdir}/nsis/\$PLUGINSDIR/app-64.7z" -o"${srcdir}/payload"
  asar extract "${srcdir}/payload/resources/app.asar" "${srcdir}/app"
  tar -xzf "${srcdir}/payload/resources/resources/daimon-bundle.tar.gz" \
    -C "${srcdir}/daimon-bundle" \
    ./app/daimon \
    ./release \
    ./bundle.json \
    ./.daimon-bundle-stamp

  install -Dm755 "${srcdir}/daimon" \
    "${srcdir}/daimon-bundle/bin/daimon"
  tar -xzf \
    "${srcdir}/better-sqlite3-v12.8.0-electron-v145-linux-x64.tar.gz" \
    -C "${srcdir}/daimon-bundle/app/daimon/node_modules/better-sqlite3"

  local renderer="${srcdir}/app/out/renderer/assets/common-CEwlbJLP.js"
  local main="${srcdir}/app/out/main/index.js"

  # Updates for an AUR package must be handled by pacman, not electron-updater.
  sed -i 's/^  setupAutoUpdater();$/  \/\* Updates are managed by pacman. \*\//' "${main}"

  # Windows executables cannot run under the system Linux Electron runtime.
  find "${srcdir}/app" "${srcdir}/daimon-bundle" \
    -type f -iname '*.exe' -delete
  find "${srcdir}/app" "${srcdir}/daimon-bundle" -type f \( \
    -iname '*.ts' -o \
    -iname '*.mts' -o \
    -iname '*.cts' -o \
    -iname '*.tsx' \
  \) -delete

  # Daimon's bundled package.json lists its build-time devDependencies, none of
  # which are shipped in node_modules; strip the manifold of it declarations.
  sed -i \
    '/^  "devDependencies": {$/,/^  },$/d' \
    "${srcdir}/daimon-bundle/app/daimon/package.json"

  asar pack "${srcdir}/app" "${srcdir}/kimi.asar"
}

package() {
  install -Dm644 "${srcdir}/kimi.asar" \
    "${pkgdir}/usr/lib/kimi/app.asar"
  install -d "${pkgdir}/usr/lib/kimi/daimon-bundle"
  cp -a "${srcdir}/daimon-bundle/." \
    "${pkgdir}/usr/lib/kimi/daimon-bundle/"
  install -Dm755 "${srcdir}/kimi.sh" \
    "${pkgdir}/usr/bin/kimi"
  install -Dm644 "${srcdir}/kimi.desktop" \
    "${pkgdir}/usr/share/applications/kimi.desktop"
  # hicolor only scans directories registered in its index.theme; the largest
  # registered size is 512x512/scalable. Install into the common registered
  # sizes so Plasma finds the icon regardless of display size.
  install -Dm644 "${srcdir}/app/assets/icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/kimi.png"
  install -Dm644 "${srcdir}/app/assets/icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/kimi.png"
  install -Dm644 "${srcdir}/app/assets/icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/kimi.png"
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
