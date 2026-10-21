# Maintainer: aur.chaotic.cx
# Contributor: Peter Jung ptr1337 <admin@ptr1337.dev>
# Contributor: SoulHarsh007 <admin@soulharsh007.dev>
# Contributor: MedzikUser <nivua1fn@duck.com>

# prevent excessive memory usage
export DEBUG_CFLAGS="-g1"
export DEBUG_CXXFLAGS="-g1"

## options
: ${_use_sodeps:=false}

: ${_wallet_engine_ver:=0.0.7}
: ${_wallet_engine_patch_commit:=82ed0c85bc1a1399a66b75ca7a978799c507e2ba}

_pkgname="forkgram"
pkgname="$_pkgname"
pkgver=7.3.2
pkgrel=1
pkgdesc="Fork of the Telegram Desktop messaging app"
url="https://github.com/Forkgram/tdesktop"
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

options=('!lto')

_pkgsrc="frk-v$pkgver-full"
_pkgsrc_tdlib="telegram-tdlib"
_pkgsrc_wallet_engine="wallet-engine-${_wallet_engine_ver}"
_wallet_engine_patch="wallet-engine-${_wallet_engine_patch_commit::7}.patch"
_pkgext="tar.gz"
source=(
  "$_pkgname-$pkgver.$_pkgext"::"$url/releases/download/v$pkgver/$_pkgsrc.$_pkgext"
  "$_pkgsrc_tdlib"::"git+https://github.com/tdlib/td.git"
  "$_pkgsrc_wallet_engine.$_pkgext"::"https://github.com/i582/wallet-engine/archive/refs/tags/v${_wallet_engine_ver}.$_pkgext"
  "$_wallet_engine_patch"::"https://github.com/desktop-app/patches/raw/$_wallet_engine_patch_commit/wallet-engine.patch"
)
sha256sums=('77b78ca11aa88277cd73ac4fe991c821959c5a25ab770fde93e72228b5174639'
  'SKIP'
  '96600a6f393a27a0f84a41ad1d6d69f96014edc29e4d907c05e965666b0a66cf'
  'b40aba82c39a42d0526a85ecfa40d613baa57b1a2d6600e601a42a1576b3b822')

prepare() {
  # fix cmake patching for non-git sources
  sed -E -e 's& AND EXISTS \$\{_dir\}/\.git&&' -i "$_pkgsrc"/CMakeLists.txt

  # drop broken patch
  rm "$_pkgsrc"/patches/cmake_ffmpeg_heif.patch || :

  # wallet-engine
  patch -d "$_pkgsrc_wallet_engine" -Np1 -F100 -i "$srcdir/$_wallet_engine_patch"
}

build() {
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

  echo "Building forkgram..."
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
