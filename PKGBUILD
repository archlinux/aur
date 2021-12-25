# Mantainer: Franco Tortoriello

pkgname=dosbox-x-sdl2-git
pkgver=0.83.20.r180.g611a0b538
pkgrel=1
epoch=1
pkgdesc="x86 emulator with builtin DOS, with patches with more features - sdl2 git version"
arch=(i686 x86_64)
url="https://dosbox-x.com/"
license=(GPL)
depends=(fluidsynth libxkbfile libxrandr ffmpeg sdl2_net libslirp)
makedepends=(git glu)
conflicts=(dosbox-x-sdl2 dosbox-x-git dosbox-x)
install='dosbox-x.install'
source=(dosbox-x::git://github.com/joncampbell123/dosbox-x.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/dosbox-x"
  git describe --long --tags | sed 's/^dosbox-//;s/\([^-]*-g\)/r\1/;s/-/./g' | cut -c4-48
}

build() {
  cd "$srcdir/dosbox-x"
    export LDFLAGS="${LDFLAGS//,--as-needed}"
  # Workaround bug https://github.com/joncampbell123/dosbox-x/issues/3039
  export CFLAGS=${CFLAGS/-Werror=format-security/}
  export CXXFLAGS=${CXXFLAGS/-Werror=format-security/}
  ./autogen.sh
  ./configure --enable-core-inline --enable-debug --enable-avcodec --prefix=/usr --enable-sdl2
  make -j$(nproc)
}

package() {
  cd "$srcdir/dosbox-x"
  make DESTDIR="$pkgdir" install
}
