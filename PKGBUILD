# Maintainer: steelt <steeltitanium1 at gmail dot com>
# Contributor: steelt <steeltitanium1 at gmail dot com>

pkgname=ringracers
pkgver=2.2
_dataver=2.2
pkgrel=2
pkgdesc="Kart racing video game originally based on the 3D Sonic the Hedgehog fangame Sonic Robo Blast 2"
arch=('x86_64' 'aarch64')
license=('GPL2')
url='https://www.kartkrew.org'
depends=("ringracers-data>=$_dataver" 'curl' 'zlib' 'libpng' 'libvorbis' 'libvpx' 'libyuv' 'sdl2')
makedepends=('cmake' 'ninja' 'mold')
_archive="RingRacers-$pkgver"

source=("$pkgname-$pkgver.tar.gz"::"https://github.com/KartKrewDev/RingRacers/archive/refs/tags/v$pkgver.tar.gz"
  "org.kartkrew.RingRacers.desktop"
  "0001-rapidjson-remove-non-compiling-assignment-operator.patch")

sha256sums=('cf68c9fefba8e3b8e8c737b5e88aed87d5a67591991719f9b344e26ab7ea4c80'
            '812a12ad6a7e5ef7bea3ef3b24bc4e686e9b8df16221c478f202c96ee6ce413d'
            '332639804a1b221d44befc903c14d86d98419c343f39d3d1ad525df6e496871b')

prepare() {
    patch -N -d $_archive -i ../0001-rapidjson-remove-non-compiling-assignment-operator.patch -p 1
}

build() {
  # Unset U_GLIBCXX_ASSERTIONS as a workaround until crashes related to it are fixed
  CXXFLAGS="$CXXFLAGS -Wp,-U_GLIBCXX_ASSERTIONS"

  cd "$_archive"
  cmake -G Ninja -Wno-dev -B build \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_LINKER_TYPE='MOLD' \
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