# Maintainer: Akira <akira.uestc at gmail dot com>
# Releases: https://persistent.oaistatic.com/codex-app-prod/appcast.xml

pkgname=chatgpt-desktop-bin
pkgver=26.707.72221
pkgrel=2
pkgdesc="ChatGPT desktop app repackaged from the upstream macOS release archive for Arch Linux"
arch=('x86_64')
url="https://chatgpt.com/download"
license=('custom')
options=('!strip' '!debug')
provides=('openai-codex-desktop')
conflicts=('openai-codex-desktop')
replaces=('openai-codex-desktop')

depends=(
  'electron39'
  'openai-codex'
  'python'
  'hicolor-icon-theme'
  'xdg-utils'
)

makedepends=(
  'imagemagick'
  'libarchive'
  'node-gyp'
  'nodejs'
)

source=(
  "ChatGPT-${pkgver}.zip::https://persistent.oaistatic.com/codex-app-prod/ChatGPT-darwin-arm64-${pkgver}.zip"
  'better-sqlite3-12.9.0.tgz::https://registry.npmjs.org/better-sqlite3/-/better-sqlite3-12.9.0.tgz'
  'node-pty-1.1.0.tgz::https://registry.npmjs.org/node-pty/-/node-pty-1.1.0.tgz'
  'electron-v39.8.10-headers.tar.gz::https://electronjs.org/headers/v39.8.10/node-v39.8.10-headers.tar.gz'
  'chatgpt-desktop.sh'
  'ChatGPT.desktop'
  'asar-tools.mjs'
  'patch-linux-desktop-name.mjs'
  'patch-linux-open-targets.mjs'
  'patch-linux-opaque-bg.mjs'
  'patch-linux-window-chrome.mjs'
)

noextract=(
  "ChatGPT-${pkgver}.zip"
  'better-sqlite3-12.9.0.tgz'
  'node-pty-1.1.0.tgz'
  'electron-v39.8.10-headers.tar.gz'
)

sha256sums=('d47a2c0dfb07afec21c415fcec672035a2e90410ecb7c6dc60141518fba524e0'
            'ad0e29650140c49d0335b1d356596aa8166f12b758f418a98446130e3278f250'
            'c7517f19083ddcb05f276904680eb2b11a6b5ecab778b8e4e5685a6d645b3f60'
            '61069dec76ed8d1c10ab6825b194bdf5a19b653286a7c2684b09c62681427446'
            '2234d76c97f89ca1d70643ed893a9f6c4641269e2dbd2966743fbe9e62cf5096'
            '5657944f83faffcb6051a7f8de00f1a10ff11fcdee382fd7c7a921119124124d'
            '6b14d89c0a7907ce988bec8cb38a00d1df74833bec92961f585d41ac8e243c56'
            'edb819fff34a05f0842f391c4cd72dbd8f2d58c18c2195eca856ca0463ef5d7c'
            '74b0c62a48ea4a8bf91f8851c7b3c8ce6845e9107af651f5ee40eb9e3161d8bf'
            '49ca13daf940980a03179d7d12d45f950df4f033da2089a39d8e3fc4aadc99c7'
            '9c5d7410cbe94145089fa79cc08ac6bb7197cc8751ad5b45f0ae2331dc39d168')

