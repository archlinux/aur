pkgname=dosbox-x-sdl2
pkgver=0.83.3
pkgrel=1
pkgdesc="x86 emulator with builtin DOS, with patches and more features"
arch=(i686 x86_64)
url="http://dosbox-x.com"
license=(GPL)
depends=(fluidsynth libxkbfile libpng libxrandr mesa ffmpeg sdl2)
makedepends=(glu)
optdepends=()
source=(https://github.com/joncampbell123/dosbox-x/archive/dosbox-x-v${pkgver}.tar.gz
        dosbox-x.png
        dosbox-x.desktop)
sha256sums=('48f005949ada1ace8ad8c00bb27fad17d566e5bcdbec8be6078e44f8ad04759a'
            'ad9fa0e16081a4c899e3f59bb5c04ddb13948311ddda54e976acb164d6e72235'
            '1fbd80a6d985806af3d7a5d197f9dd75f61964e8b63ef544ed9a44f1e2df55f2')

build() {
  cd "$srcdir/dosbox-x-dosbox-x-v$pkgver"
  ./autogen.sh
  chmod +x vs2015/sdl/build-scripts/strip_fPIC.sh
  chmod +x configure
  ./configure --enable-core-inline --disable-debug --enable-avcodec --prefix=/usr --enable-sdl2
  make -j$(nproc)
}

package() {
  cd "$srcdir/dosbox-x-dosbox-x-v$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/dosbox-x.png" \
    "$pkgdir/usr/share/pixmaps/dosbox-x.png"
  install -Dm644 "$srcdir/dosbox-x.desktop" \
    "$pkgdir/usr/share/applications/dosbox-x.desktop"
}
