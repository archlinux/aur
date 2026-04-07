# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=dsp56300-emulator
pkgname=(
  dsp56300-emulator-clap
  dsp56300-emulator-lv2
  dsp56300-emulator-vst3
)
pkgver=2.2.3
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
  skip-cpack.patch
  skip-tests.patch
)
sha512sums=('a2f00c1220b7af1314b1c66c8e0b9d237fdea4acf2d313da682ddf5fdafa07ce3cf62d9720666abcbb1029d9b237b6c1ebe0bd0690a9792aa83151576c1e2321'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'f4d862a6a46a1eec9be00fb6a48f80875e9ece1ff1a3deb6bb21c4a7a297dee1db178276f456eac21f1ffdea15b591b1bb8030731cebe081d3086aa12a2ffe37'
            '8107dbd04953146aac91f5cacae77837ec8e99bebde069e1672a18f171e71751fbfe3b8194620d7ba4926974fcc7fc36b6e0fd71544c7ee00dc103d1c06afedc')
b2sums=('077e5ecadafcade1e66b6d4eab9a38bf01513437571eb34696d47a73d45137aac78b067b892875b65419c99788446488ac3bc45a4d15eed92c5c3b1e5f5defee'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '3481170c4f26ccda457a7cb8aa525924eb1f0c731412764d3f7b0dcec30ae661abd77a0c08f74794adba87edf96ecc9dae019ec57c209c1e394aceffd5f94a7b'
        '00c0735be9248265576871085a757491a397ad20388aae91164e7fe444a20b3abd8d18a3bff1dff90f5ddced81fe499af9e649a820a0e86f82af269cd76c92c1')

prepare() {
  cd "$pkgbase"

  # prepare git submodules (skip cpp-terminal)
  git submodule init \
    source/dsp56300 \
    source/JUCE \
    source/mc68k \
    source/clap-juce-extensions \
    source/3rdparty/RmlUi \
    source/3rdparty/freetype

  git config submodule.source/dsp56300.url "$srcdir/github.com-dsp56300-dsp56300"
  git config submodule.source/JUCE.url "$srcdir/github.com-dsp56300-JUCE"
  git config submodule.source/clap-juce-extensions.url "$srcdir/github.com-free-audio-clap-juce-extensions"
  git config submodule.source/mc68k.url "$srcdir/github.com-dsp56300-mc68k"
  git config submodule.source/3rdparty/RmlUi.url "$srcdir/github.com-dsp56300-RmlUi"
  git config submodule.source/3rdparty/freetype.url "$srcdir/github.com-freetype-freetype"
  git -c protocol.file.allow=always submodule update

  # setup git submodules for clap-juce-extensions
  pushd source/clap-juce-extensions
  git submodule init
  git config submodule.clap-libs/clap.url "$srcdir/github.com-free-audio-clap"
  git config submodule.clap-libs/clap-helpers.url "$srcdir/github.com-free-audio-clap-helpers"
  git -c protocol.file.allow=always submodule update
  popd

  # setup git submodules for dsp56300
  pushd source/dsp56300
  git submodule init
  git config submodule.source/asmjit.url "$srcdir/github.com-asmjit-asmjit"
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
    -W no-dev
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
