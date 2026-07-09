# Maintainer: hekel <hekel at vivaldi dot net>
# https://github.com/hekel/chatterino-stuffs

pkgname="chatterino2-7tv-native-git"
pkgver=7.5.5.r158.g26b39f3
pkgrel=1
pkgdesc='Chatterino2 fork with support for 7tv; Patched to use native system QT style'
url="https://github.com/SevenTV/chatterino7"
license=('MIT')
arch=('x86_64')
depends=(
  'boost-libs'
  'hunspell'
  'libavif'
  'libnotify'
  'openssl'
  'qt6-base'
  'qt6-imageformats'
  'qt6-svg'
  'qtkeychain-qt6'
)
makedepends=(
  'boost'
  'cmake'
  'expected-lite'
  'git'
  'ninja'
  'qt6-tools'
  'rapidjson'
)
optdepends=(
  'streamlink: For piping streams to video players'
  'qt6-wayland: For Wayland support'
)
provides=('chatterino')
conflicts=('chatterino')
install=$pkgname.install

_pkgsrc="chatterino7"
source=(
  "git+https://github.com/SevenTV/chatterino7"
  "git+https://github.com/Chatterino/libcommuni#branch=chatterino-cmake"
  "git+https://github.com/Chatterino/websocketpp"
  "git+https://github.com/Chatterino/certify"
  "git+https://github.com/pajlada/settings"
  "git+https://github.com/pajlada/serialize"
  "git+https://github.com/pajlada/signals"
  "git+https://github.com/Neargye/magic_enum"
  "git+https://github.com/mackron/miniaudio"
  "git+https://github.com/lua/lua"
  "git+https://github.com/ThePhD/sol2"
  "https://github.com/hekel/chatterino-stuffs/raw/refs/heads/master/native-qt/nativeQT-and-StyleSheet.patch"
  "https://github.com/hekel/chatterino-stuffs/raw/refs/heads/master/native-qt/fix-svg-icons.patch"
  "https://github.com/hekel/chatterino-stuffs/raw/refs/heads/master/native-qt/fix-bg-opacity.patch"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  '9c3920cb63073331a6ee368bbb85f67a259cdb8cf602417750925531fbe45bcd'
  'f7694cfd67cdfdb7ef825052af4d0a09ea8043a747bbfe60692d0102b7cc42bb'
  '33bac9cf012dac641118146866294bcb79f91bd0d53000eef68c33bb5f905fcd'
)

pkgver() {
  cd "$_pkgsrc"
  git describe --long --abbrev=7 | sed 's/^[^0-9]*//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare () {
  cd "$_pkgsrc"

  msg2 "Applying patches to use Native QT Style"
  patch -p1 -i $srcdir/nativeQT-and-StyleSheet.patch || exit 1
  patch -p1 -i $srcdir/fix-svg-icons.patch || exit 1
  patch -p1 -i $srcdir/fix-bg-opacity.patch || exit 1

  # Disable updating of unused submodules
  git config submodule.cmake/sanitizers-cmake.update "none"
  git config submodule.lib/rapidjson.update "none"
  git config submodule.tools/crash-handler.update "none"
  git config submodule.lib/googletest.update "none"
  git config submodule.lib/twitch-eventsub-ws/lib/date.update "none"
  git config submodule.lib/twitch-eventsub-ws/lib/fmt.update "none"
  git config submodule.lib/WinToast.update "none"
  git config submodule.lib/qtkeychain.update "none"

  git submodule init
  git config submodule.lib/libcommuni.url "$srcdir/libcommuni"
  git config submodule.lib/settings.url "$srcdir/settings"
  git config submodule.lib/signals.url "$srcdir/signals"
  git config submodule.lib/serialize.url "$srcdir/serialize"
  git config submodule.lib/websocketpp.url "$srcdir/websocketpp"
  git config submodule.lib/miniaudio.url "$srcdir/miniaudio"
  git config submodule.lib/magicenum.url "$srcdir/magicenum"
  git config submodule.lib/sol2.url "$srcdir/sol2"
  git config submodule.lib/lua/src.url "$srcdir/lua"
  git config submodule.lib/certify.url "$srcdir/certify"
  git -c protocol.file.allow=always submodule update
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DUSE_SYSTEM_QTKEYCHAIN=ON
    -DUSE_PRECOMPILED_HEADERS=OFF
    -DCHATTERINO_SPELLCHECK=ON
    -DCHATTERINO_UPDATER=OFF
    -DSKIP_JSON_GENERATION=ON
    -Wno-dev
  )

  if [[ "$CXXFLAGS" == *"-flto"* ]]; then
    _cmake_options+=("-DCHATTERINO_LTO=ON")
  fi

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  if [ -f "build/bin/chatterino" ] && [ -x "build/bin/chatterino" ]; then
    echo "Getting chatterino binary from bin folder"
    install -Dm755 "build/bin/chatterino" "$pkgdir/usr/bin/chatterino"
  else
    echo "Getting chatterino binary from NON-BIN folder"
    # System ccache is enabled, causing the binary file to not fall into the bin folder
    # Temporary solution until we have figured out a way to stabilize the ccache output
    install -Dm755 "build/chatterino" "$pkgdir/usr/bin/chatterino"
  fi

  cd "$_pkgsrc"

  install -Dm644 "resources/com.chatterino.chatterino.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "resources/icon.png" "$pkgdir/usr/share/pixmaps/com.chatterino.chatterino.png"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
