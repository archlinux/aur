# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrew Eikum

pkgname=lib32-faudio
pkgver=25.11
pkgrel=1
pkgdesc="XAudio2 reimplementation"
arch=(x86_64)
url="https://github.com/FNA-XNA/FAudio/"
license=('custom:zlib')
depends=('lib32-dbus' 'lib32-sdl2' 'faudio')
makedepends=('cmake' 'ninja')
source=("https://github.com/FNA-XNA/FAudio/archive/$pkgver/faudio-$pkgver.tar.gz")
sha512sums=('00a3b6d7eb1fa91547f06fc0ec9bd9e7f956d2244568da3ba5144641113a6040c94c0b1d0b32da37ac1a4b51de8322afb8947c5d8817dc1e6de3214f086ee554')

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
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  # TODO:  -DFFMPEG=ON
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  rm -r "$pkgdir"/usr/include

  install -Dm644 FAudio-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
