# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=dsp56300-emulator
pkgname=(
  dsp56300-emulator-clap
  dsp56300-emulator-lv2
  dsp56300-emulator-vst3
)
pkgver=2.2.16
pkgrel=1
pkgdesc='Emulates musical devices that used the Motorola 56300 DSPs'
arch=(x86_64)
url='https://github.com/dsp56300/gearmulator'
license=(GPL-3.0-only)
_common_depends=(
  glibc
  freetype2
  alsa-lib
  libglvnd
)
makedepends=(
  "${_common_depends[@]}"
  git
  cmake
  libx11
  libxext
  libxrandr
  libxinerama
  libxcursor
  libxcomposite
  mesa
  mold
  ninja
  freeglut
  webkit2gtk-4.1
)
options=(!debug)
source=(
  "$pkgbase::git+$url#tag=$pkgver"
  'github.com-dsp56300-dsp56300::git+https://github.com/dsp56300/dsp56300'
  'github.com-dsp56300-JUCE::git+https://github.com/dsp56300/JUCE'
  'github.com-asmjit-asmjit::git+https://github.com/asmjit/asmjit'
  'github.com-free-audio-clap::git+https://github.com/free-audio/clap'
  'github.com-free-audio-clap-helpers::git+https://github.com/free-audio/clap-helpers'
  'github.com-free-audio-clap-juce-extensions::git+https://github.com/free-audio/clap-juce-extensions'
  'github.com-dsp56300-mc68k::git+https://github.com/dsp56300/mc68k'
  'github.com-dsp56300-RmlUi::git+https://github.com/dsp56300/RmlUi'
  'github.com-freetype-freetype::git+https://github.com/freetype/freetype'
  'github.com-sammycage-lunasvg::git+https://github.com/sammycage/lunasvg'
  'github.com-sammycage-plutovg::git+https://github.com/sammycage/plutovg'
  skip-cpack.patch
  skip-tests.patch
)
sha512sums=('5ffdf3627dd321b25415882f82b15ef40b9a0357485a70da1f9021b8eea804bd71b3b9930aaaff3a98b5fcc7c48c14eb635ff575aa83fc40086f7cfcb6f44d60'
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
            'cffb28917c78574f5b019414003da6fe0e7dd0c2a7d273f6e5392f2cd4e2d727cf0837faaf45fd875e6f061cb919b1f32301f1e7a30b616dff60489b28ac6c18'
            'a636fab23770e16ba5597dfae9331ad354234f4f1e2e419a7b43b2180e6928894ab505d606fa28e694632decf6651e79dd2e809600a2b328b64335e62cfae9ef')
b2sums=('ec54824ed381b8bf210fc8d3217974bde4b80a00bec920f3a4bdbc3c94fc88684b12f70bb6bc5cc6a82689efaee24fc42e48a6630df65e559cdffe3751d8d377'
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
        '9c1900984ea3308b86e4ce6503f3e8f46c85d43eb83c4c4a13d37a357b92a1f3ccf3a0ddfbfa675d7b08c065104c325dbc9e2bc2440fec58049f6049784408f5'
        'c6b9f758e6ddadf41bdf41874dc92e6f7123b84bb532cdc1c52dde81305404aa0f9f68b7eded082f59144e48f600e236f55114e9e1f6359a6cd38d59be2db7e3')

