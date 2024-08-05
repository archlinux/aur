# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=dsp56300-emulator
pkgname=(
  'dsp56300-emulator-clap'
  'dsp56300-emulator-lv2'
  'dsp56300-emulator-vst3'
)
pkgver=1.3.17
pkgrel=1
pkgdesc='Emulates musical devices that used the Motorola 56300 DSPs'
arch=('x86_64')
url='https://github.com/dsp56300/gearmulator'
license=('GPL-3.0-only')
groups=('pro-audio')
_common_depends=(
  'glibc'
  'freetype2'
  'alsa-lib'
)
makedepends=(
  "${_common_depends[@]}"
  'git'
  'cmake'
  'libx11'
  'libxext'
  'libxrandr'
  'libxinerama'
  'libxcursor'
  'libxcomposite'
  'mesa'
  'freeglut'
  'webkit2gtk'
)
options=('!debug')
source=(
  "$pkgbase::git+$url#tag=$pkgver"
  'github.com-dsp56300-dsp56300::git+https://github.com/dsp56300/dsp56300'
  'github.com-dsp56300-JUCE::git+https://github.com/dsp56300/JUCE'
  'github.com-asmjit-asmjit::git+https://github.com/asmjit/asmjit'
  'github.com-free-audio-clap::git+https://github.com/free-audio/clap'
  'github.com-free-audio-clap-helpers::git+https://github.com/free-audio/clap-helpers'
  'github.com-free-audio-clap-juce-extensions::git+https://github.com/free-audio/clap-juce-extensions'
  'github.com-dsp56300-mc68k::git+https://github.com/dsp56300/mc68k'
  'disable-vst2-format.patch'
  'skip-cpack.patch'
  'skip-tests.patch'
)
sha512sums=('9d5de59a4cc5f2460ff271940ff80eb246bc0b750646628efaa34019fd548837756df91cf2f418c153d8c1174f0cb32aa1518449f8cde8db4672b7cc8fde95c0'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '52202eaeca3dc400c6d54ce17cf04222844df1e0bc568ea782c546f989334bb6aa0c902f7e55ae09a583a21f5fb028b1352839ef0683a033b896b2b957343c58'
            '9264c532fdd430f29341461555cf392d199bf58eddf63dfa6b8f88a37775ccba0ad287c8a36410bb7c5c5aac16a9c1ca1c47ab69d71955f12ebc83176872b0cf'
            'a2cc32ef8eda1b98aff01be4b8f46f7201df7742b81cd947fad871e67355030dfaee6ffa5d53414f98e357c8144598fac5f22fa9f89b8a5394b0ec0561745054')
b2sums=('2dc3e4d51f50851f21b06654d6d6eedf2e5d8f2b5f5a1872c425450ea0dd7afdade356776f655e3583c93ee2f0277f8110a464a564adec5593a7d4d23639aaae'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '97a00d07438039abc59b3e866528f61ddc85082254815cdf9bc1039246c629225d1e6d9eac4fa69538a770fbbbd470c8063cae708e6fae45ae59166299321580'
        '68ec32184ad27cd75a71383025abc4e4fef7252c06f32577832193ca9d58a22c1825631c377ac6160beccc13938c4a4565016844d4cdab5f43e0580f22aee853'
        'b022516d0726fceee7412f471410caf935ce23e02b3e0e827cd7f675ea1dc141f7bbd53bc498ba26ad77456859dcfbceddd251e877b63f7e2bb4164aea9a6866')

prepare() {
  cd "$pkgbase"

  # prepare git submodules (skip cpp-terminal)
  git submodule init \
    source/dsp56300 \
    source/JUCE \
    source/mc68k \
    source/clap-juce-extensions

  git config submodule.source/dsp56300.url "$srcdir/github.com-dsp56300-dsp56300"
  git config submodule.source/JUCE.url "$srcdir/github.com-dsp56300-JUCE"
  git config submodule.source/clap-juce-extensions.url "$srcdir/github.com-free-audio-clap-juce-extensions"
  git config submodule.source/mc68k.url "$srcdir/github.com-dsp56300-mc68k"
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

  # disable VST2 format
  patch -p1 -i "$srcdir/disable-vst2-format.patch"

  # skip tests (only useful for development, reduces compile time by a *lot*)
  patch -p1 -i "$srcdir/skip-tests.patch"
}

build() {
  cmake \
    -S "$pkgbase" \
    -B build \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D gearmulator_BUILD_JUCEPLUGIN=ON \
    -D gearmulator_BUILD_JUCEPLUGIN_CLAP=ON \
    -D gearmulator_BUILD_JUCEPLUGIN_LV2=ON \
    -D gearmulator_BUILD_FX_PLUGIN=ON \
    -D gearmulator_SYNTH_OSIRUS=ON \
    -D gearmulator_SYNTH_OSTIRUS=ON \
    -D gearmulator_SYNTH_VAVRA=ON \
    -D gearmulator_SYNTH_XENIA=ON

  cmake --build build --config Release
}

# variable used for packaging
_plugin_dirs=(
  mqJucePlugin
  osTIrusJucePlugin
  osirusJucePlugin
  xtJucePlugin
)

package_dsp56300-emulator-clap() {
  pkgdesc+=' - CLAP plugins'
  groups+=('clap-plugins')
  depends=(
    "${_common_depends[@]}"
    'clap-host'
  )

  cd build/source

  for plugin_dir in ${_plugin_dirs[@]}; do
    install -vDm755 \
      "${plugin_dir}/${plugin_dir}"_{,FX_}artefacts/Release/CLAP/*.clap \
      -t "$pkgdir/usr/lib/clap"
  done
}

package_dsp56300-emulator-lv2() {
  pkgdesc+=' - LV2 plugins'
  groups+=('lv2-plugins')
  depends=(
    "${_common_depends[@]}"
    'lv2-host'
  )

  # install required directory
  install -vd "$pkgdir/usr/lib/lv2"

  cd build/source

  for plugin_dir in ${_plugin_dirs[@]}; do
    cp -vr \
      "${plugin_dir}/${plugin_dir}"_{,FX_}artefacts/Release/LV2/*.lv2 \
      "$pkgdir/usr/lib/lv2"
  done
}

package_dsp56300-emulator-vst3() {
  pkgdesc+=' - VST3 plugins'
  groups+=('vst3-plugins')
  depends=(
    "${_common_depends[@]}"
    'vst3-host'
  )

  # install required directory
  install -vd "$pkgdir/usr/lib/vst3"

  cd build/source

  for plugin_dir in ${_plugin_dirs[@]}; do
    cp -vr \
      "${plugin_dir}/${plugin_dir}"_{,FX_}artefacts/Release/VST3/*.vst3 \
      "$pkgdir/usr/lib/vst3"
  done
}
