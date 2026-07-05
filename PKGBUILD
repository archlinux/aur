# Maintainer:

## options
: ${_use_sodeps:=false}
: ${_build_tg_owt:=false}

: ${_commit=}

_pkgname="telegram-desktop"
pkgname="$_pkgname-git"
pkgver=6.9.4.r2.gc14efc2
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
  qt6-imageformats
  qt6-svg
  qt6-wayland
  rnnoise
  xxhash

  ## for libtg_owt
  libpipewire
  libxcomposite
  libxrandr
  libxtst
)
makedepends=(
  boost
  boost-libs # static link
  cmake
  extra-cmake-modules
  fmt
  git
  glib2-devel
  gobject-introspection
  jemalloc # gio error when absent
  libtg_owt
  ninja
  qt6-shadertools
  range-v3
  tl-expected
)
optdepends=(
  'webkit2gtk: embedded browser features'
  'xdg-desktop-portal: desktop integration'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!lto')

_source_telegram() {
  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git${_commit:+#commit=$_commit}")
  sha256sums=('SKIP')

  _prepare_telegram() (
    echo "Preparing telegram..."
    cd "$_pkgsrc"
    git rm -r 'Telegram/ThirdParty/hunspell'
    git rm -r 'Telegram/ThirdParty/kcoreaddons'
    git rm -r 'Telegram/ThirdParty/lz4'
    git rm -r 'Telegram/ThirdParty/range-v3'
    git submodule update --init --recursive --depth=1

    local src
    for src in "${source[@]}"; do
      src="${src%%::*}"
      src="${src##*/}"
      src="${src%.zst}"
      if [[ $src == *.patch ]]; then
        printf '\nApplying patch: %s\n' "$src"
        patch -Np1 -F100 -i "${srcdir:?}/$src"
      fi
    done
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
      -DTDESKTOP_API_ID=611335
      -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c
      -DDESKTOP_APP_USE_PACKAGED_FONTS=OFF
      -Dtg_owt_DIR="$srcdir/build_tg_owt"
      -Wno-dev
    )

    cmake "${_cmake_options[@]}"
    cmake --build build
  )
}

_source_tg_owt() {
  makedepends+=(
    yasm
  )

  _pkgsrc_tgowt="telegram-tg_owt"
  source+=("$_pkgsrc_tgowt"::"git+https://github.com/desktop-app/tg_owt.git")
  sha256sums+=('SKIP')

  _prepare_tg_owt() (
    echo "Preparing tg_owt..."
    cd "$_pkgsrc_tgowt"
    git submodule update --init --recursive --depth=1
  )

  _build_tg_owt() (
    export CXXFLAGS+=" -include cstdint"

    echo "Building tg_owt..."
    local _cmake_tg_owt=(
      -B "build_tg_owt"
      -S "$_pkgsrc_tgowt"
      -G Ninja
      -DCMAKE_BUILD_TYPE=None
      -DTG_OWT_PACKAGED_BUILD=ON
      -DBUILD_SHARED_LIBS=OFF
      -Wno-dev
    )

    cmake "${_cmake_tg_owt[@]}"
    cmake --build "build_tg_owt"
  )
}

_source_tdlib() {
  makedepends+=('gperf')

  _pkgsrc_tdlib="telegram-tdlib"
  source+=("$_pkgsrc_tdlib"::"git+https://github.com/tdlib/td.git")
  sha256sums+=('SKIP')

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
}

_source_telegram
_source_tdlib

if [[ "${_build_tg_owt::1}" == "t" ]]; then
  _source_tg_owt
fi

prepare() {
  _prepare_telegram

  if [[ "${_build_tg_owt::1}" == "t" ]]; then
    _prepare_tg_owt
  fi
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]+//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  if [[ "${_build_tg_owt::1}" == "t" ]]; then
    _build_tg_owt
  fi

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
      'libheif.so'
      'libjpeg.so'
      'libjxl.so'
      'libjxl_threads.so'
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
      'libxkbcommon.so'
      'libxxhash.so'
      'libz.so'
    )"
  fi

  DESTDIR="$pkgdir" cmake --install build
}
