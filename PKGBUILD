# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=tyrquake-git
pkgver=0.61.r1226.0ca7766
pkgrel=1
pkgdesc="A conservative Quake port"
arch=('i686' 'x86_64')
url="http://disenchant.net/tyrquake/"
license=(GPL2)
depends=(sdl2)
makedepends=(git)
conflicts=(tyrquake)
provides=(tyrquake)
install=tyrquake.install
source=("git://disenchant.net/tyrquake")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname/-git/}"
  local version="$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
  printf %s "${version##v}"
}

build() {
  cd "${pkgname/-git/}"

  [ "$CARCH" = "i686" ] && _asm=Y || _asm=N

  make QBASEDIR=/usr/share/games/quake \
       USE_X86_ASM=$_asm               \
       OPTIMIZED_CFLAGS=N              \
       USE_SDL=Y                       \
       STRIP=true
}

package() {
  cd "${pkgname/-git/}"

  install -d "$pkgdir/usr/bin"
  install bin/tyr-* "$pkgdir/usr/bin"
}
