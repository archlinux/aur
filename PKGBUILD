# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrew Eikum

pkgname=lib32-faudio
pkgver=24.01
pkgrel=1
pkgdesc="XAudio2 reimplementation"
arch=(x86_64)
url="https://github.com/FNA-XNA/FAudio/"
license=('custom:zlib')
depends=('lib32-dbus' 'lib32-sdl2' 'faudio')
makedepends=('cmake' 'ninja')
source=("https://github.com/FNA-XNA/FAudio/archive/$pkgver/faudio-$pkgver.tar.gz")
sha512sums=('e54d83716789252b8086ef7cd4a5501eadc9819f434b5dad267621db72606e1fd6302ffcb7cfadbcced10e4d8c817aa1dd46ea14755eca0ec4c0dce67fe32bd2')

prepare() {
  mkdir -p build
}

build() {
  export CC="gcc -m32 -mstackrealign"
  export CXX="g++ -m32 -mstackrealign"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd build
  cmake ../FAudio-$pkgver -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib32
  # TODO:  -DFFMPEG=ON
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  rm -r "$pkgdir"/usr/include

  install -Dm644 FAudio-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
