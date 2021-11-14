# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrew Eikum

pkgname=faudio
pkgver=21.11
pkgrel=1
pkgdesc="XAudio2 reimplementation"
arch=(x86_64)
url="https://github.com/FNA-XNA/FAudio/"
license=('custom:zlib')
depends=('sdl2' 'gst-libav')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FNA-XNA/FAudio/archive/$pkgver.tar.gz"
         https://github.com/FNA-XNA/FAudio/commit/de0c1f83.patch)
sha512sums=('b5e40e7c6aa83bb08376227d92d707e6d18f8391fbd0d4adec9d2b6a61dbd5851c95861eccba48b8aac69476880d70d8ea4f6a2942c9b631f87778b5ee3f2f6a'
            'f7db327c78486659feca6a578329bde43a320e106c25a66f221526a86ad65dfb1079f99f85fc76abc8ca38a858bc162f6ab4aaaa8ff8cc69e3e7e56fd724c014')

prepare() {
  mkdir -p build

# Fix build
  patch -d FAudio-$pkgver -p1 < de0c1f83.patch
}

build() {
  cd build
  cmake ../FAudio-$pkgver -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DGSTREAMER=ON
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 FAudio-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
