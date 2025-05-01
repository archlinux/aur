# Maintainer:
# Contributor: Térence Clastres <t.clastres@gmail.com>

_pkgname="giada"
pkgname="$_pkgname-git"
pkgver=1.2.0.r4.g55b2e7b
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
)
makedepends=(
  'catch2-v2'
  'cmake'
  'git'
  'imagemagick'
  'libgl'
  'libxpm'
  'libxrandr'
  'ninja'
  'nlohmann-json'
  'vst3sdk'
)

provides=('vst3-host')
conflicts=('giada' 'giada-vst')

options=('!emptydirs' '!staticlibs')

_source_main() {
  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git")
  sha256sums=('SKIP')
}

_source_giada() {
  local _sources_add=(
    'cameron314.concurrentqueue'::'git+https://github.com/cameron314/concurrentqueue.git'
    'fltk'::'git+https://github.com/fltk/fltk.git'
    'juce-framework.juce'::'git+https://github.com/juce-framework/JUCE.git'
    'monocasual.geompp'::'git+https://github.com/monocasual/geompp.git'
    'monocasual.mcl-atomic-swapper'::'git+https://github.com/monocasual/mcl-atomic-swapper.git'
    'monocasual.mcl-audio-buffer'::'git+https://github.com/monocasual/mcl-audio-buffer.git'
    #'monocasual.rtaudio'::'git+https://github.com/monocasual/rtaudio.git'
    #'steinbergmedia.vst3sdk'::'git+https://github.com/steinbergmedia/vst3sdk.git'
  )

  local _p
  for _p in ${_sources_add[@]}; do
    source+=("$_p")
    sha256sums+=('SKIP')
  done

  _prepare_giada() (
    cd "$srcdir/$_pkgsrc"
    local _submodules=(
      'cameron314.concurrentqueue'::'src/deps/concurrentqueue'
      'fltk'::'src/deps/fltk'
      'juce-framework.juce'::'src/deps/juce'
      'monocasual.geompp'::'src/deps/geompp'
      'monocasual.mcl-atomic-swapper'::'src/deps/mcl-atomic-swapper'
      'monocasual.mcl-audio-buffer'::'src/deps/mcl-audio-buffer'
      #'monocasual.rtaudio'::'src/deps/rtaudio'
      #'steinbergmedia.vst3sdk'::'src/deps/vst3sdk'
    )
    _submodule_update

    # out of tree
    git submodule update --init src/deps/rtaudio
  )
}

_source_main
_source_giada

prepare() {
  _submodule_update() {
    local _module
    for _module in "${_submodules[@]}"; do
      git submodule init "${_module##*::}"
      git submodule set-url "${_module##*::}" "$srcdir/${_module%%::*}"
      git -c protocol.file.allow=always submodule update "${_module##*::}"
    done
  }
  _prepare_giada
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() (
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DWITH_VST2=OFF
    -DWITH_VST3=ON
    -DWITH_TESTS=ON
    -Wno-dev
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

  DESTDIR="$pkgdir" cmake --install build

  rm -rf "$pkgdir/usr/include/FL/"
  find "$pkgdir/" -iname "*fltk*" -delete
}
