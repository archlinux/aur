# Maintainer: Parsiad Azimzadeh <parsiad.azimzadeh at gmail dot com>

pkgname=openai-codex-desktop
pkgver=26.305.950
pkgrel=1
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
  'nodejs'
  'npm'
  'p7zip'
)

_electron_major=39
_better_sqlite3_ver=12.5.0
_node_pty_ver=1.1.0

source=(
  "Codex.dmg::https://persistent.oaistatic.com/codex-app-prod/Codex.dmg"
  "better-sqlite3-${_better_sqlite3_ver}.tgz::https://registry.npmjs.org/better-sqlite3/-/better-sqlite3-${_better_sqlite3_ver}.tgz"
  "node-pty-${_node_pty_ver}.tgz::https://registry.npmjs.org/node-pty/-/node-pty-${_node_pty_ver}.tgz"
  "codex-desktop.sh"
  "codex-desktop.desktop"
)

noextract=(
  'Codex.dmg'
  "better-sqlite3-${_better_sqlite3_ver}.tgz"
  "node-pty-${_node_pty_ver}.tgz"
)

sha256sums=(
  'e2829d864466c146ef9dec5e82ebb07effa8447851dd661b5307b007dae92c37'
  '0a3cd0554b063c3185b9912ef7059b84455a2e411d637faa0166fef9fefa04c2'
  'c7517f19083ddcb05f276904680eb2b11a6b5ecab778b8e4e5685a6d645b3f60'
  '346e0e6720a2b56bdd055618943fa8397ed4f32e5f4cba00b2abe155a2351583'
  '89be393152cc170cbe41fbf53ecd9e6b26e552b8036c637f0b852c7a3ed75b72'
)

prepare() {
  cd "${srcdir}"
  rm -rf dmg app-extracted app.asar app.asar.unpacked native-build
  mkdir dmg

  7z x -y "Codex.dmg" -o"${srcdir}/dmg" >/dev/null

  icon_icns="$(find dmg -path '*/Contents/Resources/*.icns' | head -n1)"
  mkdir -p icon
  icns2png -x -o icon "${icon_icns}"

  local appdir
  appdir="$(find dmg -maxdepth 4 -type d -name '*.app' | head -n1)"
  [[ -n "${appdir}" ]] || {
    echo "Could not find .app bundle in DMG"
    return 1
  }

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
    "${srcdir}/better-sqlite3-${_better_sqlite3_ver}.tgz" \
    "${srcdir}/node-pty-${_node_pty_ver}.tgz"

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

pkgver() {
  cd "${srcdir}"

  local appdir plist ver
  appdir="$(find dmg -maxdepth 4 -type d -name '*.app' | head -n1)"
  plist="${appdir}/Contents/Info.plist"

  ver="$(
    python - "$plist" <<'PY'
import plistlib, sys
with open(sys.argv[1], 'rb') as f:
    p = plistlib.load(f)
print(p.get('CFBundleShortVersionString') or p.get('CFBundleVersion') or '0')
PY
  )"

  printf '%s\n' "${ver//-/.}"
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

  install -Dm644 icon/*512x512*.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/openai-codex-desktop.png"

  install -Dm644 codex-desktop.desktop \
    "${pkgdir}/usr/share/applications/codex-desktop.desktop"
}
