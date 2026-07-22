# Maintainer: w <unknown>

pkgname=typeless
pkgver=2.1.0
pkgrel=1
pkgdesc='AI voice dictation for any application (unofficial Linux compatibility build)'
arch=('x86_64')
url='https://www.typeless.com/'
license=('MIT' 'LicenseRef-custom')
provides=('typeless')
conflicts=('typeless')
depends=(
  'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2' 'glibc'
  'gtk3' 'libcups' 'libdrm' 'libogg' 'libpulse' 'libx11' 'libxcb'
  'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxkbcommon'
  'libxrandr' 'libxtst' 'mesa' 'nspr' 'nss' 'opus' 'pango' 'xdg-utils'
  'xdotool' 'ydotool'
)
makedepends=('asar' 'cmake' 'ninja' 'p7zip' 'pkgconf')
optdepends=(
  'wtype: text insertion in Wayland sessions'
  'pipewire: screen and audio capture under Wayland'
)
options=('!strip')

_electron_version=33.4.11
_better_sqlite_version=12.4.1
_electron_abi=130

source=(
  "Typeless-${pkgver}-x64-Setup.exe::https://typeless-static.com/desktop-release/Typeless-${pkgver}-x64-Setup.exe"
  "electron-v${_electron_version}-linux-x64.zip::https://github.com/electron/electron/releases/download/v${_electron_version}/electron-v${_electron_version}-linux-x64.zip"
  "better-sqlite3-v${_better_sqlite_version}-electron-v${_electron_abi}-linux-x64.tar.gz::https://github.com/WiseLibs/better-sqlite3/releases/download/v${_better_sqlite_version}/better-sqlite3-v${_better_sqlite_version}-electron-v${_electron_abi}-linux-x64.tar.gz"
  'CMakeLists.txt'
  'typeless_helper.cpp'
  'opus_helper.cpp'
  'patch-main.mjs'
  'keyboard-helper-child-process-linux.mjs'
  'typeless.sh'
  'typeless.desktop'
)
noextract=(
  "Typeless-${pkgver}-x64-Setup.exe"
  "electron-v${_electron_version}-linux-x64.zip"
  "better-sqlite3-v${_better_sqlite_version}-electron-v${_electron_abi}-linux-x64.tar.gz"
)
sha256sums=('254e7bf963786df4e79c277a310f6c66b83f2b954f6c51b43b4f2c624c452320'
            '212d431c7c916292311c797cd91f84467c5abd6e6983cf24b162efff64cee8a9'
            '54c970ef78326dc203455383e7097a86c4cc5f2c92733984cbcb118ac88bdcec'
            'afedbdcbcf754da75c6d428e8adfff337d857049009c96a272125533a16e71a2'
            '87ade74f138c711b10ea0a43f1650ea0b26a2bb8421ffac4d2f5b00994d7a3a1'
            '43b9c517611e3329f91352b3165f590a4c862a501ba163915e8d96c70bfc5956'
            '3a7a0e561e63a0d32e068e6d27d9616be9f88c47b2228284ce034a53e8ae2623'
            'c434d7b071394e3d8efab5f6d065fa0c9dfb566b9f20b00d5da5abd1fa2c7c65'
            '2ea1079651e2c85587f1c3272234d06b5aa906259201d8b379e71a3285e20b5c'
            '7eab64616bea602e2382cef4c9616edde36a01b475128c1f00fa3b3c8f6ffd58')

