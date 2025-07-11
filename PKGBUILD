# Maintainer:

## options
: ${_use_sodeps:=false}

: ${_commit=}

_pkgname="telegram-desktop"
pkgname="$_pkgname-git"
pkgver=5.16.3.r3.g6afd4dc
pkgrel=1
pkgdesc='Official Telegram Desktop client'
url="https://github.com/telegramdesktop/tdesktop"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  ada
  ffmpeg
  hunspell
  kcoreaddons
  libavif
  libdispatch
  libheif
  libjxl
  libvpx
  libxdamage
  minizip
  openal
  openh264
  opus
  protobuf
  qt6-base
  qt6-declarative
  qt6-svg
  qt6-wayland
  rnnoise
  xcb-util-keysyms
  xxhash
)
makedepends=(
  boost
  cmake
  extra-cmake-modules
  fmt
  git
  glib2-devel
  gobject-introspection
  jemalloc # gio error when absent
  ninja
  range-v3
  tl-expected
)
optdepends=(
  'webkit2gtk: embedded browser features'
  'xdg-desktop-portal: desktop integration'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_source_main() {
  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git${_commit:+#commit=$_commit}")
  sha256sums=('SKIP')
}

_source_telegram_desktop() {
  local _sources_add=(
    #'apple.swift-corelibs-libdispatch'::'git+https://github.com/apple/swift-corelibs-libdispatch.git'::'Telegram/ThirdParty/dispatch'
    'cyan4973.xxhash'::'git+https://github.com/Cyan4973/xxHash.git'::'Telegram/ThirdParty/xxHash'
    'desktop-app.cmake_helpers'::'git+https://github.com/desktop-app/cmake_helpers.git'::'cmake'
    'desktop-app.codegen'::'git+https://github.com/desktop-app/codegen.git'::'Telegram/codegen'
    'desktop-app.lib_base'::'git+https://github.com/desktop-app/lib_base.git'::'Telegram/lib_base'
    'desktop-app.lib_crl'::'git+https://github.com/desktop-app/lib_crl.git'::'Telegram/lib_crl'
    'desktop-app.lib_lottie'::'git+https://github.com/desktop-app/lib_lottie.git'::'Telegram/lib_lottie'
    'desktop-app.lib_qr'::'git+https://github.com/desktop-app/lib_qr.git'::'Telegram/lib_qr'
    'desktop-app.lib_rpl'::'git+https://github.com/desktop-app/lib_rpl.git'::'Telegram/lib_rpl'
    'desktop-app.lib_spellcheck'::'git+https://github.com/desktop-app/lib_spellcheck.git'::'Telegram/lib_spellcheck'
    'desktop-app.lib_storage'::'git+https://github.com/desktop-app/lib_storage.git'::'Telegram/lib_storage'
    'desktop-app.lib_tl'::'git+https://github.com/desktop-app/lib_tl.git'::'Telegram/lib_tl'
    'desktop-app.lib_ui'::'git+https://github.com/desktop-app/lib_ui.git'::'Telegram/lib_ui'
    'desktop-app.lib_webrtc'::'git+https://github.com/desktop-app/lib_webrtc.git'::'Telegram/lib_webrtc'
    'desktop-app.lib_webview'::'git+https://github.com/desktop-app/lib_webview.git'::'Telegram/lib_webview'
    'desktop-app.libprisma'::'git+https://github.com/desktop-app/libprisma.git'::'Telegram/ThirdParty/libprisma'
    'desktop-app.rlottie'::'git+https://github.com/desktop-app/rlottie.git'::'Telegram/ThirdParty/rlottie'
    #'ericniebler.range-v3'::'git+https://github.com/ericniebler/range-v3.git'::'Telegram/ThirdParty/range-v3'
    'fcitx.fcitx5-qt'::'git+https://github.com/fcitx/fcitx5-qt.git'::'Telegram/ThirdParty/fcitx5-qt'
    'flatpak.xdg-desktop-portal'::'git+https://github.com/flatpak/xdg-desktop-portal.git'::'Telegram/ThirdParty/xdg-desktop-portal'
    'google.cld3'::'git+https://github.com/google/cld3.git'::'Telegram/ThirdParty/cld3'
    'hamonikr.nimf'::'git+https://github.com/hamonikr/nimf.git'::'Telegram/ThirdParty/nimf'
    'hime-ime.hime'::'git+https://github.com/hime-ime/hime.git'::'Telegram/ThirdParty/hime'
    #'hunspell'::'git+https://github.com/hunspell/hunspell.git'::'Telegram/ThirdParty/hunspell'
    #'kde.kcoreaddons'::'git+https://github.com/KDE/kcoreaddons.git'::'Telegram/ThirdParty/kcoreaddons'
    'kde.kimageformats'::'git+https://github.com/KDE/kimageformats.git'::'Telegram/ThirdParty/kimageformats'
    #'lz4'::'git+https://github.com/lz4/lz4.git'::'Telegram/ThirdParty/lz4'
    'microsoft.gsl'::'git+https://github.com/Microsoft/GSL.git'::'Telegram/ThirdParty/GSL'
    'nayuki.qr-code-generator'::'git+https://github.com/nayuki/QR-Code-generator.git'::'Telegram/ThirdParty/QR'
    'tartanllama.expected'::'git+https://github.com/TartanLlama/expected.git'::'Telegram/ThirdParty/expected'
    'telegrammessenger.tgcalls'::'git+https://github.com/TelegramMessenger/tgcalls.git'::'Telegram/ThirdParty/tgcalls'
  )

  local _p _idx _src _sm_prep _sm_func
  for _p in ${_sources_add[@]}; do
    _idx="${_p%%::*}"
    _sm_prep+=("${_idx}::${_p##*::}")
    _src="${_p%::*}"
    source+=("$_src")
    sha256sums+=('SKIP')
  done

  eval "_prepare_telegram_desktop() (
    cd \"\$srcdir/\$_pkgsrc\"
    local _submodules=(${_sm_prep[@]})
    _submodule_update
  )"
}

_source_desktop_app_cmake_helpers() {
  local _sources_add=(
    'mnauw.cppgir'::'git+https://gitlab.com/mnauw/cppgir.git'::'external/glib/cppgir'
  )

  local _p _idx _src _sm_prep _sm_func
  for _p in ${_sources_add[@]}; do
    _idx="${_p%%::*}"
    _sm_prep+=("${_idx}::${_p##*::}")
    _src="${_p%::*}"
    source+=("$_src")
    sha256sums+=('SKIP')
  done

  eval "_prepare_desktop_app_cmake_helpers() (
    cd \"\$srcdir/\$_pkgsrc\"
    cd 'cmake'
    local _submodules=(${_sm_prep[@]})
    _submodule_update
  )"
}

