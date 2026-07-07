# Maintainer: Parsiad Azimzadeh <parsiad.azimzadeh at gmail dot com>
# Maintainer: mothran
# Releases: https://persistent.oaistatic.com/codex-app-prod/appcast.xml

pkgname=openai-codex-desktop
pkgver=26.623.141536
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
_better_sqlite3_ver=12.9.0
_node_pty_ver=1.1.0

source=(
  "Codex-${pkgver}.zip::https://persistent.oaistatic.com/codex-app-prod/Codex-darwin-arm64-${pkgver}.zip"
  "better-sqlite3.tgz::https://registry.npmjs.org/better-sqlite3/-/better-sqlite3-${_better_sqlite3_ver}.tgz"
  "node-pty.tgz::https://registry.npmjs.org/node-pty/-/node-pty-${_node_pty_ver}.tgz"
  "codex-desktop.sh"
  "Codex.desktop"
  "patch-linux-open-targets.mjs"
)

noextract=(
  "Codex-${pkgver}.zip"
  'better-sqlite3.tgz'
  'node-pty.tgz'
)

sha256sums=('d948dc36b8358f5a2924b033fbf08398eea7860dc9e97cb5ab9b354490283a0a'
            'ad0e29650140c49d0335b1d356596aa8166f12b758f418a98446130e3278f250'
            'c7517f19083ddcb05f276904680eb2b11a6b5ecab778b8e4e5685a6d645b3f60'
            '2e075990f5419d66dd98c83e4ec938d5497d1a4ad2e8c766bf3664c35edadf51'
            'd3a00f4a4ddf2709d4f018222866df67d155ca36c9dbfa0dd1867d4c9267808d'
            '7f01504bc4db700a7eacc6dd763674bde4f50ea7145233595a5c6f8f39e8ab41')

prepare() {
  cd "${srcdir}"
  rm -rf dmg app-extracted app.asar app.asar.unpacked native-build
  mkdir dmg

  bsdtar -xf "Codex-${pkgver}.zip" -C "${srcdir}/dmg"

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

  node "${srcdir}/patch-linux-open-targets.mjs" app-extracted

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
  find app-extracted/node_modules/better-sqlite3 app-extracted/node_modules/node-pty \
    -type f \( -name Makefile -o -name '*.mk' -o -name config.gypi \) -delete
  find app-extracted/node_modules/better-sqlite3 app-extracted/node_modules/node-pty \
    -type d -name .deps -prune -exec rm -rf '{}' +

  local prebuild_root
  for prebuild_root in app-extracted app.asar.unpacked; do
    [[ -d "${prebuild_root}" ]] || continue
    find "${prebuild_root}" -path '*/prebuilds/*' -type f -name '*.node' \
      ! \( -path '*/linux-x64/*' -o -path '*/HID-linux-x64/*' -o -path '*/HID_hidraw-linux-x64/*' \) \
      -delete
    find "${prebuild_root}" -path '*/prebuilds/*' -type f -name '*musl*.node' -delete
  done

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
