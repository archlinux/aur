# Maintainer: Frederic Bezies <fredbezies at gmail dot com>

pkgname=dosbox-x-sdl2
_pkgname=dosbox-x
pkgver=2024.03.01
pkgrel=7
pkgdesc="x86 emulator with builtin DOS, with patches and more features"
arch=(i686 x86_64 aarch64)
url="http://dosbox-x.com"
license=(GPL)
depends=(fluidsynth libxkbfile libxrandr sdl2_net libslirp)
makedepends=(glu)
optdepends=()
conflicts=('dosbox-x-git' 'dosbox-x' 'dosbox-x-sdl2-git')
source=(https://github.com/joncampbell123/dosbox-x/archive/dosbox-x-v${pkgver}.tar.gz
	speexdsp-gcc14.patch)
sha256sums=('2a89d3196ddc15361f6dc7e6ab142bfe95945d93d527cfd6bacca1f7a401a513'
            '0126d80aa3223380622aa863712f7bbc29dbcaecea3cb2bcb1e512f12e0b4ccd')
	    
options=(!debug)

prepare() {
  # Fix speexdsp compilation error with GCC 14
  # https://github.com/joncampbell123/dosbox-x/pull/4870
  cd "$srcdir/$_pkgname-$_pkgname-v$pkgver"
  patch -p1 -i "$srcdir/speexdsp-gcc14.patch"
}

build() {
  cd "$srcdir/dosbox-x-dosbox-x-v$pkgver"
  ./autogen.sh
  ./configure --enable-debug --enable-avcodec --prefix=/usr --enable-sdl2
  make
  
}

package() {
  cd "$srcdir/dosbox-x-dosbox-x-v$pkgver"
  make DESTDIR="$pkgdir" install
}
