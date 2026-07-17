# Maintainer: Akira <akira.uestc at gmail dot com>
# Releases: https://persistent.oaistatic.com/codex-app-prod/appcast.xml

pkgname=chatgpt-desktop-bin
pkgver=26.715.21425
pkgrel=1
pkgdesc="ChatGPT desktop app repackaged from the upstream macOS release archive for Arch Linux"
arch=('x86_64')
url="https://chatgpt.com/download"
license=('custom')
options=('!strip' '!debug')
provides=('openai-codex-desktop')
conflicts=('openai-codex-desktop')
replaces=('openai-codex-desktop')

depends=(
  'electron42'
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
  'better-sqlite3-12.11.1.tgz::https://registry.npmjs.org/better-sqlite3/-/better-sqlite3-12.11.1.tgz'
  'node-pty-1.1.0.tgz::https://registry.npmjs.org/node-pty/-/node-pty-1.1.0.tgz'
  'electron-v42.3.0-headers.tar.gz::https://electronjs.org/headers/v42.3.0/node-v42.3.0-headers.tar.gz'
  'chatgpt-desktop.sh'
  'ChatGPT.desktop'
  'asar-tools.mjs'
  'patch-linux-desktop-name.mjs'
  'patch-linux-open-targets.mjs'
  'patch-linux-opaque-bg.mjs'
  'patch-linux-tooltip-placement.mjs'
  'patch-linux-window-chrome.mjs'
)

noextract=(
  "ChatGPT-${pkgver}.zip"
  'better-sqlite3-12.11.1.tgz'
  'node-pty-1.1.0.tgz'
  'electron-v42.3.0-headers.tar.gz'
)

sha256sums=('e3af7a3b1f14eeaf9b17a410a7b229d1f293f4eafede5f5d396b43c1fc250e50'
            'ebf0ed75a7a59dbcb3b24bbd014ef49d9f15bc328e4adcbf516f2a8fadfa2835'
            'c7517f19083ddcb05f276904680eb2b11a6b5ecab778b8e4e5685a6d645b3f60'
            '821009f9c1830050d894aef9e61906cb0a537b2000b2d9bbed9985fff1d5e0d0'
            '5f876f3ee21fd728dad487a79fc9c3e460b759515651a3ef16da1b18885b082c'
            '5657944f83faffcb6051a7f8de00f1a10ff11fcdee382fd7c7a921119124124d'
            '6b14d89c0a7907ce988bec8cb38a00d1df74833bec92961f585d41ac8e243c56'
            'edb819fff34a05f0842f391c4cd72dbd8f2d58c18c2195eca856ca0463ef5d7c'
            '248654f95bedd3c117af7398955312d7d07ab1bd395f7ce178c1d3ab90327cfb'
            '49ca13daf940980a03179d7d12d45f950df4f033da2089a39d8e3fc4aadc99c7'
            '2ca5f140a91e340266ea663b31cbd197d094a55973b413cb56dcdb88115a07c5'
            '848c1b012274d9d42c210ea36c73d4e57d280163cd10aa652dd49950bcec4ced')

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

  tar -xzf "${srcdir}/electron-v42.3.0-headers.tar.gz" -C native-build
  mkdir -p native-build/node_modules

  tar -xzf "${srcdir}/better-sqlite3-12.11.1.tgz" -C native-build/node_modules
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
  cp -a --no-preserve=ownership \
    native-build/node_modules/better-sqlite3/LICENSE \
    native-build/node_modules/better-sqlite3/README.md \
    native-build/node_modules/better-sqlite3/binding.gyp \
    native-build/node_modules/better-sqlite3/lib \
    native-build/node_modules/better-sqlite3/package.json \
    app-extracted/node_modules/better-sqlite3/
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
  node "${srcdir}/patch-linux-tooltip-placement.mjs" app-extracted
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

  ln -s /usr/lib/electron42/electron \
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
