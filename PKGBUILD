# Maintainer: steelt <steeltitanium1 at gmail dot com>
# Contributor: steelt <steeltitanium1 at gmail dot com>

pkgname=ringracers
pkgver=2.4
_dataver=2.4
_commit="e3daa1bbef09497fbd62668315d2eff4c20384c1"
pkgrel=2
pkgdesc="Kart racing video game originally based on the 3D Sonic the Hedgehog fangame Sonic Robo Blast 2"
arch=('x86_64' 'aarch64')
license=(GPL-2.0)
url='https://www.kartkrew.org'
depends=("ringracers-data>=$_dataver" 'curl' 'zlib' 'libpng' 'libvorbis' 'libvpx' 'libyuv' 'sdl2' 'opus')
makedepends=('cmake' 'ninja')
_archive="RingRacers-$_commit"

source=("$pkgname-$pkgver.tar.gz"::"https://github.com/KartKrewDev/RingRacers/archive/$_commit.tar.gz"
  "org.kartkrew.RingRacers.desktop")

sha256sums=('6b25ab52cd449f0b295b9742d64a8a9c1cd3d1707c1b37fbef8c0dd092d3e004'
            '812a12ad6a7e5ef7bea3ef3b24bc4e686e9b8df16221c478f202c96ee6ce413d')

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
