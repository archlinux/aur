# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=dsp56300-emulator
pkgname=(
  'dsp56300-emulator-clap'
  'dsp56300-emulator-lv2'
  'dsp56300-emulator-vst3'
)
pkgver=1.4.2
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
  'disable-vst2-format.patch'
  'skip-cpack.patch'
  'skip-tests.patch'
)
sha512sums=('613a3c3a2df4c73c9a351a52c291c1df8660b89b59488d7a601dad13e1b1faedbcd04c11bab24adfa1b1121e73ac46a74b1c7b6fc0879b2cd133ed26a6f20b5c'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '07033d6171eabf8a57318c0e441d4c2c591f67ae6add2e6c4817224fe4c87c4c9563f1c2cb6db3282229a6e10415e13a986cc4a976373a493fbcbc302a4ee888'
            '9264c532fdd430f29341461555cf392d199bf58eddf63dfa6b8f88a37775ccba0ad287c8a36410bb7c5c5aac16a9c1ca1c47ab69d71955f12ebc83176872b0cf'
            '2334010c663b5e90e6b63a0e3ca73871609b2bc1d01116ea56dd896972f66a704cf910cfb61d44c922541376a1add69562f31ccc2457f1e16badbc932f0e4a45')
b2sums=('129eb8c47849672a81ba92a64a5aa0d5a312ad1b24db052a1eafd2ace50d0df3e64ff90a9ff11955ffdbbc38b9e049e834641879fcc3e88b8235cc8fa5564076'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '27125a193dea0eb2bfb5cc33239fda09d4af8477123eb8550b8c9aee82641b66ef71851a177c7b7d3f6f59c408ee86f064e8c8d8e9a4725cfded48dc8334f7ce'
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

  # disable VST2 format
  patch -p1 -i "$srcdir/disable-vst2-format.patch"

  # skip tests (only useful for development, reduces compile time by a *lot*)
  patch -p1 -i "$srcdir/skip-tests.patch"
}

build() {
  local cmake_options=(
    -S "$pkgbase"
    -B build
    -G Ninja
    -D CMAKE_INSTALL_PREFIX=/usr
    -W no-dev
    -D gearmulator_BUILD_JUCEPLUGIN=ON
    -D gearmulator_BUILD_JUCEPLUGIN_CLAP=ON
    -D gearmulator_BUILD_JUCEPLUGIN_LV2=ON
    -D gearmulator_BUILD_JUCEPLUGIN_VST3=ON
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
