# Maintainer:
# Contributor: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: 3Jl0y_PYCCKUi <3jl0y_pycckui@riseup.net>
# Contributor: solopasha <daron439 at gmail dot com>
# Contributor: Ilya Fedin <fedin-ilja2010@ya.ru>
# Contributor: Auteiy <dmitry@auteiy.me>

# options
: ${_build_tg_owt:=true}

: ${_build_git:=true}

unset _pkgtype
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

# basic info
_pkgname="kotatogram-desktop"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=1.4.14.r4897.g0c4ceba
pkgrel=1
pkgdesc='Experimental fork of Telegram Desktop'
url="https://github.com/kotatogram/kotatogram-desktop"
license=('GPL-3.0-only')
arch=('x86_64')

# main package
_main_package() {
  depends=(
    'abseil-cpp'
    'ffmpeg4.4'
    'glib2'
    'glibc'
    'glibmm-2.68'
    'gobject-introspection'
    'hicolor-icon-theme'
    'hunspell'
    'jemalloc'
    'kcoreaddons'
    'kimageformats'
    'libdispatch'
    'libjpeg-turbo'
    'libpipewire'
    'libsigc++'
    'libvpx'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxrandr'
    'libxtst'
    'lz4'
    'minizip'
    'openal'
    'openh264'
    'opus'
    'qt6-imageformats'
    'qt6-svg'
    'qt6-wayland'
    'rnnoise'
    'ttf-opensans'
    'wayland'
    'xcb-util-keysyms'
    'xxhash'
    'zlib'
  )
  makedepends=(
    'boost'
    'cmake'
    'extra-cmake-modules'
    'git'
    'meson'
    'microsoft-gsl'
    'ninja'
    'pipewire'
    'protobuf'
    'plasma-wayland-protocols'
    'python'
    'range-v3'
    'tl-expected'
    'unzip'
    'wayland-protocols'
    'webkit2gtk'
    'yasm'
  )
  optdepends=(
    'webkit2gtk: embedded browser features'
    'xdg-desktop-portal: desktop integration'
  )

  provides=('kotatogram-desktop')
  conflicts=('kotatogram-desktop')

  # kotatogram
  _pkgsrc="$_pkgname"
  _branch="patches-track-4.14"
  source+=("$_pkgsrc"::"git+$url.git#branch=$_branch")
  sha256sums+=('SKIP')

  _source_kotatogram_desktop
  _source_ericniebler_range_v3
  _source_telegramdesktop_libtgvoip

  _source_desktop_app_cmake_helpers
  _source_mnauw_cppgir

  if [[ "${_build_tg_owt::1}" == "t" ]] ; then
    _source_kotatogram_tg_owt
  fi
}

_source_kotatogram_tg_owt() {
  _tg_owt_commit=afd9d5d31798d3eacf9ed6c30601e91d0f1e4d60
  source+=(
    "kotatogram-tg_owt"::"git+https://github.com/desktop-app/tg_owt.git#commit=${_tg_owt_commit}"

    # submodules
    'abseil.abseil-cpp'::'git+https://github.com/abseil/abseil-cpp.git'
    'chromiumsrc.libyuv'::'git+https://gitlab.com/chromiumsrc/libyuv.git'
    'cisco.libsrtp'::'git+https://github.com/cisco/libsrtp.git'
    'google.crc32c'::'git+https://github.com/google/crc32c.git'
  )
  sha256sums+=(
    'SKIP'

    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
  )

  _prepare_kotatogram_tg_owt() (
    cd "$srcdir/kotatogram-tg_owt"
    local -A _submodules=(
      ['abseil.abseil-cpp']='src/third_party/abseil-cpp'
      ['chromiumsrc.libyuv']='src/third_party/libyuv'
      ['cisco.libsrtp']='src/third_party/libsrtp'
      ['google.crc32c']='src/third_party/crc32c/src'
    )
    _submodule_update
  )
}

