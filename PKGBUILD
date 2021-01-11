# Mantainer: Franco Tortoriello

pkgname=dosbox-x-sdl2-git
pkgver=13218.6e258e4a9
pkgrel=1
pkgdesc="x86 emulator with builtin DOS, with patches with more features - sdl2 git version"
arch=(i686 x86_64)
url="http://dosbox.sourceforge.net"
license=(GPL)
depends=(fluidsynth libxkbfile libpng libxrandr mesa ffmpeg sdl2 sdl2_net physfs)
makedepends=(git glu)
optdepends=()
conflicts=(dosbox-x-sdl2 dosbox-x-git)
install='dosbox-x.install'
source=(dosbox-x::git://github.com/joncampbell123/dosbox-x.git
	dosbox-x.png
	dosbox-x.desktop)

pkgver() {
  cd "$SRCDEST/dosbox-x"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/dosbox-x"
  export LDFLAGS="${LDFLAGS//,--as-needed}"
  ./autogen.sh
  ./configure --enable-core-inline --disable-debug --enable-avcodec --prefix=/usr --enable-sdl2
  make -j$(nproc)  
}

package() {
  cd "$srcdir/dosbox-x"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/dosbox-x.png" \
	"$pkgdir/usr/share/pixmaps/dosbox-x.png"
  install -Dm644 "$srcdir/dosbox-x.desktop" \
	"$pkgdir/usr/share/applications/dosbox-x.desktop"
}
sha256sums=('SKIP'
            'caa164f3d17d414733882d29098cb9cd63faddbdd5580a0c30f1173a63c42475'
            '7bd81e185fcf185f5296a34d36719da87140b17f59041bf1f18b867d64e9f6a8')
