# Maintainer: Parsiad Azimzadeh <parsiad.azimzadeh at gmail dot com>
# Releases: https://persistent.oaistatic.com/codex-app-prod/appcast.xml

pkgname=openai-codex-desktop
pkgver=26.429.61741
pkgrel=2
pkgdesc="OpenAI Codex desktop app"
arch=('x86_64')
url="https://developers.openai.com/codex/app/"
license=('custom')

depends=(
  'electron39'
  'openai-codex'
  'python'
  'hicolor-icon-theme'
  'xdg-utils'
)

makedepends=(
  'libicns'
  'libarchive'
  'nodejs'
  'npm'
)

_electron_major=39
_better_sqlite3_ver=12.8.0
_node_pty_ver=1.1.0

source=(
  "Codex.zip::https://persistent.oaistatic.com/codex-app-prod/Codex-darwin-arm64-${pkgver}.zip"
  "better-sqlite3.tgz::https://registry.npmjs.org/better-sqlite3/-/better-sqlite3-${_better_sqlite3_ver}.tgz"
  "node-pty.tgz::https://registry.npmjs.org/node-pty/-/node-pty-${_node_pty_ver}.tgz"
  "codex-desktop.sh"
  "Codex.desktop"
)

noextract=(
  'Codex.zip'
  'better-sqlite3.tgz'
  'node-pty.tgz'
)

sha256sums=(
  'c325741ec38a801889518d62ad756db7d6df1035d755db90a046373c96fb5198'
  '2602a5726d0a9d8e6be407c59bc125e605110eda8e3b04e7ef8d6ddf762c9122'
  'c7517f19083ddcb05f276904680eb2b11a6b5ecab778b8e4e5685a6d645b3f60'
  '0ad6ffebf054f3289c7ed902e3b486e8dbe215dbd28e941c948e1e485963f1e2'
  'd3a00f4a4ddf2709d4f018222866df67d155ca36c9dbfa0dd1867d4c9267808d'
)

prepare() {
  cd "${srcdir}"
  rm -rf dmg app-extracted app.asar app.asar.unpacked native-build
  mkdir dmg

  bsdtar -xf "Codex.zip" -C "${srcdir}/dmg"

  local appdir
  appdir="$(find dmg -maxdepth 4 -type d -name '*.app' ! -path '*/__MACOSX/*' | head -n1)"
  [[ -n "${appdir}" ]] || {
    echo "Could not find .app bundle in Codex archive"
    return 1
  }

  local icon_icns
  icon_icns="$(find "${appdir}/Contents/Resources" -maxdepth 1 -type f -name '*.icns' ! -name '._*' -print -quit)"
  [[ -n "${icon_icns}" ]] || {
    echo "Could not find application icon in ${appdir}"
    return 1
  }
  mkdir -p icon
  icns2png -x -o icon "${icon_icns}"

  npx --yes asar extract \
    "${appdir}/Contents/Resources/app.asar" \
    app-extracted

  [[ -d "${appdir}/Contents/Resources/app.asar.unpacked" ]] &&
    cp -a "${appdir}/Contents/Resources/app.asar.unpacked" .

  rm -rf app-extracted/node_modules/sparkle-darwin
  find app-extracted -type f \( -name '*.dylib' -o -name 'sparkle.node' \) -delete

  local bs3_ver npty_ver
  bs3_ver="$(node -p "require('${srcdir}/app-extracted/node_modules/better-sqlite3/package.json').version")"
  npty_ver="$(node -p "require('${srcdir}/app-extracted/node_modules/node-pty/package.json').version")"

  [[ "${bs3_ver}" == "${_better_sqlite3_ver}" ]] || {
    echo "better-sqlite3 version mismatch: app=${bs3_ver}, pkgbuild=${_better_sqlite3_ver}"
    return 1
  }

  [[ "${npty_ver}" == "${_node_pty_ver}" ]] || {
    echo "node-pty version mismatch: app=${npty_ver}, pkgbuild=${_node_pty_ver}"
    return 1
  }

  mkdir native-build
  cd native-build

  cat >package.json <<'EOF'
{
  "name": "codex-desktop-native-rebuild",
  "private": true,
  "license": "UNLICENSED"
}
EOF

  npm install \
    --ignore-scripts \
    --no-audit \
    --no-fund \
    "${srcdir}/better-sqlite3.tgz" \
    "${srcdir}/node-pty.tgz"

  export npm_config_runtime=electron
  export npm_config_target="${_electron_major}.0.0"
  export npm_config_disturl="https://electronjs.org/headers"
  export npm_config_build_from_source=true

  npx --yes @electron/rebuild -v "${_electron_major}.0.0" --force

  rm -rf "${srcdir}/app-extracted/node_modules/better-sqlite3"
  rm -rf "${srcdir}/app-extracted/node_modules/node-pty"
  cp -a node_modules/better-sqlite3 "${srcdir}/app-extracted/node_modules/"
  cp -a node_modules/node-pty "${srcdir}/app-extracted/node_modules/"

  cd "${srcdir}"
  npx --yes asar pack app-extracted app.asar --unpack "{*.node,*.so}"
}

package() {
  cd "${srcdir}"

  install -Dm644 app.asar \
    "${pkgdir}/usr/lib/${pkgname}/resources/app.asar"

  if [[ -d app.asar.unpacked ]]; then
    cp -a app.asar.unpacked \
      "${pkgdir}/usr/lib/${pkgname}/resources/"
  fi

  if [[ -d app-extracted/webview ]]; then
    mkdir -p "${pkgdir}/usr/lib/${pkgname}/content"
    cp -a app-extracted/webview \
      "${pkgdir}/usr/lib/${pkgname}/content/"
  fi

  install -Dm755 codex-desktop.sh \
    "${pkgdir}/usr/bin/codex-desktop"

  local icon_png
  icon_png="$(find icon -maxdepth 1 -type f -name '*512x512*.png' -print -quit)"
  [[ -n "${icon_png}" ]] ||
    icon_png="$(find icon -maxdepth 1 -type f -name '*.png' -print | sort -V | tail -n1)"
  [[ -n "${icon_png}" ]] || {
    echo "Could not find an application icon to package"
    return 1
  }

  install -Dm644 "${icon_png}" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/openai-codex-desktop.png"

  install -Dm644 Codex.desktop \
    "${pkgdir}/usr/share/applications/Codex.desktop"
}
