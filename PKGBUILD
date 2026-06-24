# Maintainer: duanluan <duanluan@outlook.com>

pkgname=minimax-hub-bin
_pkgname=minimax-hub
pkgver=1.0.4
pkgrel=1
pkgdesc='MiniMax Hub desktop app repackaged from the official macOS release'
arch=('x86_64' 'aarch64')
url='https://hub.minimaxi.com/'
license=('custom:proprietary')
depends=(
  'electron39'
  'ffmpeg'
  'hicolor-icon-theme'
  'nodejs'
  'opencode'
  'xdg-utils'
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
source=(
  'minimax-hub.sh'
  'minimax-hub.desktop'
  'patch-linux-runtime.mjs'
  'LICENSE'
)
source_x86_64=(
  "MiniMax-Hub-${pkgver}-mac-x64.dmg::https://filecdn.minimax.chat/public/minimax-hub/release/domestic/MiniMax%20Hub-${pkgver}.dmg"
)
source_aarch64=(
  "MiniMax-Hub-${pkgver}-mac-arm64.dmg::https://filecdn.minimax.chat/public/minimax-hub/release/domestic/MiniMax%20Hub-${pkgver}-arm64.dmg"
)
noextract=(
  "MiniMax-Hub-${pkgver}-mac-x64.dmg"
  "MiniMax-Hub-${pkgver}-mac-arm64.dmg"
)
sha256sums=('1c09ead806826e17521f2d79013e9ccdfdf02b2dc2e8554ac40cd0f0e427b286'
            '4c9da9d8bab463dbd04b4320c1a2f2b4dfc885e2e4a1a53955fb328e1a271329'
            '19ca9526d7d292205b06f9a6a91768844e11c70aa8237b23a8cf20b5c64a2a29'
            'a95f4a1bb7d5ba464ca8503549fa98a6d6bdfc667af0a9265f6b01416f85de96')
sha256sums_x86_64=('caa5ff2e1f3d98a3e39adce010b774297e788b4f7649e21166bb572f481066bb')
sha256sums_aarch64=('3981f3e9105911a6af8356fac93ac88cfcbb0b3de917a4b5ca493335e5f6bd8e')

_electron_major=39

prepare() {
  cd "${srcdir}"
  rm -rf dmg app-extracted app.asar resources native-build
  mkdir dmg resources

  local dmg_file appdir
  case "${CARCH}" in
    x86_64)
      dmg_file="MiniMax-Hub-${pkgver}-mac-x64.dmg"
      appdir="dmg/MiniMax Hub ${pkgver}/MiniMax Hub.app"
      ;;
    aarch64)
      dmg_file="MiniMax-Hub-${pkgver}-mac-arm64.dmg"
      appdir="dmg/MiniMax Hub ${pkgver}-arm64/MiniMax Hub.app"
      ;;
    *)
      echo "Unsupported architecture: ${CARCH}" >&2
      return 1
      ;;
  esac

  7z x -bd -y "${dmg_file}" -odmg >/dev/null

  [[ -d "${appdir}" ]] || {
    appdir="$(find dmg -path '*/MiniMax Hub.app' -type d -print -quit)"
  }

  [[ -n "${appdir}" && -d "${appdir}" ]] || {
    echo "Could not find MiniMax Hub.app in upstream dmg" >&2
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

  install -Dm644 resources/app-resources/icon.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/minimax-hub.png"
  install -Dm644 app-extracted/package.json \
    "${pkgdir}/usr/share/doc/${pkgname}/package.json"
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
