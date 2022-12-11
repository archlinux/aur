# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=dsp56300-emulator
pkgver=1.2.22
pkgrel=1
pkgdesc='Emulates musical devices that used the Motorola 56300 DSPs (VST3 plugin)'
arch=('x86_64')
url='https://github.com/dsp56300/gearmulator'
license=('GPL3')
groups=('pro-audio' 'vst3-plugins')
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
optdepends=('vst3-host: for VST3 plugin')
install=dsp56300-emulator.install
_commit='7bf0494c14a6a68eeee0d63015b592c3e38ed2d2'
source=(
  "$pkgname::git+$url#commit=$_commit"
  'github.com-dsp56300-dsp56300::git+https://github.com/dsp56300/dsp56300'
  'github.com-dsp56300-JUCE::git+https://github.com/dsp56300/JUCE'
  'github.com-asmjit-asmjit::git+https://github.com/asmjit/asmjit'
  'fix-ftbfs-dsp56300.patch'
)
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '5a2b43e53e2aad3d10db38844b5244444973a9553c36f5e5fa495625714f18f006cf10eda2f16c75e010f5237c7eedc250fd7cddf4e12a65f04394af328c963e')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^osirus_//'
}

prepare() {
  cd "$pkgname"

  # prepare git submodules
  git submodule init

  git config submodule.source/dsp56300.url "$srcdir/github.com-dsp56300-dsp56300"
  git config submodule.source/JUCE.url "$srcdir/github.com-dsp56300-JUCE"

  git -c protocol.file.allow=always submodule update

  pushd source/dsp56300
  git submodule init
  git config submodule.source/asmjit.url "$srcdir/github.com-asmjit-asmjit"
  git -c protocol.file.allow=always submodule update
  popd

  # fix FTBFS issues
  pushd source/dsp56300
  patch -p1 -i "$srcdir/fix-ftbfs-dsp56300.patch"
  popd
  git cherry-pick --no-commit e9fe30838e0512fc5de8e4f6930800db51a055ba
}

build() {
  cmake \
    -S "$pkgname" \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  # generate required directory
  install -vd "$pkgdir/usr/lib/vst3"

  # VST3 plugin
  cp -vr build/source/jucePlugin/jucePlugin_artefacts/Release/VST3/DSP56300Emu.vst3 "$pkgdir/usr/lib/vst3"
}
