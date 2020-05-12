# Maintainer: Michael Straube <michael.straube@posteo.de>
# Contributor: Sebastian Wolf <fatmike303 at googlemail dot com>

pkgname=chipmachine
pkgver=1.4b3
pkgrel=5
pkgdesc='Demoscene/Retro Music Player'
arch=('x86_64')
url='https://github.com/sasq64/chipmachine'
license=('MIT')
depends=('mpg123' 'glew' 'glfw' 'curl' 'fftw')
makedepends=('cmake' 'vim' 'gendesk')
source=("chipmachine-v1.4b3.tar.gz::https://github.com/sasq64/chipmachine/archive/v1.4b3.tar.gz"
        "apone-chipmachine-v1.4b3.tar.gz::https://github.com/sasq64/apone/archive/chipmachine-v1.4b3.tar.gz"
        "apone-chipmachine-v1.4b3-datadir.patch")
sha512sums=('c1e93c4e75658cc24bef6156ab8e207e74f0dd998403cab073ed38b7198ac74ea8ddfb3caf38a7496734af5bb1d9cfbc029ffb7a1728613d534a80f9f8e9d3ac'
            '0341b6b9bf32aae6d7e7a8a1f4440f1f6cfd8c62595b1832d98a12234d2dfc1361199210529d880b31a10652b5f2e4d8ea1e3a9f4d92c5035e69a01e0eb952a4'
            '5c65a59657467b85fdd380e0e6e44acbe1c46345dd4079f72801c545c105e1bfd4274b7de3d603d55d68079114455b5bc0b009e6e587cb9d29d0f8d8582de252')

prepare() {
  cd $pkgname-$pkgver
  gendesk -f -n --pkgname="$pkgname" --pkgdesc="$pkgdesc" --categories="AudioVideo"
  mv ../apone-chipmachine-v1.4b3 apone
  patch -p0 -i ../apone-chipmachine-v1.4b3-datadir.patch
  sed -i '/link_directories(\/usr\/local\/lib)/d' CMakeLists.txt  # remove insecure rpath
  mkdir -p ../build
}

build() {
  cd build

  # Workaround for gcc10 linking errors
  export CFLAGS+=" -fcommon"

  cmake ../$pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 ../build/chipmachine "$pkgdir"/usr/bin/chipmachine
#  install -Dm755 ../build/cm "$pkgdir"/usr/bin/cm
  install -d "$pkgdir"/usr/share/chipmachine
  cp -r data lua "$pkgdir"/usr/share/chipmachine/
  install -Dm644 chipmachine.desktop "$pkgdir"/usr/share/applications/chipmachine.desktop
  install -Dm644 note.png "$pkgdir"/usr/share/pixmaps/chipmachine.png
  install -Dm644 apone/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
