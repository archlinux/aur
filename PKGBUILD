# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=dsp56300-emulator
pkgver=1.2.25
pkgrel=2
pkgdesc='Emulates musical devices that used the Motorola 56300 DSPs'
arch=('x86_64')
url='https://github.com/dsp56300/gearmulator'
license=('GPL3')
groups=('pro-audio' 'vst3-plugins' 'clap-plugins')
depends=(
  'freetype2'
  'alsa-lib'
)
makedepends=(
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
optdepends=(
  'vst3-host: for VST3 plugin'
  'clap-host: for CLAP plugin'
)
install=dsp56300-emulator.install
_commit='929df1d81e0fa58021cb6968f7dee895d7b2aed1'
source=(
  "$pkgname::git+$url#commit=$_commit"
  'github.com-dsp56300-dsp56300::git+https://github.com/dsp56300/dsp56300'
  'github.com-dsp56300-JUCE::git+https://github.com/dsp56300/JUCE'
  'github.com-asmjit-asmjit::git+https://github.com/asmjit/asmjit'
  'github.com-free-audio-clap::git+https://github.com/free-audio/clap'
  'github.com-free-audio-clap-helpers::git+https://github.com/free-audio/clap-helpers'
  'github.com-free-audio-clap-juce-extensions::git+https://github.com/free-audio/clap-juce-extensions'
  'fix-submodule-url.patch'
)
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '99550e55c34c872134eeab01a659f10e70d7e9bd1d08d36eafc55d4a215ba14155e539baa4b60806a03c87c9c9473b3725520b810f2a82ea6eb884e56ebc88f7')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^osirus_//'
}

prepare() {
  cd "$pkgname"

  # convert relative to absolute submodule URL
  patch -p1 -i "$srcdir/fix-submodule-url.patch"

  # prepare git submodules
  git submodule init
  git config submodule.source/dsp56300.url "$srcdir/github.com-dsp56300-dsp56300"
  git config submodule.source/JUCE.url "$srcdir/github.com-dsp56300-JUCE"
  git config submodule.source/clap-juce-extensions.url "$srcdir/github.com-free-audio-clap-juce-extensions"
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
}

build() {
  cmake \
    -S "$pkgname" \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  cd build/source/jucePlugin/jucePlugin_artefacts/Release

  # VST3 plugin
  install -vd "$pkgdir/usr/lib/vst3"
  cp -vr VST3/DSP56300Emu.vst3 "$pkgdir/usr/lib/vst3"

  # CLAP plugin
  install -vDm755 CLAP/DSP56300Emu.clap -t "$pkgdir/usr/lib/clap"
}
