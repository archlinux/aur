# Maintainer: Frederic Bezies <fredbezies at gmail dot com>

pkgname=dosbox-x-sdl2
_pkgname=dosbox-x
pkgver=2024.03.01
pkgrel=5
pkgdesc="x86 emulator with builtin DOS, with patches and more features"
arch=(i686 x86_64 aarch64)
url="http://dosbox-x.com"
license=(GPL)
depends=(fluidsynth libxkbfile libxrandr sdl2_net libslirp)
makedepends=(glu)
optdepends=()
conflicts=('dosbox-x-git' 'dosbox-x' 'dosbox-x-sdl2-git')
source=(https://github.com/joncampbell123/dosbox-x/archive/dosbox-x-v${pkgver}.tar.gz)
sha256sums=('2a89d3196ddc15361f6dc7e6ab142bfe95945d93d527cfd6bacca1f7a401a513')
options=(!debug)

build() {
  cd "$srcdir/dosbox-x-dosbox-x-v$pkgver"
  
  # Workaround a bug in gcc 13.x+ grabbed from dosbox-x AUR PKGBUILD
 
  export CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fno-plt -fexceptions \
    -Wp,-D_FORTIFY_SOURCE=2 -Wformat \
    -fstack-clash-protection -fcf-protection"
  export CXXFLAGS="$CFLAGS -Wp,-D_GLIBCXX_ASSERTIONS"
   
  ./autogen.sh
  ./configure --enable-debug --enable-avcodec --prefix=/usr --enable-sdl2
  make
  
}

package() {
  cd "$srcdir/dosbox-x-dosbox-x-v$pkgver"
  make DESTDIR="$pkgdir" install
}