_source_mnauw_cppgir() {
  local _sources_add=(
    'martinmoene.expected-lite'::'git+https://github.com/martinmoene/expected-lite.git'::'expected-lite'
  )

  local _p _idx _src _sm_prep _sm_func
  for _p in ${_sources_add[@]}; do
    _idx="${_p%%::*}"
    _sm_prep+=("${_idx}::${_p##*::}")
    _src="${_p%::*}"
    source+=("$_src")
    sha256sums+=('SKIP')
  done

  eval "_prepare_mnauw_cppgir() (
    cd \"\$srcdir/\$_pkgsrc\"
    cd 'cmake'
    cd 'external/glib/cppgir'
    local _submodules=(${_sm_prep[@]})
    _submodule_update
  )"
}

_source_tg_owt() {
  depends+=(
    libpipewire
    libxcomposite
    libxrandr
    libxtst
  )
  makedepends+=(
    yasm
  )

  _pkgsrc_tgowt="telegram-tg_owt"
  source+=("$_pkgsrc_tgowt"::"git+https://github.com/desktop-app/tg_owt.git")
  sha256sums+=('SKIP')

  local _sources_add=(
    'abseil.abseil-cpp'::'git+https://github.com/abseil/abseil-cpp.git'::'src/third_party/abseil-cpp'
    'chromiumsrc.libyuv'::'git+https://gitlab.com/chromiumsrc/libyuv.git'::'src/third_party/libyuv'
    'cisco.libsrtp'::'git+https://github.com/cisco/libsrtp.git'::'src/third_party/libsrtp'
    'google.crc32c'::'git+https://github.com/google/crc32c.git'::'src/third_party/crc32c/src'
  )

  local _p _idx _src _sm_prep _sm_func
  for _p in ${_sources_add[@]}; do
    _idx="${_p%%::*}"
    _sm_prep+=("${_idx}::${_p##*::}")
    _src="${_p%::*}"
    source+=("$_src")
    sha256sums+=('SKIP')
  done

  eval "_prepare_tg_owt() (
    cd \"\$srcdir/\$_pkgsrc_tgowt\"
    local _submodules=(${_sm_prep[@]})
    _submodule_update
  )"
}

