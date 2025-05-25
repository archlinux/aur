# Maintainer:
# Contributor: zneix <zneix@zneix.eu>

pkgname="chatterino2-7tv-git"
pkgver=7.5.3.r86.g28721ab
pkgrel=1
pkgdesc='A fork of Chatterino2 with built-in support for 7tv emotes'
url="https://github.com/SevenTV/chatterino7"
license=('MIT')
arch=('x86_64')

depends=(
  'libavif'
  'libnotify'
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
    #'arsenm.sanitizers-cmake'::'git+https://github.com/arsenm/sanitizers-cmake.git'::'cmake/sanitizers-cmake'
    'chatterino.certify'::'git+https://github.com/Chatterino/certify.git'::'lib/certify'
    #'chatterino.crash-handler'::'git+https://github.com/Chatterino/crash-handler.git'::'tools/crash-handler'
    'chatterino.libcommuni'::'git+https://github.com/Chatterino/libcommuni.git'::'lib/libcommuni'
    'chatterino.websocketpp'::'git+https://github.com/Chatterino/websocketpp.git'::'lib/websocketpp'
    'fmtlib.fmt'::'git+https://github.com/fmtlib/fmt.git'::'lib/twitch-eventsub-ws/lib/fmt'
    #'frankosterfeld.qtkeychain'::'git+https://github.com/frankosterfeld/qtkeychain.git'::'lib/qtkeychain'
    #'google.googletest'::'git+https://github.com/google/googletest.git'::'lib/googletest'
    'howardhinnant.date'::'git+https://github.com/HowardHinnant/date.git'::'lib/twitch-eventsub-ws/lib/date'
    'kde.kimageformats'::'git+https://github.com/KDE/kimageformats.git'::'lib/kimageformats'
    'lua'::'git+https://github.com/lua/lua.git'::'lib/lua/src'
    'mackron.miniaudio'::'git+https://github.com/mackron/miniaudio.git'::'lib/miniaudio'
    #'martinmoene.expected-lite'::'git+https://github.com/martinmoene/expected-lite.git'::'lib/expected-lite'
    #'mohabouje.wintoast'::'git+https://github.com/mohabouje/WinToast.git'::'lib/WinToast'
    'neargye.magic_enum'::'git+https://github.com/Neargye/magic_enum.git'::'lib/magic_enum'
    'pajlada.serialize'::'git+https://github.com/pajlada/serialize.git'::'lib/serialize'
    'pajlada.settings'::'git+https://github.com/pajlada/settings.git'::'lib/settings'
    'pajlada.signals'::'git+https://github.com/pajlada/signals.git'::'lib/signals'
    #'tencent.rapidjson'::'git+https://github.com/Tencent/rapidjson.git'::'lib/rapidjson'
    'thephd.sol2'::'git+https://github.com/ThePhD/sol2.git'::'lib/sol2'
  )

  local _p _idx _src _sm_prep _sm_func
  for _p in ${_sources_add[@]}; do
    _idx="${_p%%::*}"
    _sm_prep+=("${_idx}::${_p##*::}")
    _src="${_p%::*}"
    source+=("$_src")
    sha256sums+=('SKIP')
  done

  _sm_func=$(
    cat << END
      _prepare_chatterino7() (
        cd "\$srcdir/\$_pkgsrc"
        local _submodules=(${_sm_prep[@]})
        _submodule_update
      )
END
  )

  eval "$_sm_func"
}

_source_main
_source_chatterino7

prepare() {
  _submodule_update() {
    local _module
    for _module in "${_submodules[@]}"; do
      pwd
      echo $_module
      git submodule init "${_module##*::}"
      git submodule set-url "${_module##*::}" "$srcdir/${_module%%::*}"
      git -c protocol.file.allow=always submodule update "${_module##*::}"
    done
  }

  _run_if_exists _prepare_chatterino7
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

_run_if_exists() {
  if declare -F "$1" > /dev/null; then
    eval "$1"
  fi
}
