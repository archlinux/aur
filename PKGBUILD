# Maintainer: AUR package maintainer

pkgname=kimi-bin
pkgver=3.0.18
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
sha256sums_x86_64=('82deb1db0a21b540af236632c04aad50d71f982b3b768d6c0418fb0d271e0128'
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

  # Remove direct development-only packages.  The desktop manifest incorrectly
  # places its build tooling in dependencies; none of these are referenced by
  # the compiled main/renderer output.  Daimon's actual devDependencies are
  # listed explicitly as well, even though the upstream production bundle
  # currently omits most of them.
  rm -rf \
    "${srcdir}/app/node_modules/@sentry/vite-plugin" \
    "${srcdir}/app/node_modules/@types/js-yaml" \
    "${srcdir}/app/node_modules/ts-expect" \
    "${srcdir}/app/node_modules/tsx" \
    "${srcdir}/app/node_modules/@sentry/babel-plugin-component-annotate" \
    "${srcdir}/app/node_modules/@sentry/bundler-plugin-core" \
    "${srcdir}/app/node_modules/@sentry/cli" \
    "${srcdir}/app/node_modules/@sentry/rollup-plugin" \
    "${srcdir}/app/node_modules/@rollup" \
    "${srcdir}/app/node_modules/@esbuild" \
    "${srcdir}/app/node_modules/esbuild" \
    "${srcdir}/app/node_modules/get-tsconfig" \
    "${srcdir}/app/node_modules/resolve-pkg-maps" \
    "${srcdir}/app/node_modules/rollup" \
    "${srcdir}/daimon-bundle/app/daimon/node_modules/@types/better-sqlite3" \
    "${srcdir}/daimon-bundle/app/daimon/node_modules/@types/node" \
    "${srcdir}/daimon-bundle/app/daimon/node_modules/@types/proper-lockfile" \
    "${srcdir}/daimon-bundle/app/daimon/node_modules/@types/react" \
    "${srcdir}/daimon-bundle/app/daimon/node_modules/javascript-obfuscator" \
    "${srcdir}/daimon-bundle/app/daimon/node_modules/terser"
  find "${srcdir}/app/node_modules/@babel" \
    -mindepth 1 -maxdepth 1 -type d ! -name runtime \
    -exec rm -rf {} +
  sed -i \
    -e '/    "@sentry\/vite-plugin":/d' \
    -e '/    "@types\/js-yaml":/d' \
    -e '/    "ts-expect":/d' \
    -e '/    "tsx":/d' \
    "${srcdir}/app/package.json"
  sed -i \
    '/^  "devDependencies": {$/,/^  },$/d' \
    "${srcdir}/daimon-bundle/app/daimon/package.json"

  # These two ZipApps contain identical files; only their ZIP timestamps differ.
  # Store one inode while keeping both paths expected by the two PPTX skills.
  local pptx_pyz="${srcdir}/daimon-bundle/app/daimon/assets/builtin-skills/pptx/scripts/kimi_ppt_dsl.pyz"
  local swarm_pyz="${srcdir}/daimon-bundle/app/daimon/assets/builtin-skills/pptx-swarm/scripts/kimi_ppt_dsl.pyz"
  rm -f "${swarm_pyz}"
  ln "${pptx_pyz}" "${swarm_pyz}"

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
  install -Dm644 "${srcdir}/app/assets/icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/kimi.png"
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
