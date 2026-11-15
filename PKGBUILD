# Maintainer:

# prevent excessive memory usage
export DEBUG_CFLAGS="-g1"
export DEBUG_CXXFLAGS="-g1"

## options
: ${_use_sodeps:=false}
: ${_build_tg_owt:=false}

_pkgname="telegram-desktop"
pkgname="$_pkgname-git"
pkgver=7.4.4.r0.gbf4f714
pkgrel=1
pkgdesc='Official Telegram Desktop client'
url="https://github.com/telegramdesktop/tdesktop"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  abseil-cpp
  ada
  ffmpeg
  hunspell
  kcoreaddons
  libavif
  libfido2
  libheif
  libjxl
  libsrtp
  libvpx
  libxdamage
  minizip
  openal
  openh264
  opus
  qt6-base
  qt6-imageformats
  qt6-svg
  qt6-wayland
  rnnoise
  tlottie
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
  cargo      # for wallet-engine
  cmake
  extra-cmake-modules
  fmt
  git
  glib2-devel
  gobject-introspection
  gperf    # for tde2e
  jemalloc # gio error when absent
  just     # for wallet-engine
  libtg_owt
  ninja
  qt6-shadertools
  range-v3
  tl-expected
  vulkan-headers
)
optdepends=(
  'webkit2gtk: embedded browser features'
  'xdg-desktop-portal: desktop integration'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!lto')

_pkgsrc="$_pkgname"
_pkgsrc_tdlib="telegram-tdlib"
_pkgsrc_wallet_engine="wallet-engine"
_wallet_engine_patch="wallet-engine-$(\date "+%Y%m%d").patch"

source=(
  "$_pkgsrc"::"git+$url.git"
  "$_pkgsrc_tdlib"::"git+https://github.com/tdlib/td.git"
  "$_pkgsrc_wallet_engine"::"git+https://github.com/i582/wallet-engine.git"
  "$_wallet_engine_patch"::"https://github.com/desktop-app/patches/raw/refs/heads/master/wallet-engine.patch"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

_source_tg_owt() {
  if [[ "${_build_tg_owt::1}" != "t" ]]; then
    return
  fi

  makedepends+=(yasm)

  _pkgsrc_tgowt="telegram-tg_owt"
  source+=("$_pkgsrc_tgowt"::"git+https://github.com/desktop-app/tg_owt.git")
  sha256sums+=('SKIP')
}

_prepare_tg_owt() (
  if [[ "${_build_tg_owt::1}" != "t" ]]; then
    return
  fi

  echo "Preparing tg_owt..."
  git -C "$_pkgsrc_tgowt" submodule update --init --recursive --depth=1
)

_build_tg_owt() (
  if [[ "${_build_tg_owt::1}" != "t" ]]; then
    return
  fi

  export CXXFLAGS+=" -include cstdint"

  echo "Building tg_owt..."
  local _cmake_tg_owt=(
    -B "build_tg_owt"
    -S "$_pkgsrc_tgowt"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DTG_OWT_PACKAGED_BUILD=ON
    -DBUILD_SHARED_LIBS=OFF
    -Wno-author
  )

  cmake "${_cmake_tg_owt[@]}"
  cmake --build "build_tg_owt"
)

_source_tg_owt

prepare() {
  _prepare_tg_owt

  # wallet-engine
  patch -d "$_pkgsrc_wallet_engine" -Np1 -F100 -i "$srcdir/$_wallet_engine_patch"

  echo "Preparing telegram..."
  cd "$_pkgsrc"
  git rm -r 'Telegram/ThirdParty/hunspell'
  git rm -r 'Telegram/ThirdParty/kcoreaddons'
  git rm -r 'Telegram/ThirdParty/lz4'
  git rm -r 'Telegram/ThirdParty/range-v3'
  git submodule update --init --recursive --depth=1
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]+//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  _build_tg_owt

  echo "Building wallet engine..."
  pushd "$_pkgsrc_wallet_engine" &> /dev/null
  just build
  just bindings-cpp
  install -Dm644 target/release/libwallet_engine.a -t "$srcdir/deps/usr/lib/"
  install -Dm644 bindings/cpp-experimental/* -t "$srcdir/deps/usr/include/wallet_engine/"
  popd &> /dev/null

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
    -Wno-author
  )

  cmake "${_cmake_tde2e[@]}"
  cmake --build "build_tde2e"
  DESTDIR="$srcdir/deps" cmake --install "build_tde2e"

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
    -Wno-author
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  if [[ "${_use_sodeps::1}" == "t" ]]; then
    eval "depends+=(
      'libavcodec.so'
      'libavfilter.so'
      'libavformat.so'
      'libavutil.so'
      'libcairo.so'
      'libcrypto.so'
      'libfido2.so'
      'libfontconfig.so'
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
      'libpango-1.0.so'
      'libpangocairo-1.0.so'
      'libpangoft2-1.0.so'
      'libpipewire-0.3.so'
      'libsrtp2.so'
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
