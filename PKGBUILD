# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrew Eikum

pkgname=lib32-faudio
pkgver=24.06
pkgrel=1
pkgdesc="XAudio2 reimplementation"
arch=(x86_64)
url="https://github.com/FNA-XNA/FAudio/"
license=('custom:zlib')
depends=('lib32-dbus' 'lib32-sdl2' 'faudio')
makedepends=('cmake' 'ninja')
source=("https://github.com/FNA-XNA/FAudio/archive/$pkgver/faudio-$pkgver.tar.gz")
sha512sums=('d8fb3c2303c81163a26f437edce5ae428f4769a28107eb21f1fdb637421480928fc6f0031fc053caa762db901d659336a6e2ffad78ece9ab03ba4f312b00deb6')

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
