# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=oxefmsynth
pkgver=1.3.4
pkgrel=2
pkgdesc="An 8-OP FM synthesizer VST plug-in"
arch=('i686' 'x86_64')
url="http://www.oxesoft.com/"
license=('GPL3')
depends=('mesa')
source=("https://github.com/oxesoft/oxefmsynth/archive/v${pkgver}.zip"
        'http://www.steinberg.net/sdk_downloads/vstsdk360_22_11_2013_build_100.zip')
md5sums=('44841c42b5a3d934f27d3cec73b20b57'
         '1ac422ebb4aa2e86061278412c347b55')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export VSTSDK_PATH="$srcdir/VST3\\ SDK"
  # See: http://stackoverflow.com/questions/10789012/g-cdecl-calling-convention-with-steinberg-vst-sdk
  export CFLAGS='-D__cdecl=""'
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
