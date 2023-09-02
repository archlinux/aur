# Maintainer: Frederic Bezies <fredbezies at gmail dot com>

pkgname=dosbox-x-sdl2
_pkgname=dosbox-x
pkgver=2023.09.01
pkgrel=1
pkgdesc="x86 emulator with builtin DOS, with patches and more features"
arch=(i686 x86_64 aarch64)
url="http://dosbox-x.com"
license=(GPL)
depends=(fluidsynth libxkbfile libxrandr sdl2_net libslirp)
makedepends=(glu)
optdepends=()
conflicts=('dosbox-x-git' 'dosbox-x' 'dosbox-x-sdl2-git')
source=(https://github.com/joncampbell123/dosbox-x/archive/dosbox-x-v${pkgver}.tar.gz)
sha256sums=('71bf4477ae1640406fa24023f51766ab158ebf26f0e2f317f6fd7bd84c15b4e6')

# Using git source to work around bug 4436: https://github.com/joncampbell123/dosbox-x/issues/4436

build() {
  cd "$srcdir/dosbox-x-dosbox-x-v$pkgver"
   
  ./autogen.sh
  
  # Working around bug 4436: https://github.com/joncampbell123/dosbox-x/issues/4436
  # We need to deactivate -Werror=format-security
  
  export CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fno-plt -fexceptions \
        -Wp,-D_FORTIFY_SOURCE=2 -Wformat \
        -fstack-clash-protection -fcf-protection"
  export CXXFLAGS="$CFLAGS -Wp,-D_GLIBCXX_ASSERTIONS"
  export LDFLAGS="${LDFLAGS//,--as-needed}"
  
  chmod +x configure
  ./configure --enable-core-inline --enable-debug --enable-avcodec --prefix=/usr --enable-sdl2
  make -j$(nproc)
  
}

package() {
  cd "$srcdir/dosbox-x-dosbox-x-v$pkgver"
  make DESTDIR="$pkgdir" install
}
