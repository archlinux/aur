# Mantainer: Franco Tortoriello

pkgname=dosbox-x-sdl2-git
pkgver=2023.10.06.r90.gf8e923696
pkgrel=1
epoch=3
pkgdesc="x86 emulator with builtin DOS, with patches with more features - sdl2 git version"
arch=(i686 x86_64)
url="https://dosbox-x.com/"
license=(GPL)
depends=(fluidsynth libxkbfile libxrandr ffmpeg sdl2_net libslirp)
makedepends=(git glu)
conflicts=(dosbox-x-sdl2 dosbox-x-git dosbox-x)
install='dosbox-x.install'
source=(dosbox-x::git+https://github.com/joncampbell123/dosbox-x.git)
sha256sums=('SKIP')
            
pkgver() {
  cd "$srcdir/dosbox-x"
  git describe --long --tags | sed 's/^dosbox.x-//;s/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-48
}

build() {
  cd "$srcdir/dosbox-x"
  
  # Workaround for bug: https://github.com/joncampbell123/dosbox-x/issues/4237
  #CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fno-plt -fexceptions \
  #      -Wp,-D_FORTIFY_SOURCE=2 -Wformat -Wno-error=format-security \
  #      -fstack-clash-protection -fcf-protection"
  #CXXFLAGS="$CFLAGS -Wp,-D_GLIBCXX_ASSERTIONS"
  
  ./autogen.sh
  ./configure --enable-debug --enable-avcodec --prefix=/usr --enable-sdl2
  make -j$(nproc)
}

package() {
  cd "$srcdir/dosbox-x"
  make DESTDIR="$pkgdir" install
}
