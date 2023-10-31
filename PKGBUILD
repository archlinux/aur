# Maintainer:
# Contributor: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: 3Jl0y_PYCCKUi <3jl0y_pycckui@riseup.net>
# Contributor: solopasha <daron439 at gmail dot com>
# Contributor: Ilya Fedin <fedin-ilja2010@ya.ru>
# Contributor: Auteiy <dmitry@auteiy.me>

_pkgname="kotatogram-desktop"
pkgname="$_pkgname-git"
pkgver=1.4.9.r2.g52b300cb3
pkgrel=1
pkgdesc='Experimental fork of Telegram Desktop'
url="https://github.com/kotatogram/kotatogram-desktop"
license=('GPL3')
arch=('x86_64')

depends=(
  # 'qt6-5compat'
  # 'qt6-imageformats'
  # 'qt6-svg'
  # 'qt6-wayland'
  'abseil-cpp'
  'ffmpeg4.4'
  'gcc-libs'
  'glib2'
  'glibc'
  'glibmm'
  'hicolor-icon-theme'
  'hunspell'
  'jemalloc'
  'kwayland5'
  'libdispatch'
  'libjpeg-turbo'
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
  'openssl-1.1'
  'opus'
  'pipewire'
  'qt5-imageformats'
  'qt5-svg'
  'qt5-wayland'
  'rnnoise'
  'ttf-opensans'
  'wayland'
  'xcb-util-keysyms'
  'xxhash'
  'zlib'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'git'
  'meson'
  'microsoft-gsl'
  'ninja'
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

_tg_owt_commit=63a934db1ed212ebf8aaaa20f0010dd7b0d7b396

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git#branch=dev"
  "$_pkgname-tg_owt"::"git+https://github.com/desktop-app/tg_owt.git#commit=${_tg_owt_commit}"

  "include.patch"
  "kf594.patch"
  "https://patch-diff.githubusercontent.com/raw/kotatogram/kotatogram-desktop/pull/326.patch"
  "https://patch-diff.githubusercontent.com/raw/kotatogram/kotatogram-desktop/pull/333.patch"
  "https://patch-diff.githubusercontent.com/raw/kotatogram/kotatogram-desktop/pull/334.patch"
  "https://patch-diff.githubusercontent.com/raw/kotatogram/kotatogram-desktop/pull/335.patch"
  "https://patch-diff.githubusercontent.com/raw/kotatogram/kotatogram-desktop/pull/337.patch"

  "https://patch-diff.githubusercontent.com/raw/desktop-app/tg_owt/pull/101.patch"
  "tg_owt-fix.patch"

  "0001-Add-an-option-to-hide-messages-from-blocked-users-in.patch"
  "0002-Block-sponsored_messages.patch"
  "0003-Allow-downloading-and-copying-from-restricted-channels.patch"
)

sha256sums=(
  'SKIP'
  'SKIP'

  '133cde2fb9e1b5f837396e487783adf5e1899e20d335f1654a71e6ef1121918c'
  '25160a4a687b0032151f5c7a295996e4322b5c9ed1122dfa6c3985d57e866b2c'
  '289b69c980fe4877ab94d3b68180e586ffabecd15c4205f008fe21498d12f7ee'
  'd27016d67bd0baf5eb7c49ce1a0658e584d3892c344edde38843ca39a1d63a42'
  '533576f87db701100b2fda4b4ccbbb9957234d86447960a7c6b1dd07c8830d19'
  '26bd7d7e683dbf8d3fc7675afafac3fa3a140c21ca9087c8c98241a9041b981c'
  'b794229b2b2cec355219fe6d33dba1efd782dc9ad53c50ab90f5f682db370bea'
  'f4d26c1048a7fd1ac3419042009c3b52c001458e44309a765d42d7df9f45f1ef'
  '8d3a1c4b2e40eef7a4cc8e6f498c416af47a91b878ec3762b51476e89695cb13'
  '639b0b659685ff11daee21efd0ca0e473ee1cfb533709ea8ecf357945e058f43'
  '229c85f7fe86c11139b4d6b4fd44086d737e25ac94c89302aabe09eedb436f7e'
  'bb2aa0ec20d9769a513a41033a7f00baf08afd7a40c710431576d0f8b3a27a0e'
)

_pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags | sed 's/^k//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  apply-patch() {
    printf '\nApplying patch %s\n' "$1"
    patch -Np1 -F100 -i "$1"
  }

  cd "${srcdir:?}/$_pkgsrc"
  git submodule update --init --recursive --depth 1

  apply-patch "${srcdir:?}/kf594.patch"
  apply-patch "${srcdir:?}/326.patch"
  apply-patch "${srcdir:?}/333.patch"
  apply-patch "${srcdir:?}/334.patch"
  apply-patch "${srcdir:?}/335.patch"
  apply-patch "${srcdir:?}/337.patch"

  apply-patch "${srcdir:?}/0001-Add-an-option-to-hide-messages-from-blocked-users-in.patch"
  apply-patch "${srcdir:?}/0002-Block-sponsored_messages.patch"
  apply-patch "${srcdir:?}/0003-Allow-downloading-and-copying-from-restricted-channels.patch"

  cd "${srcdir:?}/$_pkgname-tg_owt"
  git submodule update --init --recursive --depth 1

  apply-patch "${srcdir:?}/101.patch"
  # apply-patch "${srcdir:?}/include.patch"
  apply-patch "${srcdir:?}/tg_owt-fix.patch"
}

_build_tg_owt() (
  cd "${srcdir:?}/$_pkgname-tg_owt"

  cmake .\
    -B build \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DBUILD_SHARED_LIBS=OFF \
    -DTG_OWT_PACKAGED_BUILD=ON

  CFLAGS+=" -ffat-lto-objects" CXXFLAGS+=" -ffat-lto-objects -I/usr/include/libdrm" cmake --build build
)

_build_kotatogram() (
  cd "${srcdir:?}/$_pkgsrc"
  cmake . \
    -B build \
    -G Ninja  \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_BUILD_TYPE=Release \
    -DTDESKTOP_API_TEST=ON \
    -Dtg_owt_DIR="${srcdir:?}/${_pkgname}-tg_owt/build" \
    -DDESKTOP_APP_QT6=OFF

  cmake --build build
)

build() {
  export CXXFLAGS+=" -Wp,-U_GLIBCXX_ASSERTIONS"
  export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig' # force build with ffmpeg4.4

  _build_tg_owt
  _build_kotatogram
}

package() {
  cd "$_pkgsrc"
  DESTDIR="${pkgdir:?}" cmake --install build
}