_source_kotatogram_desktop() {
  source+=(
    'apple.swift-corelibs-libdispatch'::'git+https://github.com/apple/swift-corelibs-libdispatch.git'
    'cyan4973.xxhash'::'git+https://github.com/Cyan4973/xxHash.git'
    'desktop-app.codegen'::'git+https://github.com/desktop-app/codegen.git'
    'desktop-app.gsl'::'git+https://github.com/desktop-app/GSL.git'
    'desktop-app.lib_base'::'git+https://github.com/desktop-app/lib_base.git'
    'desktop-app.lib_crl'::'git+https://github.com/desktop-app/lib_crl.git'
    'desktop-app.lib_lottie'::'git+https://github.com/desktop-app/lib_lottie.git'
    'desktop-app.lib_qr'::'git+https://github.com/desktop-app/lib_qr.git'
    'desktop-app.lib_rpl'::'git+https://github.com/desktop-app/lib_rpl.git'
    'desktop-app.lib_spellcheck'::'git+https://github.com/desktop-app/lib_spellcheck.git'
    'desktop-app.lib_storage'::'git+https://github.com/desktop-app/lib_storage.git'
    'desktop-app.lib_tl'::'git+https://github.com/desktop-app/lib_tl.git'
    'desktop-app.lib_webrtc'::'git+https://github.com/desktop-app/lib_webrtc.git'
    'desktop-app.lib_webview'::'git+https://github.com/desktop-app/lib_webview.git'
    'desktop-app.libprisma'::'git+https://github.com/desktop-app/libprisma.git'
    'desktop-app.rlottie'::'git+https://github.com/desktop-app/rlottie.git'
    'ericniebler.range-v3'::'git+https://github.com/ericniebler/range-v3.git'
    'fcitx.fcitx5-qt'::'git+https://github.com/fcitx/fcitx5-qt.git'
    'gitlab-freedesktop-mirrors.wayland'::'git+https://github.com/gitlab-freedesktop-mirrors/wayland.git'
    'gitlab-freedesktop-mirrors.wayland-protocols'::'git+https://github.com/gitlab-freedesktop-mirrors/wayland-protocols.git'
    'google.cld3'::'git+https://github.com/google/cld3.git'
    'hamonikr.nimf'::'git+https://github.com/hamonikr/nimf.git'
    'hime-ime.hime'::'git+https://github.com/hime-ime/hime.git'
    'hunspell'::'git+https://github.com/hunspell/hunspell.git'
    'kde.kcoreaddons'::'git+https://github.com/KDE/kcoreaddons.git'
    'kde.kimageformats'::'git+https://github.com/KDE/kimageformats.git'
    'kde.plasma-wayland-protocols'::'git+https://github.com/KDE/plasma-wayland-protocols.git'
    'kotatogram.cmake_helpers'::'git+https://github.com/kotatogram/cmake_helpers.git'
    'kotatogram.lib_ui'::'git+https://github.com/kotatogram/lib_ui.git'
    'lz4'::'git+https://github.com/lz4/lz4.git'
    'nayuki.qr-code-generator'::'git+https://github.com/nayuki/QR-Code-generator.git'
    'tartanllama.expected'::'git+https://github.com/TartanLlama/expected.git'
    'telegramdesktop.libtgvoip'::'git+https://github.com/telegramdesktop/libtgvoip.git'
    'telegrammessenger.tgcalls'::'git+https://github.com/TelegramMessenger/tgcalls.git'
  )
  sha256sums+=(
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
    'SKIP'
  )

  _prepare_kotatogram_desktop() (
    cd "$srcdir/$_pkgsrc"
    local -A _submodules=(
      ['apple.swift-corelibs-libdispatch']='Telegram/ThirdParty/dispatch'
      ['cyan4973.xxhash']='Telegram/ThirdParty/xxHash'
      ['desktop-app.codegen']='Telegram/codegen'
      ['desktop-app.gsl']='Telegram/ThirdParty/GSL'
      ['desktop-app.lib_base']='Telegram/lib_base'
      ['desktop-app.lib_crl']='Telegram/lib_crl'
      ['desktop-app.lib_lottie']='Telegram/lib_lottie'
      ['desktop-app.lib_qr']='Telegram/lib_qr'
      ['desktop-app.lib_rpl']='Telegram/lib_rpl'
      ['desktop-app.lib_spellcheck']='Telegram/lib_spellcheck'
      ['desktop-app.lib_storage']='Telegram/lib_storage'
      ['desktop-app.lib_tl']='Telegram/lib_tl'
      ['desktop-app.lib_webrtc']='Telegram/lib_webrtc'
      ['desktop-app.lib_webview']='Telegram/lib_webview'
      ['desktop-app.libprisma']='Telegram/ThirdParty/libprisma'
      ['desktop-app.rlottie']='Telegram/ThirdParty/rlottie'
      ['ericniebler.range-v3']='Telegram/ThirdParty/range-v3'
      ['fcitx.fcitx5-qt']='Telegram/ThirdParty/fcitx5-qt'
      ['gitlab-freedesktop-mirrors.wayland']='Telegram/ThirdParty/wayland'
      ['gitlab-freedesktop-mirrors.wayland-protocols']='Telegram/ThirdParty/wayland-protocols'
      ['google.cld3']='Telegram/ThirdParty/cld3'
      ['hamonikr.nimf']='Telegram/ThirdParty/nimf'
      ['hime-ime.hime']='Telegram/ThirdParty/hime'
      ['hunspell']='Telegram/ThirdParty/hunspell'
      ['kde.kcoreaddons']='Telegram/ThirdParty/kcoreaddons'
      ['kde.kimageformats']='Telegram/ThirdParty/kimageformats'
      ['kde.plasma-wayland-protocols']='Telegram/ThirdParty/plasma-wayland-protocols'
      ['kotatogram.cmake_helpers']='cmake'
      ['kotatogram.lib_ui']='Telegram/lib_ui'
      ['lz4']='Telegram/ThirdParty/lz4'
      ['nayuki.qr-code-generator']='Telegram/ThirdParty/QR'
      ['tartanllama.expected']='Telegram/ThirdParty/expected'
      ['telegramdesktop.libtgvoip']='Telegram/ThirdParty/libtgvoip'
      ['telegrammessenger.tgcalls']='Telegram/ThirdParty/tgcalls'
    )
    _submodule_update
  )
}