prepare() {
  rm -rf -- "$srcdir/nsis" "$srcdir/upstream" "$srcdir/electron-runtime" "$srcdir/sqlite-prebuild"
  mkdir -p "$srcdir/nsis" "$srcdir/upstream" "$srcdir/electron-runtime" "$srcdir/sqlite-prebuild"

  7z x -y -o"$srcdir/nsis" "$srcdir/Typeless-${pkgver}-x64-Setup.exe"
  7z x -y -o"$srcdir/upstream" "$srcdir/nsis/\$PLUGINSDIR/app-64.7z"

  asar extract "$srcdir/upstream/resources/app.asar" "$srcdir/upstream/resources/app"
  node "$srcdir/patch-main.mjs" \
    "$srcdir/upstream/resources/app/dist/main/index.js" \
    "$srcdir/keyboard-helper-child-process-linux.mjs"
  rm -f -- "$srcdir/upstream/resources/app.asar"
  rm -rf -- "$srcdir/upstream/resources/app.asar.unpacked"

  tar -xzf "$srcdir/better-sqlite3-v${_better_sqlite_version}-electron-v${_electron_abi}-linux-x64.tar.gz" \
    -C "$srcdir/sqlite-prebuild"
  local sqlite_binary
  sqlite_binary="$(find "$srcdir/sqlite-prebuild" -type f -name better_sqlite3.node -print -quit)"
  [[ -n "$sqlite_binary" ]] || return 1
  install -Dm755 "$sqlite_binary" \
    "$srcdir/upstream/resources/app/node_modules/better-sqlite3/build/Release/better_sqlite3.node"

  # The asar contains binaries for every Koffi target plus Windows-only modules.
  # Keep the Linux N-API build and discard binaries that can never be loaded here.
  find "$srcdir/upstream/resources/app/node_modules/koffi/build/koffi" \
    -mindepth 1 -maxdepth 1 -type d ! -name linux_x64 -exec rm -rf -- {} +
  rm -rf -- "$srcdir/upstream/resources/app/node_modules/winax"

  bsdtar -xf "$srcdir/electron-v${_electron_version}-linux-x64.zip" \
    -C "$srcdir/electron-runtime"
  chmod 4755 "$srcdir/electron-runtime/chrome-sandbox"
}

build() {
  cmake -S "$srcdir" -B "$srcdir/native-build" -G Ninja \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build "$srcdir/native-build"
}

package() {
  local appdir="$pkgdir/opt/typeless"
  install -d "$appdir" "$appdir/resources"
  cp -a --no-preserve=ownership "$srcdir/electron-runtime/." "$appdir/"
  rm -f -- "$appdir/resources/default_app.asar"
  mv "$appdir/electron" "$appdir/typeless"

  cp -a --no-preserve=ownership "$srcdir/upstream/resources/app" "$appdir/resources/app"
  cp -a --no-preserve=ownership "$srcdir/upstream/resources/build" "$appdir/resources/build"
  cp -a --no-preserve=ownership "$srcdir/upstream/resources/drizzle" "$appdir/resources/drizzle"
  cp -a --no-preserve=ownership "$srcdir/upstream/resources/locales" "$appdir/resources/locales"
  cp -a --no-preserve=ownership "$srcdir/upstream/resources/lib" "$appdir/resources/lib"

  rm -rf -- "$appdir/resources/lib/"*/build/windows
  install -Dm755 "$srcdir/native-build/libtypeless_helper.so" \
    "$appdir/resources/lib/keyboard-helper/build/linux/x64/libKeyboardHelper.so"
  install -Dm755 "$srcdir/native-build/libtypeless_helper.so" \
    "$appdir/resources/lib/context-helper/build/linux/x64/libContextHelper.so"
  install -Dm755 "$srcdir/native-build/libtypeless_helper.so" \
    "$appdir/resources/lib/input-helper/build/linux/x64/libInputHelper.so"
  install -Dm755 "$srcdir/native-build/libtypeless_helper.so" \
    "$appdir/resources/lib/util-helper/build/libUtilHelper.so"
  install -Dm755 "$srcdir/native-build/libopusenc.so" \
    "$appdir/resources/lib/libopusenc/build/linux/x64/libopusenc.so"

  chmod 4755 "$appdir/chrome-sandbox"
  install -Dm755 "$srcdir/typeless.sh" "$pkgdir/usr/bin/typeless"
  install -Dm644 "$srcdir/typeless.desktop" \
    "$pkgdir/usr/share/applications/typeless.desktop"
  install -Dm644 "$srcdir/upstream/resources/build/icons/png/256x256.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/typeless.png"

  install -Dm644 "$srcdir/electron-runtime/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron"
  install -Dm644 "$srcdir/electron-runtime/LICENSES.chromium.html" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
  install -Dm644 "$srcdir/upstream/resources/app/package.json" \
    "$pkgdir/usr/share/licenses/$pkgname/app-package.json"
}
