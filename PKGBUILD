# Maintainer: steelt <steeltitanium1 at gmail dot com>
# Contributor: steelt <steeltitanium1 at gmail dot com>

pkgname=ringracers
pkgver=2.3
_dataver=2.3
pkgrel=4
pkgdesc="Kart racing video game originally based on the 3D Sonic the Hedgehog fangame Sonic Robo Blast 2"
arch=('x86_64' 'aarch64')
license=(GPL-2.0-only)
url='https://www.kartkrew.org'
depends=("ringracers-data>=$_dataver" 'curl' 'zlib' 'libpng' 'libvorbis' 'libvpx' 'libyuv' 'sdl2')
makedepends=('cmake' 'ninja')
_archive="RingRacers-$pkgver"

source=("$pkgname-$pkgver.tar.gz"::"https://github.com/KartKrewDev/RingRacers/archive/refs/tags/v$pkgver.tar.gz"
  "org.kartkrew.RingRacers.desktop"
  "acsvm-cmake-ver.patch")

sha256sums=('68b1022f6ef92c178ca3b046b86a477edaec436ecd3c90a10221f3dcc2d45d81'
            '812a12ad6a7e5ef7bea3ef3b24bc4e686e9b8df16221c478f202c96ee6ce413d'
            '725e101d5298480c956a51e1ed8378f278b83954905accd8ab2371c9f3026535')

prepare() {
    cd "$_archive"
    patch -Np1 -i ../acsvm-cmake-ver.patch
}

build() {
  # Unset D_GLIBCXX_ASSERTIONS as a workaround until crashes related to it are fixed
  CXXFLAGS="$CXXFLAGS -Wp,-U_GLIBCXX_ASSERTIONS"

  cd "$_archive"
  cmake -G Ninja -Wno-dev -B build \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_C_FLAGS="-g1 -O3" \
    -DCMAKE_CXX_FLAGS=-"g1 -O3 -fpermissive" \
    -DSRB2_CONFIG_DEV_BUILD=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSRB2_SDL2_EXE_NAME="ringracers" \
    -DACSVM_INSTALL_LIB=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install "$_archive"/build
  mkdir -p "$pkgdir"/usr/bin/
  mv "$pkgdir"/usr/ringracers "$pkgdir"/usr/bin/
  install -Dm644 "$_archive"/srb2.png "$pkgdir"/usr/share/pixmaps/org.kartkrew.RingRacers.png
  install -Dm644 org.kartkrew.RingRacers.desktop "$pkgdir"/usr/share/applications/org.kartkrew.RingRacers.desktop
}