_source_ericniebler_range_v3() {
  source+=(
    'ericniebler.range-v3'::'git+https://github.com/ericniebler/range-v3.git'
  )
  sha256sums+=(
    'SKIP'
  )

  _prepare_ericniebler_range_v3() (
    cd "$srcdir/$_pkgsrc"
    cd "Telegram/ThirdParty/range-v3"
    local -A _submodules=(
      ['ericniebler.range-v3']='doc/gh-pages'
    )
    _submodule_update
  )
}

_source_telegramdesktop_libtgvoip() {
  source+=(
    'desktop-app.cmake_helpers'::'git+https://github.com/desktop-app/cmake_helpers.git'
  )
  sha256sums+=(
    'SKIP'
  )

  _prepare_telegramdesktop_libtgvoip() (
    cd "$srcdir/$_pkgsrc"
    cd 'Telegram/ThirdParty/libtgvoip'
    local -A _submodules=(
      ['desktop-app.cmake_helpers']='cmake'
    )
    _submodule_update
  )
}

_source_desktop_app_cmake_helpers() {
  source+=(
    'mnauw.cppgir'::'git+https://gitlab.com/mnauw/cppgir.git'
    #'yugr.implib.so'::'git+https://github.com/yugr/Implib.so.git'
  )
  sha256sums+=(
    'SKIP'
    #'SKIP'
  )

  _prepare_desktop_app_cmake_helpers() (
    cd "$srcdir/$_pkgsrc"
    cd "cmake"
    local -A _submodules=(
      ['mnauw.cppgir']='external/glib/cppgir'
      #['yugr.implib.so']='external/Implib.so'
    )
    _submodule_update
  )
}

_source_mnauw_cppgir() {
  source+=(
    'martinmoene.expected-lite'::'git+https://github.com/martinmoene/expected-lite.git'
  )
  sha256sums+=(
    'SKIP'
  )

  _prepare_mnauw_cppgir() (
    cd "$srcdir/$_pkgsrc"
    cd "cmake"
    cd "external/glib/cppgir"
    local -A _submodules=(
      ['martinmoene.expected-lite']='expected-lite'
    )
    _submodule_update
  )
}

# build functions
_build_tg_owt() (
  local _cmake_options=(
    -B "build-tg_owt"
    -S "kotatogram-tg_owt"
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON
    -DBUILD_SHARED_LIBS=OFF
    -DTG_OWT_PACKAGED_BUILD=ON

    -DCMAKE_C_FLAGS="${CFLAGS} -ffat-lto-objects"
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -ffat-lto-objects -I/usr/include/libdrm"
  )

  cmake "${_cmake_options[@]}"
  cmake --build "build-tg_owt"
)

_build_kotatogram() (
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX="/usr"
    -DTDESKTOP_API_TEST=ON
  )

  if [[ "${_build_tg_owt::1}" == "t" ]] ; then
    _cmake_options+=(-Dtg_owt_DIR="$srcdir/build-tg_owt")
  fi

  cmake "${_cmake_options[@]}"
  cmake --build build
)

# common functions
pkgver() {
  cd "$_pkgsrc"
  local _version="1.$(sed -E 's@^[^0-9]+@@' <<< "$_branch")"
  local _commit=$(git cherry origin/dev -v | head -n 1 | cut -d' ' -f2)
  local _revision=$(git rev-list --count --cherry-pick $_commit...HEAD)
  local _hash=$(git rev-parse --short=7 HEAD)

  printf '%s.r%s.g%s' "$_version" "$_revision" "$_hash"
}

prepare() {
  _submodule_update() {
    local key;
    for key in ${!_submodules[@]} ; do
      git submodule init "${_submodules[${key}]}"
      git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
      git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
    done
  }

  apply-patch() {
    printf '\nApplying patch %s\n' "$1"
    patch -Np1 -F100 -i "$1"
  }

  if [[ "${_build_tg_owt::1}" == "t" ]] ; then
    _prepare_kotatogram_tg_owt
  fi

  _prepare_kotatogram_desktop
  _prepare_ericniebler_range_v3
  _prepare_telegramdesktop_libtgvoip

  _prepare_desktop_app_cmake_helpers
  _prepare_mnauw_cppgir
}

build() {
  export CXXFLAGS+=" -Wp,-U_GLIBCXX_ASSERTIONS"
  export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig' # force build with ffmpeg4.4

  if [[ "${_build_tg_owt::1}" == "t" ]] ; then
    _build_tg_owt
  fi

  _build_kotatogram
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# execute
_main_package
