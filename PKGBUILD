# Maintainer:  WorMzy Tykashi <wormzy.tykashi@gmail.com>
pkgname=freeserf-git
pkgver=0.3_51_g3848c74
pkgrel=1
pkgdesc="Opensource Settlers 1 clone (requires original game file)"
arch=('i686' 'x86_64')
url="http://jonls.dk/freeserf/"
license=('GPL3')
depends=('sdl2' 'sdl2_mixer' 'sdl2_image')
makedepends=('git' 'cmake' 'libxmp')
optdepends=('libxmp: Amiga audio playback')
conflicts=('freeserf')
provides=('freeserf')
install=freeserf.install
source=(git+"https://github.com/freeserf/freeserf.git"
        "cstdint.patch")
md5sums=('SKIP'
         '98a869d79db05db90d22bf69cdba159d')

pkgver() {
  cd freeserf
  git describe --tags | sed -e 's:^v::' -e 's:-:_:g'
}

prepare() {
  mkdir freeserf/build

  # Fix cstdint bustage, remove once fixed upstream
  # https://github.com/freeserf/freeserf/pull/526
  cd freeserf
  patch -p1 -i "${srcdir}/cstdint.patch"
}

build() {
  cd freeserf/build
  cmake -DCMAKE_BUILD_TYPE="None" -DCMAKE_INSTALL_PREFIX="/usr" ..
  make
}

package() {
  cd freeserf/build
  # CMake install is currently broken (as of 0.2_rc1_318_g6f61d1e) install manually...
  install -Dm755 src/FreeSerf "${pkgdir}/usr/bin/freeserf"
}