_source_tdlib() {
  makedepends+=('gperf')

  _pkgsrc_tdlib="telegram-tdlib"
  source+=("$_pkgsrc_tdlib"::"git+https://github.com/tdlib/td.git")
  sha256sums+=('SKIP')
}

_source_main
_source_tg_owt
_source_tdlib
_source_telegram_desktop
_source_desktop_app_cmake_helpers
_source_mnauw_cppgir

prepare() {
  _submodule_update() {
    local _module
    for _module in "${_submodules[@]}"; do
      git submodule init "${_module##*::}"
      git submodule set-url "${_module##*::}" "$srcdir/${_module%::*}"
      git -c protocol.file.allow=always submodule update "${_module##*::}"
    done
  }

  _run_if_exists _prepare_tg_owt
  _run_if_exists _prepare_tdlib
  _run_if_exists _prepare_telegram_desktop
  _run_if_exists _prepare_desktop_app_cmake_helpers
  _run_if_exists _prepare_mnauw_cppgir
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]+//;s/([^-]*-g)/r\1/;s/-/./g'
}

_build_crc32() (
  echo "Building crc32..."
  local _cmake_crc32=(
    -B "build_crc32"
    -S "$srcdir/google.crc32c"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCRC32C_BUILD_TESTS=OFF
    -DCRC32C_BUILD_BENCHMARKS=OFF
    -DCRC32C_USE_GLOG=OFF
    -Wno-dev
  )

  cmake "${_cmake_crc32[@]}"
  cmake --build "build_crc32"
  DESTDIR="$srcdir/deps" cmake --install "build_crc32"
)

_build_tg_owt() (
  echo "Building tg_owt..."
  local _cmake_tg_owt=(
    -B "build_tg_owt"
    -S "$_pkgsrc_tgowt"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_PREFIX_PATH="$srcdir/deps/usr"
    -DTG_OWT_PACKAGED_BUILD=ON
    -DBUILD_SHARED_LIBS=OFF
    -Wno-dev
  )

  cmake "${_cmake_tg_owt[@]}"
  cmake --build "build_tg_owt"
)

_build_tde2e() (
  echo "Building tde2e..."
  local _cmake_tde2e=(
    -B "build_tde2e"
    -S "$_pkgsrc_tdlib"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DTD_E2E_ONLY=ON
    -DBUILD_SHARED_LIBS=OFF
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_tde2e[@]}"
  cmake --build "build_tde2e"
  DESTDIR="$srcdir/deps" cmake --install "build_tde2e"
)

_build_telegram() (
  echo "Building telegram..."
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_PREFIX_PATH="$srcdir/deps/usr"
    -DDESKTOP_APP_DISABLE_AUTOUPDATE=ON
    -DTDESKTOP_API_TEST=ON
    -DTDESKTOP_API_ID=611335
    -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c
    -DDESKTOP_APP_USE_PACKAGED_FONTS=OFF
    -Dtg_owt_DIR="$srcdir/build_tg_owt"
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
)

build() {
  _build_crc32
  _build_tg_owt
  _build_tde2e
  _build_telegram
}

package() {
  if [[ "${_use_sodeps::1}" == "t" ]]; then
    eval "depends+=(
      'libavcodec.so'
      'libavfilter.so'
      'libavformat.so'
      'libavutil.so'
      'libcrypto.so'
      'libgio-2.0.so'
      'libglib-2.0.so'
      'libgobject-2.0.so'
      'libjpeg.so'
      'liblz4.so'
      'libopenal.so'
      'libopenh264.so'
      'libopus.so'
      'libpipewire-0.3.so'
      'libprotobuf-lite.so'
      'libssl.so'
      'libswresample.so'
      'libswscale.so'
      'libvpx.so'
      'libxxhash.so'
      'libz.so'
    )"
  fi

  DESTDIR="$pkgdir" cmake --install build
}

_run_if_exists() {
  if declare -F "$1" > /dev/null; then
    eval "$1"
  fi
}
