# Maintainer: Frederic Bezies <fredbezies at gmail dot com>

pkgname=dosbox-x-sdl2
pkgver=0.83.24
pkgrel=1
pkgdesc="x86 emulator with builtin DOS, with patches and more features"
arch=(i686 x86_64 aarch64)
url="http://dosbox-x.com"
license=(GPL)
depends=(fluidsynth libxkbfile libxrandr ffmpeg4.4 sdl2_net libslirp)
makedepends=(glu)
optdepends=()
conflicts=('dosbox-x-git' 'dosbox-x' 'dosbox-x-sdl2-git')
source=(https://github.com/joncampbell123/dosbox-x/archive/dosbox-x-v${pkgver}.tar.gz)
sha256sums=('f4746f1524cac58756123c7acbbc565e215d7f298a19667fd845dbba040c6021')

build() {
  cd "$srcdir/dosbox-x-dosbox-x-v$pkgver"
  # Workaround ffmpeg5, thanks to Grapelli on the bug opened on dosbox-x github page
  sed -i 's|"$LIBS -lavcodec -lavformat -lavutil -lswscale "`pkg-config libavcodec --libs`|`pkg-config libavcodec libavformat libavutil libswscale libswresample --libs`"$LIBS"|' configure.ac
  ./autogen.sh
  export LDFLAGS="${LDFLAGS//,--as-needed}"
  chmod +x configure
  PKG_CONFIG_PATH="/usr/lib/ffmpeg4.4/pkgconfig" ./configure --enable-core-inline --disable-debug --enable-avcodec --prefix=/usr --enable-sdl2
  make -j$(nproc)
}

package() {
  cd "$srcdir/dosbox-x-dosbox-x-v$pkgver"
  make DESTDIR="$pkgdir" install
}
