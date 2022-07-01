# Maintainer: Mike Cuche <cuche AT mailbox.org>

pkgname=dosbox-x
pkgver=0.84.1
pkgrel=1
pkgdesc="x86 emulator with builtin DOS, with patches with more features"
arch=(i686 x86_64 aarch64)
url="http://dosbox-x.com"
license=(GPL)
depends=(fluidsynth libxkbfile libpng libxrandr mesa ffmpeg4.4 physfs libslirp libpcap)
makedepends=(glu)
optdepends=('openglide-git: Third-party 3dfx Glide API support')
conflicts=(dosbox-x-git)
source=(https://github.com/joncampbell123/dosbox-x/archive/dosbox-x-v${pkgver}.tar.gz)

sha256sums=('d5ba5b3d87b0dc69d70f6c9701eec36772bbc3716e0b201b74ec73d4b3ff38cc')

build() {
  cd $srcdir/dosbox-x-dosbox-x-v${pkgver}
  sed -i -e 's/-j3/-j$(nproc)/g' build
  sed -i 's|"$LIBS -lavcodec -lavformat -lavutil -lswscale "`pkg-config libavcodec --libs`|`pkg-config libavcodec libavformat libavutil libswscale libswresample --libs`"$LIBS"|' configure.ac #ffmpeg avcodec fix
  sed -i 's|$LIBS $SDL_LIBS|$LIBS $SDL_LIBS -lm -lGL|' configure.ac  #fluidsynth fix
 PKG_CONFIG_PATH="/usr/lib/ffmpeg4.4/pkgconfig" ./build
}

package() {
  cd $srcdir/dosbox-x-dosbox-x-v${pkgver}
  make DESTDIR="${pkgdir}" install
}
