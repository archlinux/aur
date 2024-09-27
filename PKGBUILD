# Maintainer:
# Contributor: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: 3Jl0y_PYCCKUi <3jl0y_pycckui@riseup.net>
# Contributor: solopasha <daron439 at gmail dot com>
# Contributor: Ilya Fedin <fedin-ilja2010@ya.ru>
# Contributor: Auteiy <dmitry@auteiy.me>

## options
: ${_branch=dev}

# basic info
_pkgname="kotatogram-desktop"
pkgname="$_pkgname-git"
pkgver=1.5.0.4.r1004.ge30c185
pkgrel=2
pkgdesc='Experimental fork of Telegram Desktop'
url="https://github.com/kotatogram/kotatogram-desktop"
license=('GPL-3.0-only')
arch=('x86_64')

depends=(
  'abseil-cpp'
  'ffmpeg'
  'glib2'
  'hunspell'
  'jemalloc'
  'kcoreaddons'
  'kimageformats'
  'libdispatch'
  'libjpeg.so' # 'libjpeg-turbo'
  'libpipewire'
  'libprotobuf-lite.so' # protobuf
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
  'glib2-devel'
  'gobject-introspection'
  'meson'
  'ninja'
  'pipewire'
  'plasma-wayland-protocols'
  'python'
  'python-packaging'
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

_source_main() {
  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git#branch=$_branch")
  sha256sums=('SKIP')

  _patch_commit='b1060b9deef05a3efaadf61d3e99dafa155710ea'
  source+=("tg-5.5.5-fix_build_with_cppgir-${_patch_commit::7}.patch"::"https://gitlab.archlinux.org/archlinux/packaging/packages/telegram-desktop/-/raw/$_patch_commit/telegram-desktop-5_5_5-fix_build_with_cppgir.patch")
  sha256sums+=('ee54bdf8fe67c8fadfffc794763fc62f4c6a15eb535c80ba7b1b74d6ec178882')

  _prepare_main() (
    cd "$srcdir/$_pkgsrc/cmake/external/glib/cppgir"
    apply-patch "$srcdir/tg-5.5.5-fix_build_with_cppgir-${_patch_commit::7}.patch"
  )
}

_source_kotatogram_tg_owt() {
  source+=(
    "kotatogram-tg_owt"::"git+https://github.com/desktop-app/tg_owt.git"
    "libtg_owt_ffmpeg7.patch"::"https://patch-diff.githubusercontent.com/raw/desktop-app/tg_owt/pull/128.patch"

    # submodules
    'abseil.abseil-cpp'::'git+https://github.com/abseil/abseil-cpp.git'
    'chromiumsrc.libyuv'::'git+https://gitlab.com/chromiumsrc/libyuv.git'
    'cisco.libsrtp'::'git+https://github.com/cisco/libsrtp.git'
    'google.crc32c'::'git+https://github.com/google/crc32c.git'
  )
  sha256sums+=(
    'SKIP'
    'b059d0a257b8aadeb8116f8b207820dafbb25139c8767e4ff1689ef2ebf40865'

    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
  )

  _prepare_kotatogram_tg_owt() (
    cd "$srcdir/kotatogram-tg_owt"

    local _tg_owt_commit=$(grep -A1 'cd tg_owt' "$srcdir/$_pkgsrc/Telegram/build/prepare/prepare.py" | grep -Pom1 '(?<=git checkout )[a-f0-9]+')
    git -c advice.detachedHead=false checkout -f "$_tg_owt_commit"

    local _submodules=(
      'abseil.abseil-cpp'::'src/third_party/abseil-cpp'
      'chromiumsrc.libyuv'::'src/third_party/libyuv'
      'cisco.libsrtp'::'src/third_party/libsrtp'
      'google.crc32c'::'src/third_party/crc32c/src'
    )
    _submodule_update

    apply-patch ../libtg_owt_ffmpeg7.patch
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
    #'ericniebler.range-v3'::'git+https://github.com/ericniebler/range-v3.git'
    'fcitx.fcitx5-qt'::'git+https://github.com/fcitx/fcitx5-qt.git'
    'flatpak.xdg-desktop-portal'::'git+https://github.com/flatpak/xdg-desktop-portal.git'
    'google.cld3'::'git+https://github.com/google/cld3.git'
    'hamonikr.nimf'::'git+https://github.com/hamonikr/nimf.git'
    'hime-ime.hime'::'git+https://github.com/hime-ime/hime.git'
    #'hunspell'::'git+https://github.com/hunspell/hunspell.git'
    #'jemalloc'::'git+https://github.com/jemalloc/jemalloc.git'
    #'kde.kcoreaddons'::'git+https://github.com/KDE/kcoreaddons.git'
    #'kde.kimageformats'::'git+https://github.com/KDE/kimageformats.git'
    'kotatogram.cmake_helpers'::'git+https://github.com/kotatogram/cmake_helpers.git'
    'kotatogram.lib_ui'::'git+https://github.com/kotatogram/lib_ui.git'
    #'lz4'::'git+https://github.com/lz4/lz4.git'
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
  )

  _prepare_kotatogram_desktop() (
    cd "$srcdir/$_pkgsrc"
    local _submodules=(
      'apple.swift-corelibs-libdispatch'::'Telegram/ThirdParty/dispatch'
      'cyan4973.xxhash'::'Telegram/ThirdParty/xxHash'
      'desktop-app.codegen'::'Telegram/codegen'
      'desktop-app.gsl'::'Telegram/ThirdParty/GSL'
      'desktop-app.lib_base'::'Telegram/lib_base'
      'desktop-app.lib_crl'::'Telegram/lib_crl'
      'desktop-app.lib_lottie'::'Telegram/lib_lottie'
      'desktop-app.lib_qr'::'Telegram/lib_qr'
      'desktop-app.lib_rpl'::'Telegram/lib_rpl'
      'desktop-app.lib_spellcheck'::'Telegram/lib_spellcheck'
      'desktop-app.lib_storage'::'Telegram/lib_storage'
      'desktop-app.lib_tl'::'Telegram/lib_tl'
      'desktop-app.lib_webrtc'::'Telegram/lib_webrtc'
      'desktop-app.lib_webview'::'Telegram/lib_webview'
      'desktop-app.libprisma'::'Telegram/ThirdParty/libprisma'
      'desktop-app.rlottie'::'Telegram/ThirdParty/rlottie'
      #'ericniebler.range-v3'::'Telegram/ThirdParty/range-v3'
      'fcitx.fcitx5-qt'::'Telegram/ThirdParty/fcitx5-qt'
      'flatpak.xdg-desktop-portal'::'Telegram/ThirdParty/xdg-desktop-portal'
      'google.cld3'::'Telegram/ThirdParty/cld3'
      'hamonikr.nimf'::'Telegram/ThirdParty/nimf'
      'hime-ime.hime'::'Telegram/ThirdParty/hime'
      #'hunspell'::'Telegram/ThirdParty/hunspell'
      #'jemalloc'::'Telegram/ThirdParty/jemalloc'
      #'kde.kcoreaddons'::'Telegram/ThirdParty/kcoreaddons'
      #'kde.kimageformats'::'Telegram/ThirdParty/kimageformats'
      'kotatogram.cmake_helpers'::'cmake'
      'kotatogram.lib_ui'::'Telegram/lib_ui'
      #'lz4'::'Telegram/ThirdParty/lz4'
      'nayuki.qr-code-generator'::'Telegram/ThirdParty/QR'
      'tartanllama.expected'::'Telegram/ThirdParty/expected'
      'telegramdesktop.libtgvoip'::'Telegram/ThirdParty/libtgvoip'
      'telegrammessenger.tgcalls'::'Telegram/ThirdParty/tgcalls'
    )
    _submodule_update

    sed -E -e 's&pkt_duration&duration&' \
      -i Telegram/SourceFiles/ffmpeg/ffmpeg_frame_generator.cpp \
      Telegram/SourceFiles/media/clip/media_clip_ffmpeg.cpp
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
    local _submodules=(
      'desktop-app.cmake_helpers'::'cmake'
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
    local _submodules=(
      'mnauw.cppgir'::'external/glib/cppgir'
      #'yugr.implib.so'::'external/Implib.so'
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
    local _submodules=(
      'martinmoene.expected-lite'::'expected-lite'
    )
    _submodule_update
  )
}

_build_tg_owt() (
  local _cmake_options=(
    -B "build-tg_owt"
    -S "kotatogram-tg_owt"
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DBUILD_SHARED_LIBS=OFF
    -Wno-dev
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
    -Dtg_owt_DIR="$srcdir/build-tg_owt"
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
)

_source_main
_source_kotatogram_desktop
_source_telegramdesktop_libtgvoip

_source_desktop_app_cmake_helpers
_source_mnauw_cppgir

_source_kotatogram_tg_owt

prepare() {
  _submodule_update() {
    local _module
    for _module in "${_submodules[@]}"; do
      git submodule init "${_module##*::}"
      git submodule set-url "${_module##*::}" "$srcdir/${_module%%::*}"
      git -c protocol.file.allow=always submodule update "${_module##*::}"
      echo
    done
  }

  apply-patch() {
    printf '\nApplying patch %s\n' "$1"
    patch -Np1 -F100 -i "$1"
  }

  _prepare_kotatogram_tg_owt

  _prepare_kotatogram_desktop
  _prepare_telegramdesktop_libtgvoip

  _prepare_desktop_app_cmake_helpers
  _prepare_mnauw_cppgir

  _prepare_main
}

pkgver() {
  cd "$_pkgsrc"
  local _regex _file _line _line_num _version _commit _revision _hash

  _regex='^([0-9]+\.[0-9]+\.[0-9]+).*$'
  _file='changelog.txt'

  _line=$(grep -Ev '[A-Za-z]{2}' "$_file" | grep -Esm1 "$_regex")
  _line_num=$(grep -nsm1 "$_line" "$_file" | cut -d':' -f1)

  _version="1.$(sed -E "s@$_regex@\1@" <<< "$_line")"
  _commit=$(git blame -L $_line_num,+1 -- "$_file" | awk '{print $1;}')
  _revision=$(git rev-list --count --cherry-pick "$_commit"...HEAD)
  _hash=$(git rev-parse --short=7 HEAD)

  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_hash:?}"
}

build() {
  export CXXFLAGS+=" -Wp,-U_GLIBCXX_ASSERTIONS -fpermissive"

  _build_tg_owt
  _build_kotatogram
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
