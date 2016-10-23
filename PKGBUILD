# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=oxefmsynth
pkgver=1.3.5
pkgrel=1
pkgdesc="An 8-OP FM synthesizer VST plug-in"
arch=('i686' 'x86_64')
url="http://www.oxesoft.com/"
license=('GPL3')
depends=('mesa')
makedepends=('steinberg-vst36')
source=("https://github.com/oxesoft/oxefmsynth/archive/v${pkgver}.zip")
md5sums=('d89f70be3a0b7bfb9883e08b86858b57')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export VSTSDK_PATH="/usr/include/vst36"
  export CFLAGS="$CFLAGS -std=c++11 -Wno-narrowing"
  for file in Makefile.vstlinux \
        src/vst/oxevst.h \
        src/vst/oxevsteditor.h \
        src/vst/oxevsteditor.cpp \
        src/vst/vsthostinterface.cpp; do
    sed -i -e 's|public.sdk/source/vst2.x/||g' "$file"
  done
  sed -i -e 's| "VERSION_STR| " VERSION_STR|' src/synth/constants.h
  sed -i -e 's|BMP_PATH| BMP_PATH |' src/toolkits/xlibtoolkit.cpp
  make -f Makefile.vstlinux LIBS="-lX11 -lGL -lpthread -ldl"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  if [[ $CARCH == 'i686' ]]; then
    _arch=32
  elif [[ $CARCH == 'x86_64' ]]; then
    _arch=64
  fi

  install -D oxevst${_arch}.so "$pkgdir/usr/lib/vst/oxevst${_arch}.so"
}
