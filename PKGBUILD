# Maintainer: Jean Pierre Cimalando <jp-dev@inbox.ru>
pkgname=adlplug-git
_pkgname=ADLplug
pkgver=v1.0.0.beta.1.r14.03fb745
pkgrel=1
pkgdesc="FM synthesizer plugin for ADLMIDI with OPL3 chip emulation"
arch=('i686' 'x86_64')
url="https://github.com/jpcima/ADLplug"
license=('GPL')
groups=()
depends=('jack' 'alsa-lib' 'freetype2' 'libxext')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/jpcima/ADLplug.git'
        'git+https://github.com/Wohlstand/libADLMIDI.git'
        'git+https://github.com/Wohlstand/libOPNMIDI.git'
        'git+https://github.com/jpcima/JUCE.git'
        'git+https://github.com/fmtlib/fmt.git'
        'git+https://github.com/brofield/simpleini.git')
noextract=()
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule init
  for submodule in \
    thirdparty/libADLMIDI thirdparty/libOPNMIDI \
    thirdparty/JUCE thirdparty/fmt thirdparty/simpleini
  do
    git config "submodule.$submodule.url" "$srcdir/`basename "$submodule"`"
  done
  git submodule update
}

build() {
  cd "$srcdir/$_pkgname"
  mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DADLplug_CHIP=OPL3 ..
  make
}

package() {
  cd "$srcdir/$_pkgname/build"
  make DESTDIR="$pkgdir/" install
}
