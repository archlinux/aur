# Maintainer: duanluan <duanluan@outlook.com>

pkgname=minimax-hub-bin
_pkgname=minimax-hub
pkgver=2.0.15
pkgrel=6
pkgdesc='MiniMax Hub desktop app repackaged from the official macOS release'
arch=('x86_64' 'aarch64')
url='https://hub.minimaxi.com/'
license=('custom:proprietary')
depends=(
  'electron39'
  'ffmpeg'
  'hicolor-icon-theme'
  'nodejs'
  'xdg-utils'
)
optdepends=(
  'opencode: OpenCode runtime from the Arch repositories'
  'npm: install opencode-ai globally as an alternative OpenCode runtime'
)
makedepends=(
  '7zip'
  'asar'
  'nodejs'
  'npm'
  'python'
)
provides=('minimax-hub')
conflicts=('minimax-hub')
options=('!strip' '!lto')
install='minimax-hub-bin.install'
source=(
  'minimax-hub.sh'
  'minimax-hub.desktop'
  'patch-linux-runtime.mjs'
  'minimax-hub-bin.install'
  'LICENSE'
)
source_x86_64=(
  "MiniMax-Hub-${pkgver}-mac-x64.zip::https://filecdn.minimax.chat/public/minimax-hub/release/domestic/builds/2.0.15/hilo-desktop-870/MiniMax%20Design-2.0.15-mac.zip"
)
source_aarch64=(
  "MiniMax-Hub-${pkgver}-mac-arm64.zip::https://filecdn.minimax.chat/public/minimax-hub/release/domestic/builds/2.0.15/hilo-desktop-870/MiniMax%20Design-2.0.15-arm64-mac.zip"
)
noextract=(
  "MiniMax-Hub-${pkgver}-mac-x64.zip"
  "MiniMax-Hub-${pkgver}-mac-arm64.zip"
)
sha256sums=('4e8ac22b373c6290dbd80576df9d9bec4203d1aafc4fbbbdb33e556966de5e04'
            '4c9da9d8bab463dbd04b4320c1a2f2b4dfc885e2e4a1a53955fb328e1a271329'
            '9d78784df2f0854fdf08d436c22501adff17068de77ae584254045e51c041490'
            '20bcf5b029a2b88bd1027207f287e44d87586d2dac6e82ac66174141f9fb928b'
            'a95f4a1bb7d5ba464ca8503549fa98a6d6bdfc667af0a9265f6b01416f85de96')
sha256sums_x86_64=('c3b2487920da71ee6e5242077d0fa79012f990f69a9325f57d1e285bac153a11')
sha256sums_aarch64=('64e4cdaa0f094ffb59cb913ff4af026874df3fb9d78ce9015a91882d9fe26538')

_electron_major=39

prepare() {
  cd "${srcdir}"
  rm -rf upstream-app app-extracted app.asar resources native-build
  mkdir upstream-app resources

  local archive_file appdir
  case "${CARCH}" in
    x86_64)
      archive_file="MiniMax-Hub-${pkgver}-mac-x64.zip"
      ;;
    aarch64)
      archive_file="MiniMax-Hub-${pkgver}-mac-arm64.zip"
      ;;
    *)
      echo "Unsupported architecture: ${CARCH}" >&2
      return 1
      ;;
  esac

  7z x -bd -y "${archive_file}" -oupstream-app >/dev/null

  appdir="$(find upstream-app -path '*/MiniMax Hub.app' -type d -print -quit)"

  [[ -n "${appdir}" && -d "${appdir}" ]] || {
    echo "Could not find MiniMax Hub.app in upstream archive" >&2
    return 1
  }

  local upstream_resources="${appdir}/Contents/Resources"

  asar extract "${upstream_resources}/app.asar" app-extracted
  node "${srcdir}/patch-linux-runtime.mjs" app-extracted
  asar pack app-extracted app.asar

  cp -a \
    "${upstream_resources}/app-resources" \
    "${upstream_resources}/conf" \
    "${upstream_resources}/gateway" \
    "${upstream_resources}/mcp-tools" \
    "${upstream_resources}/opencode" \
    "${upstream_resources}/opencode-plugin-hilo" \
    "${upstream_resources}/opencode-plugin-trace" \
    resources/

  install -Dm644 "${upstream_resources}/app-update.yml" \
    resources/app-update.yml

  rm -rf resources/ffmpeg
  install -dm755 resources/ffmpeg
  ln -s /usr/bin/ffmpeg resources/ffmpeg/ffmpeg
  ln -s /usr/bin/ffprobe resources/ffmpeg/ffprobe

  rm -f resources/opencode/opencode
  ln -s /usr/bin/opencode resources/opencode/opencode

  find resources \
    \( -name '.DS_Store' -o -name '._*' -o -name '*:com.apple.*' \) \
    -delete

  cd "${srcdir}/resources/gateway"
  npm install \
    --ignore-scripts \
    --no-audit \
    --no-fund \
    --omit=dev \
    "better-sqlite3@12.9.0" \
    "@node-rs/xxhash@1.7.6" \
    "sharp@0.34.5" \
    "undici@8.5.0" \
    "ws@8.21.0"

  export npm_config_runtime=electron
  export npm_config_target="${_electron_major}.0.0"
  export npm_config_disturl='https://electronjs.org/headers'
  export npm_config_build_from_source=true

  npx --yes @electron/rebuild -v "${_electron_major}.0.0" --force \
    -m "${srcdir}/resources/gateway"

  find "${srcdir}/resources/gateway/node_modules" \
    \( -path '*/.prepack-darwin-*' -o -path '*/bin/darwin-*' -o -path '*/@img/sharp-darwin-*' -o -path '*/@img/sharp-libvips-darwin-*' -o -path '*/@node-rs/xxhash-darwin-*' \) \
    -prune -exec rm -rf '{}' +

  find "${srcdir}/resources/gateway/node_modules" \
    -type f \( -name Makefile -o -name '*.mk' -o -name config.gypi \) \
    -delete
  find "${srcdir}/resources/gateway/node_modules" \
    -type d -name .deps -prune -exec rm -rf '{}' +
}

package() {
  cd "${srcdir}"

  install -dm755 \
    "${pkgdir}/usr/bin" \
    "${pkgdir}/usr/lib/${pkgname}/resources" \
    "${pkgdir}/usr/share/applications" \
    "${pkgdir}/usr/share/doc/${pkgname}" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps" \
    "${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm755 "${srcdir}/minimax-hub.sh" \
    "${pkgdir}/usr/bin/minimax-hub"
  install -Dm644 "${srcdir}/minimax-hub.desktop" \
    "${pkgdir}/usr/share/applications/minimax-hub.desktop"

  install -Dm644 app.asar \
    "${pkgdir}/usr/lib/${pkgname}/resources/app.asar"
  cp -a resources/. \
    "${pkgdir}/usr/lib/${pkgname}/resources/"
  find "${pkgdir}/usr/lib/${pkgname}/resources" -type d -exec chmod 755 '{}' +
  find "${pkgdir}/usr/lib/${pkgname}/resources" -type f -perm /111 -exec chmod 755 '{}' +
  find "${pkgdir}/usr/lib/${pkgname}/resources" -type f ! -perm /111 -exec chmod 644 '{}' +

  install -Dm644 resources/app-resources/icon.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/minimax-hub.png"
  install -Dm644 app-extracted/package.json \
    "${pkgdir}/usr/share/doc/${pkgname}/package.json"
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
