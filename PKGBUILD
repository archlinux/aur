# Maintainer: steelt <steeltitanium1 at gmail dot com>
# Contributor: steelt <steeltitanium1 at gmail dot com>

pkgname=ringracers
pkgver=2.0
_dataver=2.0
pkgrel=2
pkgdesc="Kart racing video game originally based on the 3D Sonic the Hedgehog fangame Sonic Robo Blast 2"
arch=('x86_64' 'aarch64')
license=('GPL2')
url='https://www.kartkrew.org'
depends=("ringracers-data>=$_dataver" 'curl' 'zlib' 'libpng' 'libvorbis' 'libvpx' 'libyuv' 'sdl2')
makedepends=('git' 'cmake' 'ninja' 'mold')

source=("$pkgname"::"git+https://github.com/KartKrewDev/RingRacers.git#tag=v$pkgver"
  "org.kartkrew.RingRacers.desktop")
sha256sums=('SKIP'
            '812a12ad6a7e5ef7bea3ef3b24bc4e686e9b8df16221c478f202c96ee6ce413d')

build() {
  # Unset U_GLIBCXX_ASSERTIONS as a stopgap solution for the crashes
  #CXXFLAGS="$CXXFLAGS -Wp,-U_GLIBCXX_ASSERTIONS"

  cmake -G Ninja -Wno-dev -B build -S "$pkgname" \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_LINKER_TYPE='MOLD' \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSRB2_SDL2_EXE_NAME="ringracers" \
    -DACSVM_INSTALL_LIB=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  mkdir -p "$pkgdir"/usr/bin/
  mv "$pkgdir"/usr/ringracers "$pkgdir"/usr/bin/
  install -Dm644 "$pkgname"/srb2.png "$pkgdir"/usr/share/pixmaps/org.kartkrew.RingRacers.png
  install -Dm644 org.kartkrew.RingRacers.desktop "$pkgdir"/usr/share/applications/org.kartkrew.RingRacers.desktop
}