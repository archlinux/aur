# Maintainer:
# Contributor: Térence Clastres <t.clastres@gmail.com>

: ${_use_sodeps:=false}

_pkgname="giada"
pkgname="$_pkgname-git"
pkgver=1.5.0.r20.g32bfe7c
pkgrel=1
pkgdesc="A free, minimal, hardcore audio tool for DJs, live performers and electronic musicians"
url="https://github.com/monocasual/giada"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'alsa-lib'
  'fmt'
  'jack'
  'libpulse'
  'libsamplerate'
  'libsndfile'
  'libx11'
  'libxcursor'
  'libxft'
  'libxinerama'
  'rtmidi'
  'rubberband'
)
makedepends=(
  'cmake'
  'git'
  'ninja'

  'catch2'
  'libgl'
  'libxpm'
  'libxrandr'
  'nlohmann-json'
)

provides=("$_pkgname" 'vst3-host')
conflicts=("$_pkgname")

options=('!emptydirs' '!staticlibs')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"
  git submodule update --init --recursive --depth=1
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() (
  # monocasual/giada/issues/806
  CXXFLAGS+=' -DFMT_DEPRECATED_HEAVY_CORE'

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-author

    -DWITH_TESTS=ON
    -DWITH_VST2=OFF
    -DWITH_VST3=ON
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
)

check() {
  ./build/giada --run-tests
}

package() {
  depends+=(
    'hicolor-icon-theme'
    'python'
  )

  if [[ "${_use_deps::1}" == "t" ]]; then
    eval "depends+=(
      'libasound.so'
      'libfmt.so'
      'libfontconfig.so'
      'libfreetype.so'
      'libjack.so'
      'libpulse-simple.so'
      'libpulse.so'
      'librtmidi.so'
      'librubberband.so'
      'libsamplerate.so'
      'libsndfile.so'
      'libz.so'
    )"
  fi

  DESTDIR="$pkgdir" cmake --install build

  rm -rf "$pkgdir/usr/include/FL/"
  find "$pkgdir/" -iname "*fltk*" -delete
}
