# Maintainer: Mike Cuche <cuche AT mailbox.org>

pkgname=dosbox-x
pkgver=2022.08.0
pkgrel=1
pkgdesc="x86 emulator with builtin DOS, with patches with more features"
arch=(i686 x86_64 aarch64)
url="http://dosbox-x.com"
license=(GPL)
depends=(fluidsynth libxkbfile libpng libxrandr mesa ffmpeg4.4 physfs libslirp libpcap)
makedepends=(glu)
optdepends=('openglide-git: Third-party 3dfx Glide API support')
conflicts=(dosbox-x-git)
source=(https://github.com/joncampbell123/dosbox-x/archive/dosbox-x-windows-v${pkgver}.tar.gz)

sha256sums=('bac936ee198b607fb0cc55dfc4575e44b700dbc9138904d2e264792a6e6a941c')

build() {
  cd $srcdir/dosbox-x-dosbox-x-windows-v${pkgver}
  sed -i -e 's/-j3/-j$(nproc)/g' build
  sed -i 's|"$LIBS -lavcodec -lavformat -lavutil -lswscale "`pkg-config libavcodec --libs`|`pkg-config libavcodec libavformat libavutil libswscale libswresample --libs`"$LIBS"|' configure.ac #ffmpeg avcodec fix
  sed -i 's|$LIBS $SDL_LIBS|$LIBS $SDL_LIBS -lm -lGL|' configure.ac  #fluidsynth fix
 PKG_CONFIG_PATH="/usr/lib/ffmpeg4.4/pkgconfig" ./build
}

package() {
  cd $srcdir/dosbox-x-dosbox-x-windows-v${pkgver}
  make DESTDIR="${pkgdir}" install
}