prepare() {
  cd "${srcdir}"

  rm -rf dmg app-extracted app.asar app.asar.unpacked icon native-build
  mkdir -p dmg icon native-build

  bsdtar -xf "ChatGPT-${pkgver}.zip" -C "${srcdir}/dmg"

  local appdir
  appdir="$(find dmg -maxdepth 4 -type d -name '*.app' ! -path '*/__MACOSX/*' -print -quit)"
  [[ -n "${appdir}" ]] || {
    echo "Could not find .app bundle in ChatGPT archive"
    return 1
  }

  local resources_dir="${appdir}/Contents/Resources"
  [[ -f "${resources_dir}/app.asar" ]] || {
    echo "Could not find app.asar in ChatGPT archive"
    return 1
  }

  node "${srcdir}/asar-tools.mjs" extract \
    "${resources_dir}/app.asar" \
    app-extracted \
    "${resources_dir}/app.asar.unpacked"

  tar -xzf "${srcdir}/electron-v39.8.10-headers.tar.gz" -C native-build
  mkdir -p native-build/node_modules

  tar -xzf "${srcdir}/better-sqlite3-12.9.0.tgz" -C native-build/node_modules
  mv native-build/node_modules/package native-build/node_modules/better-sqlite3

  tar -xzf "${srcdir}/node-pty-1.1.0.tgz" -C native-build/node_modules
  mv native-build/node_modules/package native-build/node_modules/node-pty

  cp -a --no-preserve=ownership app-extracted/node_modules/node-addon-api \
    native-build/node_modules/

  (
    cd native-build/node_modules/better-sqlite3
    node-gyp configure --release --nodedir="${srcdir}/native-build/node_headers"
    mkdir -p \
      build/Release/.deps/Release/obj.target/sqlite3/gen/sqlite3 \
      build/Release/.deps/Release/obj.target/better_sqlite3/src \
      build/Release/.deps/Release/obj.target/better_sqlite3/src/objects \
      build/Release/.deps/Release/obj.target/better_sqlite3/src/util \
      build/Release/.deps/Release/obj.target/test_extension/deps
    node-gyp build --release
  )

  (
    cd native-build/node_modules/node-pty
    node-gyp configure --release --nodedir="${srcdir}/native-build/node_headers"
    mkdir -p build/Release/.deps/Release/obj.target/pty/src/unix
    node-gyp build --release
  )

  rm -rf app-extracted/node_modules/better-sqlite3/build
  mkdir -p app-extracted/node_modules/better-sqlite3/build/Release
  cp -a --no-preserve=ownership \
    native-build/node_modules/better-sqlite3/build/Release/better_sqlite3.node \
    native-build/node_modules/better-sqlite3/build/Release/test_extension.node \
    app-extracted/node_modules/better-sqlite3/build/Release/

  rm -rf app-extracted/node_modules/node-pty/build
  mkdir -p app-extracted/node_modules/node-pty/build/Release
  cp -a --no-preserve=ownership \
    native-build/node_modules/node-pty/build/Release/pty.node \
    app-extracted/node_modules/node-pty/build/Release/

  rm -f app-extracted/node_modules/better-sqlite3/.codex-native-module-build.json
  rm -f app-extracted/node_modules/node-pty/.codex-native-module-build.json
  rm -rf app-extracted/node_modules/node-mac-permissions
  rm -rf app-extracted/node_modules/objc-js/prebuilds
  find app-extracted -type f \( -name '*.dylib' -o -name 'sparkle.node' \) -delete
  find app-extracted -type d -name '*.dSYM' -prune -exec rm -rf {} +
  find app-extracted -path '*/prebuilds/*' -type f -name '*.node' \
    ! \( -path '*/linux-x64/*' -o -path '*/HID-linux-x64/*' -o -path '*/HID_hidraw-linux-x64/*' \) \
    -delete
  find app-extracted -path '*/prebuilds/*' -type f -name '*musl*.node' -delete

  node "${srcdir}/patch-linux-desktop-name.mjs" app-extracted
  node "${srcdir}/patch-linux-open-targets.mjs" app-extracted
  node "${srcdir}/patch-linux-opaque-bg.mjs" app-extracted
  node "${srcdir}/patch-linux-window-chrome.mjs" app-extracted

  node "${srcdir}/asar-tools.mjs" pack app-extracted app.asar app.asar.unpacked

  magick "${resources_dir}/icon-chatgpt.png" -resize 512x512 icon/chatgpt-desktop.png
}

package() {
  cd "${srcdir}"

  install -Dm644 app.asar \
    "${pkgdir}/usr/lib/${pkgname}/resources/app.asar"

  if [[ -d app.asar.unpacked ]]; then
    cp -a --no-preserve=ownership app.asar.unpacked \
      "${pkgdir}/usr/lib/${pkgname}/resources/"
  fi

  if [[ -d app-extracted/webview ]]; then
    mkdir -p "${pkgdir}/usr/lib/${pkgname}/content"
    cp -a --no-preserve=ownership app-extracted/webview \
      "${pkgdir}/usr/lib/${pkgname}/content/"
  fi

  ln -s /usr/lib/electron39/electron \
    "${pkgdir}/usr/lib/${pkgname}/chatgpt"

  install -Dm755 chatgpt-desktop.sh \
    "${pkgdir}/usr/bin/chatgpt-desktop"

  install -Dm644 icon/chatgpt-desktop.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/chatgpt-desktop.png"

  install -Dm644 ChatGPT.desktop \
    "${pkgdir}/usr/share/applications/ChatGPT.desktop"

  local notices
  notices="$(find dmg -path '*/Contents/Resources/THIRD_PARTY_NOTICES.txt' ! -path '*/__MACOSX/*' -print -quit)"
  [[ -n "${notices}" ]] || {
    echo "Could not find THIRD_PARTY_NOTICES.txt"
    return 1
  }

  install -Dm644 "${notices}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES.txt"
}
