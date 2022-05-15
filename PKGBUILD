# Maintainer: Michael Straube <michael.straubej@gmail.com>
# Contributor: Sebastian Wolf <fatmike303 at googlemail dot com>

pkgname=chipmachine
pkgver=1.4b3
pkgrel=8
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
  ln -sf ../apone-chipmachine-v1.4b3 apone
  patch -d apone -Np1 -i ../apone-chipmachine-v1.4b3-datadir.patch
}

build() {
  export CFLAGS+=" -fcommon -fno-lto -Wno-error=format-security"

  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_SKIP_RPATH=YES \
    -Wno-dev
  make -C build
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 ../build/chipmachine "$pkgdir"/usr/bin/chipmachine
  install -d "$pkgdir"/usr/share/chipmachine
  cp -r data lua "$pkgdir"/usr/share/chipmachine/
  install -Dm644 chipmachine.desktop "$pkgdir"/usr/share/applications/chipmachine.desktop
  install -Dm644 note.png "$pkgdir"/usr/share/pixmaps/chipmachine.png
  install -Dm644 apone/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
