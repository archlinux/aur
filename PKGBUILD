# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=dsp56300-emulator
pkgver=1.2.15
pkgrel=1
pkgdesc='Emulates musical devices that used the Motorola 56300 DSPs (VST3 plugin)'
arch=('x86_64')
url='https://github.com/dsp56300/gearmulator'
license=('GPL3')
groups=('pro-audio' 'vst3-plugins')
depends=(
  'freetype2'
  'alsa-lib'
  'vst3-host'
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
install=dsp56300-emulator.install
_commit='7ebedff6b64828f3ce4aac84360e361fed9e6d1b'
source=(
  "$pkgname::git+$url#commit=$_commit"
  'github.com-dsp56300-dsp56300::git+https://github.com/dsp56300/dsp56300'
  'github.com-dsp56300-JUCE::git+https://github.com/dsp56300/JUCE'
  'github.com-asmjit-asmjit::git+https://github.com/asmjit/asmjit'
  'fix-ftbfs-dsp56300.patch'
  'fix-ftbfs-juceplugin.patch'
)
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '5a2b43e53e2aad3d10db38844b5244444973a9553c36f5e5fa495625714f18f006cf10eda2f16c75e010f5237c7eedc250fd7cddf4e12a65f04394af328c963e'
        'd1ee67027809634fadea42aff5cb910bb0a86b335c5d6fed0792932dc74626f780a9cf77d0c46e4497a3e3982e6f96343390a06ac324dc7c846ea262f3bf4b95')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # prepare git submodules
  git submodule init

  git config submodule.source/dsp56300.url "$srcdir/github.com-dsp56300-dsp56300"
  git config submodule.source/JUCE.url "$srcdir/github.com-dsp56300-JUCE"

  git submodule update

  pushd source/dsp56300
  git submodule init
  git config submodule.source/asmjit.url "$srcdir/github.com-asmjit-asmjit"
  git submodule update
  popd

  # fix FTBFS issues
  pushd source/dsp56300
  patch -p1 -i "$srcdir/fix-ftbfs-dsp56300.patch"
  popd
  patch -p1 -i "$srcdir/fix-ftbfs-juceplugin.patch"
}

build() {
  cmake \
    -S "$pkgname" \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  cd build/source/jucePlugin/jucePlugin_artefacts/Release/VST3

  # generate required directory
  install -vd "$pkgdir/usr/lib/vst3"

  # VST3 plugin
  cp -vr DSP56300Emu.vst3 "$pkgdir/usr/lib/vst3"
}
