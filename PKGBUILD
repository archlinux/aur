# Maintainer:
# Contributor: zneix <zneix@zneix.eu>

pkgname="chatterino2-7tv-git"
pkgver=7.5.2.r67.g4a40996
pkgrel=1
pkgdesc='A fork of Chatterino2 with built-in support for 7tv emotes'
url="https://github.com/SevenTV/chatterino7"
license=('MIT')
arch=('x86_64')

depends=(
  'libavif'
  'openssl'
  'qt6-5compat'
  'qt6-base'
  'qt6-svg'
  'qtkeychain-qt6'
)
makedepends=(
  'boost'
  'cmake'
  'expected-lite'
  'git'
  'ninja'
  'rapidjson'
)
optdepends=(
  'streamlink: For piping streams to video players'
)

provides=('chatterino')
conflicts=('chatterino')

options=('!lto')

_source_main() {
  _pkgsrc="chatterino7"
  source=("git+https://github.com/SevenTV/chatterino7")
  sha256sums=('SKIP')
}

_source_chatterino7() {
  local _sources_add=(
    #'arsenm.sanitizers-cmake'::'git+https://github.com/arsenm/sanitizers-cmake.git'
    'chatterino.certify'::'git+https://github.com/Chatterino/certify.git'
    #'chatterino.crash-handler'::'git+https://github.com/Chatterino/crash-handler.git'
    'chatterino.libcommuni'::'git+https://github.com/Chatterino/libcommuni.git'
    'chatterino.websocketpp'::'git+https://github.com/Chatterino/websocketpp.git'
    #'frankosterfeld.qtkeychain'::'git+https://github.com/frankosterfeld/qtkeychain.git'
    #'google.googletest'::'git+https://github.com/google/googletest.git'
    'kde.kimageformats'::'git+https://github.com/KDE/kimageformats.git'
    #'lua'::'git+https://github.com/lua/lua.git'
    'mackron.miniaudio'::'git+https://github.com/mackron/miniaudio.git'
    #'martinmoene.expected-lite'::'git+https://github.com/martinmoene/expected-lite.git'
    #'mohabouje.wintoast'::'git+https://github.com/mohabouje/WinToast.git'
    'neargye.magic_enum'::'git+https://github.com/Neargye/magic_enum.git'
    'pajlada.serialize'::'git+https://github.com/pajlada/serialize.git'
    'pajlada.settings'::'git+https://github.com/pajlada/settings.git'
    'pajlada.signals'::'git+https://github.com/pajlada/signals.git'
    #'tencent.rapidjson'::'git+https://github.com/Tencent/rapidjson.git'
    #'thephd.sol2'::'git+https://github.com/ThePhD/sol2.git'
  )

  local _p
  for _p in ${_sources_add[@]}; do
    source+=("$_p")
    sha256sums+=('SKIP')
  done

  _prepare_chatterino7() (
    cd "$srcdir/$_pkgsrc"
    local _submodules=(
      #'arsenm.sanitizers-cmake'::'cmake/sanitizers-cmake'
      'chatterino.certify'::'lib/certify'
      #'chatterino.crash-handler'::'tools/crash-handler'
      'chatterino.libcommuni'::'lib/libcommuni'
      'chatterino.websocketpp'::'lib/websocketpp'
      #'frankosterfeld.qtkeychain'::'lib/qtkeychain'
      #'google.googletest'::'lib/googletest'
      'kde.kimageformats'::'lib/kimageformats'
      #'lua'::'lib/lua/src'
      'mackron.miniaudio'::'lib/miniaudio'
      #'martinmoene.expected-lite'::'lib/expected-lite'
      #'mohabouje.wintoast'::'lib/WinToast'
      'neargye.magic_enum'::'lib/magic_enum'
      'pajlada.serialize'::'lib/serialize'
      'pajlada.settings'::'lib/settings'
      'pajlada.signals'::'lib/signals'
      #'tencent.rapidjson'::'lib/rapidjson'
      #'thephd.sol2'::'lib/sol2'
    )
    _submodule_update
  )
}

_source_main
_source_chatterino7

prepare() {
  _submodule_update() {
    local _module
    for _module in "${_submodules[@]}"; do
      git submodule init "${_module##*::}"
      git submodule set-url "${_module##*::}" "$srcdir/${_module%%::*}"
      git -c protocol.file.allow=always submodule update "${_module##*::}"
    done
  }
  _prepare_chatterino7
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
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
    -DCHATTERINO_UPDATER=OFF
    -DBUILD_WITH_QT6=ON
    -Wno-dev
  )

  if [[ "$CXXFLAGS" == *"-flto"* ]]; then
    _cmake_options+=("-DCHATTERINO_LTO=ON")
  fi

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  install -Dm755 "build/bin/chatterino" "$pkgdir/usr/bin/chatterino"

  install -Dm644 "$_pkgsrc/resources/com.chatterino.chatterino.desktop" -t "$pkgdir/usr/share/applications/"

  install -Dm644 "$_pkgsrc/resources/icon.png" "$pkgdir/usr/share/pixmaps/com.chatterino.chatterino.png"

  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
