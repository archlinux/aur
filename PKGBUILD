# Maintainer: duanluan <duanluan@outlook.com>

pkgname=zcode-desktop-bin
_pkgname=zcode
pkgver=3.1.2
pkgrel=1
pkgdesc='ZCode desktop app repackaged from the official macOS release'
arch=('x86_64')
url='https://zcode.z.ai/en'
license=('custom')
depends=(
  'electron41'
  'hicolor-icon-theme'
  'ripgrep'
  'xdg-utils'
)
makedepends=(
  '7zip'
  'asar'
  'nodejs'
  'npm'
  'python'
)
provides=('zcode')
conflicts=('zcode')
options=('!strip' '!lto')
source=(
  "ZCode-${pkgver}-mac-arm64.dmg::https://cdn.zcode-ai.com/zcode/electron/releases/${pkgver}/ZCode-${pkgver}-mac-arm64.dmg"
  'zcode.sh'
  'zcode-agent.sh'
  'zcode.desktop'
  'patch-linux-runtime.mjs'
  'node-pty.tgz::https://registry.npmjs.org/node-pty/-/node-pty-1.1.0.tgz'
)
noextract=(
  "ZCode-${pkgver}-mac-arm64.dmg"
  'node-pty.tgz'
)
sha256sums=(
  '80c5b4cc211f5ab5e1eeb7d8e1822e4743df93afbfbbacf073af94d35f2bcbcb'
  '3a4a003b52841ae44b2f52ee3934db4a6817c81ade7712b3d7ebd1342f8cfec1'
  'c6e3e82a1bdd4d32e93169d7ea1cff5b8774bf90cebfae9de68768b882494d1c'
  '93bb4962e64681acff5ae798b0025154a80160f147347747b397b31aba603ddc'
  '52f10f294164910749eb3a84b00215dd643ebe019c9a8515b5d53a2ca9f70839'
  'c7517f19083ddcb05f276904680eb2b11a6b5ecab778b8e4e5685a6d645b3f60'
)

_electron_major=41

prepare() {
  cd "${srcdir}"
  rm -rf dmg app-extracted app.asar app.asar.unpacked native-build
  mkdir dmg

  7z x -bd -y "ZCode-${pkgver}-mac-arm64.dmg" -odmg >/dev/null

  local appdir
  appdir="$(find dmg -maxdepth 4 -type d -name 'ZCode.app' ! -path '*/__MACOSX/*' -print -quit)"
  [[ -n "${appdir}" ]] || {
    echo "Could not find ZCode.app in upstream dmg"
    return 1
  }

  asar extract \
    "${appdir}/Contents/Resources/app.asar" \
    app-extracted

  [[ -d "${appdir}/Contents/Resources/app.asar.unpacked" ]] &&
    cp -a "${appdir}/Contents/Resources/app.asar.unpacked" .

  cp -a "${appdir}/Contents/Resources/glm" .
  cp -a "${appdir}/Contents/Resources/model-providers" .
  cp -a "${appdir}/Contents/Resources/icon.png" .
  cp -a "${appdir}/Contents/Resources/icon_windows.png" .
  cp -a "${appdir}/Contents/Resources/app-update.yml" .

  node "${srcdir}/patch-linux-runtime.mjs" app-extracted

  mkdir native-build
  cd native-build

  cat >package.json <<'EOF'
{
  "name": "zcode-desktop-native-rebuild",
  "private": true,
  "license": "UNLICENSED"
}
EOF

  npm install \
    --ignore-scripts \
    --no-audit \
    --no-fund \
    "${srcdir}/node-pty.tgz"

  export npm_config_runtime=electron
  export npm_config_target="${_electron_major}.0.0"
  export npm_config_disturl='https://electronjs.org/headers'
  export npm_config_build_from_source=true

  npx --yes @electron/rebuild -v "${_electron_major}.0.0" --force

  rm -rf "${srcdir}/app-extracted/node_modules/node-pty"
  rm -rf "${srcdir}/app.asar.unpacked/node_modules/node-pty"
  cp -a node_modules/node-pty "${srcdir}/app-extracted/node_modules/"
  install -dm755 "${srcdir}/app.asar.unpacked/node_modules"
  cp -a node_modules/node-pty "${srcdir}/app.asar.unpacked/node_modules/"

  cd "${srcdir}"
  rm -rf app-extracted/node_modules/@lydell/node-pty-darwin-*
  rm -rf app.asar.unpacked/node_modules/@lydell/node-pty-darwin-*

  find app-extracted app.asar.unpacked \
    -path '*/node_modules/node-pty/prebuilds/*' \
    ! -path '*/linux-x64/*' \
    -prune -exec rm -rf '{}' +
  find app-extracted app.asar.unpacked \
    -path '*/node_modules/node-pty/bin/darwin-*' \
    -prune -exec rm -rf '{}' +
  find app-extracted app.asar.unpacked \
    -type f \( -name Makefile -o -name '*.mk' -o -name config.gypi \) \
    -delete
  find app-extracted app.asar.unpacked \
    -type d -name .deps -prune -exec rm -rf '{}' +

  asar pack app-extracted app.asar --unpack '{*.node,spawn-helper}'
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

  install -Dm755 "${srcdir}/zcode.sh" \
    "${pkgdir}/usr/bin/zcode"
  install -Dm755 "${srcdir}/zcode-agent.sh" \
    "${pkgdir}/usr/lib/${pkgname}/zcode-agent.sh"

  install -Dm644 app.asar \
    "${pkgdir}/usr/lib/${pkgname}/resources/app.asar"

  if [[ -d app.asar.unpacked ]]; then
    cp -a app.asar.unpacked \
      "${pkgdir}/usr/lib/${pkgname}/resources/"
  fi

  cp -a glm model-providers \
    "${pkgdir}/usr/lib/${pkgname}/resources/"
  ln -s ../../zcode-agent.sh \
    "${pkgdir}/usr/lib/${pkgname}/resources/glm/zcode-agent"

  install -Dm644 icon.png \
    "${pkgdir}/usr/lib/${pkgname}/resources/icon.png"
  install -Dm644 icon_windows.png \
    "${pkgdir}/usr/lib/${pkgname}/resources/icon_windows.png"
  install -Dm644 app-update.yml \
    "${pkgdir}/usr/lib/${pkgname}/resources/app-update.yml"

  rm -rf "${pkgdir}/usr/lib/${pkgname}/resources/tools/ripgrep"
  install -dm755 "${pkgdir}/usr/lib/${pkgname}/resources/tools/ripgrep"
  ln -s /usr/bin/rg \
    "${pkgdir}/usr/lib/${pkgname}/resources/tools/ripgrep/rg"

  install -Dm644 icon.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/zcode.png"
  install -Dm644 "${srcdir}/zcode.desktop" \
    "${pkgdir}/usr/share/applications/zcode.desktop"
  install -Dm644 "${srcdir}/app-extracted/node_modules/node-pty/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-node-pty"
  install -Dm644 "${srcdir}/app-extracted/package.json" \
    "${pkgdir}/usr/share/doc/${pkgname}/package.json"
}
