# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=reicast-c1-git
pkgver=r1284.d3c3feb
pkgrel=1
pkgdesc="A multiplatform Sega Dreamcast emulator for ODROID-C1 (development version)"
arch=('armv7h')
url="http://reicast.com/"
license=('GPL2' 'BSD' 'MIT')
conflicts=('reicast' 'reicast-git')
provides=('reicast')
makedepends=('git')
depends=('libgl' 'alsa-lib')
source=(reicast::"git+https://github.com/reicast/reicast-emulator.git")
md5sums=('SKIP')

pkgver() {
  cd reicast
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
  MALI_INCLUDE="$srcdir/c1_mali_libs/fbdev/mali_headers"
  export CFLAGS="-I$MALI_INCLUDE"
  export LDFLAGS+=" -L/usr/lib/mali-egl -L/usr/lib/aml_libs"
  make -C reicast/shell/linux
}

package () {
  cd reicast

  install -Dm755 shell/linux/reicast.elf "$pkgdir"/usr/bin/reicast
  # license
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
