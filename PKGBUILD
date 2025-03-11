# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=dsp56300-emulator
pkgname=(
  'dsp56300-emulator-clap'
  'dsp56300-emulator-lv2'
  'dsp56300-emulator-vst3'
)
pkgver=1.4.4
pkgrel=1
pkgdesc='Emulates musical devices that used the Motorola 56300 DSPs'
arch=('x86_64')
url='https://github.com/dsp56300/gearmulator'
license=('GPL-3.0-only')
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
  'mold'
  'ninja'
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
  'skip-cpack.patch'
  'skip-tests.patch'
)
sha512sums=('c28c1ccb634db1258a1d017dc4b3dc7499e3da1e3c90916a7ad60a70b0c4c3e80abb19bb8a020dc171285d8c3322d8c1ae37d4227061678708ffc96fdf1e9978'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '9264c532fdd430f29341461555cf392d199bf58eddf63dfa6b8f88a37775ccba0ad287c8a36410bb7c5c5aac16a9c1ca1c47ab69d71955f12ebc83176872b0cf'
            '2334010c663b5e90e6b63a0e3ca73871609b2bc1d01116ea56dd896972f66a704cf910cfb61d44c922541376a1add69562f31ccc2457f1e16badbc932f0e4a45')
b2sums=('fb87b79166d8a897328fae538f4750e57702017a778f3f7d5cf9f02a2543e1f6f3fe1bf6acbfdf1aef73665b894294a8a86bb9c63dadd4c718f8f9e666c8a3d7'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '68ec32184ad27cd75a71383025abc4e4fef7252c06f32577832193ca9d58a22c1825631c377ac6160beccc13938c4a4565016844d4cdab5f43e0580f22aee853'
        'a0f622bf3716435a66bb8023295a8c5250819279461c0e61849e784b1b4586b7514f701608beaff43b0a874430cc8178de7a49da2f89eb47cb5773bb270f1623')

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
  )

  cmake "${cmake_options[@]}"

  cmake --build build --config Release

  mkdir install
  DESTDIR=$(pwd)/install cmake --install build 
}

package_dsp56300-emulator-clap() {
  pkgdesc+=' - CLAP plugins'
  groups=('pro-audio' 'clap-plugins')
  depends=(
    "${_common_depends[@]}"
    'clap-host'
  )

  # install required directory
  install -vd "$pkgdir/usr/lib/clap"

  mv install/usr/lib/clap/* "$pkgdir/usr/lib/clap"
}

package_dsp56300-emulator-lv2() {
  pkgdesc+=' - LV2 plugins'
  groups=('pro-audio' 'lv2-plugins')
  depends=(
    "${_common_depends[@]}"
    'lv2-host'
  )

  # install required directory
  install -vd "$pkgdir/usr/lib/lv2"

  mv install/usr/lib/lv2/* "$pkgdir/usr/lib/lv2"
}

package_dsp56300-emulator-vst3() {
  pkgdesc+=' - VST3 plugins'
  groups=('pro-audio' 'vst3-plugins')
  depends=(
    "${_common_depends[@]}"
    'vst3-host'
  )

  # install required directory
  install -vd "$pkgdir/usr/lib/vst3"

  mv install/usr/lib/vst3/* "$pkgdir/usr/lib/vst3"
}
