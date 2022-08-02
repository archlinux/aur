# Mantainer: Franco Tortoriello

pkgname=dosbox-x-sdl2-git
pkgver=22.08.0.r2.gd0066f0e5
pkgrel=1
epoch=2
pkgdesc="x86 emulator with builtin DOS, with patches with more features - sdl2 git version"
arch=(i686 x86_64)
url="https://dosbox-x.com/"
license=(GPL)
depends=(fluidsynth libxkbfile libxrandr ffmpeg4.4 sdl2_net libslirp)
makedepends=(git glu)
conflicts=(dosbox-x-sdl2 dosbox-x-git dosbox-x)
install='dosbox-x.install'
source=(dosbox-x::git+https://github.com/joncampbell123/dosbox-x.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/dosbox-x"
  git describe --long --tags | sed 's/^dosbox.x.windows-//;s/\([^-]*-g\)/r\1/;s/-/./g' | cut -c4-48
}

build() {
  cd "$srcdir/dosbox-x"
   # Working around bug : https://github.com/joncampbell123/dosbox-x/issues/3283
   sed -i 's|"$LIBS -lavcodec -lavformat -lavutil -lswscale "`pkg-config libavcodec --libs`|`pkg-config libavcodec libavformat libavutil libswscale libswresample --libs`"$LIBS"|' configure.ac
  ./autogen.sh
  PKG_CONFIG_PATH="/usr/lib/ffmpeg4.4/pkgconfig" ./configure --enable-core-inline --enable-debug --enable-avcodec --prefix=/usr --enable-sdl2
  make -j$(nproc)
}

package() {
  cd "$srcdir/dosbox-x"
  make DESTDIR="$pkgdir" install
}