prepare() {
  cd "$pkgbase"

  # prepare git submodules (skip cpp-terminal)
  git submodule init \
    source/cpu/dsp56300 \
    source/3rdparty/JUCE \
    source/cpu/mc68k \
    source/3rdparty/clap-juce-extensions \
    source/3rdparty/RmlUi \
    source/3rdparty/freetype \
    source/3rdparty/lunasvg

  git config submodule.source/cpu/dsp56300.url "$srcdir/github.com-dsp56300-dsp56300"
  git config submodule.source/3rdparty/JUCE.url "$srcdir/github.com-dsp56300-JUCE"
  git config submodule.source/3rdparty/clap-juce-extensions.url "$srcdir/github.com-free-audio-clap-juce-extensions"
  git config submodule.source/cpu/mc68k.url "$srcdir/github.com-dsp56300-mc68k"
  git config submodule.source/3rdparty/RmlUi.url "$srcdir/github.com-dsp56300-RmlUi"
  git config submodule.source/3rdparty/freetype.url "$srcdir/github.com-freetype-freetype"
  git config submodule.source/3rdparty/lunasvg.url "$srcdir/github.com-sammycage-lunasvg"
  git -c protocol.file.allow=always submodule update

  # setup git submodules for clap-juce-extensions
  pushd source/3rdparty/clap-juce-extensions
  git submodule init
  git config submodule.clap-libs/clap.url "$srcdir/github.com-free-audio-clap"
  git config submodule.clap-libs/clap-helpers.url "$srcdir/github.com-free-audio-clap-helpers"
  git -c protocol.file.allow=always submodule update
  popd

  # setup git submodules for dsp56300
  pushd source/cpu/dsp56300
  git submodule init
  git config submodule.source/asmjit.url "$srcdir/github.com-asmjit-asmjit"
  git -c protocol.file.allow=always submodule update
  popd

  # setup git submodules for lunasvg
  pushd source/3rdparty/lunasvg
  git submodule init
  git config submodule.plutovg.url "$srcdir/github.com-sammycage-plutovg"
  git -c protocol.file.allow=always submodule update
  popd

  # skip upstream's use of cpack
  patch -p1 -i "$srcdir/skip-cpack.patch"

  # skip tests (only useful for development, reduces compile time by a *lot*)
  patch -p1 -i "$srcdir/skip-tests.patch"
}

build() {
  local cmake_options=(
    -S "$pkgbase"
    -B build
    -G Ninja
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_LINKER_TYPE=MOLD
    -W no-author
    -D gearmulator_BUILD_JUCEPLUGIN=ON
    -D gearmulator_BUILD_JUCEPLUGIN_VST2=OFF
    -D gearmulator_BUILD_JUCEPLUGIN_VST3=ON
    -D gearmulator_BUILD_JUCEPLUGIN_CLAP=ON
    -D gearmulator_BUILD_JUCEPLUGIN_LV2=ON
    -D gearmulator_BUILD_JUCEPLUGIN_AU=OFF
    -D gearmulator_BUILD_JUCEPLUGIN_Standalone=OFF
    -D gearmulator_BUILD_FX_PLUGIN=ON
    -D gearmulator_SYNTH_OSIRUS=ON
    -D gearmulator_SYNTH_OSTIRUS=ON
    -D gearmulator_SYNTH_VAVRA=ON
    -D gearmulator_SYNTH_XENIA=ON
    -D gearmulator_SYNTH_NODALRED2X=ON
    -D gearmulator_SYNTH_JE8086=ON
  )

  cmake "${cmake_options[@]}"

  cmake --build build --config Release

  mkdir install
  DESTDIR=$(pwd)/install cmake --install build 
}

package_dsp56300-emulator-clap() {
  pkgdesc+=' - CLAP plugins'
  groups=(pro-audio clap-plugins)
  depends=(
    "${_common_depends[@]}"
    clap-host
  )

  # install required directory
  install -vd "$pkgdir/usr/lib/clap"

  mv install/usr/lib/clap/* "$pkgdir/usr/lib/clap"
}

package_dsp56300-emulator-lv2() {
  pkgdesc+=' - LV2 plugins'
  groups=(pro-audio lv2-plugins)
  depends=(
    "${_common_depends[@]}"
    lv2-host
  )

  # install required directory
  install -vd "$pkgdir/usr/lib/lv2"

  mv install/usr/lib/lv2/* "$pkgdir/usr/lib/lv2"
}

package_dsp56300-emulator-vst3() {
  pkgdesc+=' - VST3 plugins'
  groups=(pro-audio vst3-plugins)
  depends=(
    "${_common_depends[@]}"
    vst3-host
  )

  # install required directory
  install -vd "$pkgdir/usr/lib/vst3"

  mv install/usr/lib/vst3/* "$pkgdir/usr/lib/vst3"
}
