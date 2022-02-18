# Maintainer: Frederic Bezies <fredbezies at gmail dot com>

pkgname=dosbox-x-sdl2
pkgver=0.83.22
pkgrel=3
pkgdesc="x86 emulator with builtin DOS, with patches and more features"
arch=(i686 x86_64 aarch64)
url="http://dosbox-x.com"
license=(GPL)
depends=(fluidsynth libxkbfile libxrandr ffmpeg sdl2_net libslirp)
makedepends=(glu )
optdepends=()
conflicts=('dosbox-x-git' 'dosbox-x' 'dosbox-x-sdl2-git')
source=(https://github.com/joncampbell123/dosbox-x/archive/dosbox-x-v${pkgver}.tar.gz)
sha256sums=('75c5c1eb3b78701a80ad816f414640894cb0b5998a1a4d7f2af064b47a57b8c9')

build() {
  cd "$srcdir/dosbox-x-dosbox-x-v$pkgver"
  ./autogen.sh
   export LDFLAGS="${LDFLAGS//,--as-needed}"
  # Workaround bug https://github.com/joncampbell123/dosbox-x/issues/3039
  export CFLAGS=${CFLAGS/-Werror=format-security/}
  export CXXFLAGS=${CXXFLAGS/-Werror=format-security/}
  chmod +x configure
  # Removing support for ffmpeg encoding until ffmpeg 5.x
  # is supported. Cf bug https://github.com/joncampbell123/dosbox-x/issues/3283
  ./configure --enable-core-inline --enable-debug --disable-avcodec --prefix=/usr --enable-sdl2
  make -j$(nproc)
}

package() {
  cd "$srcdir/dosbox-x-dosbox-x-v$pkgver"
  make DESTDIR="$pkgdir" install
}
