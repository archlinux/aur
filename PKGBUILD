# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrew Eikum

pkgname=lib32-faudio
pkgver=24.02
pkgrel=1
pkgdesc="XAudio2 reimplementation"
arch=(x86_64)
url="https://github.com/FNA-XNA/FAudio/"
license=('custom:zlib')
depends=('lib32-dbus' 'lib32-sdl2' 'faudio')
makedepends=('cmake' 'ninja')
source=("https://github.com/FNA-XNA/FAudio/archive/$pkgver/faudio-$pkgver.tar.gz")
sha512sums=('de48196bc9d93784d2f2ce20c7aba83066a8a7653781104eb3b15fa8206e54875d5c555dab4c6fb763cf41fd6ec733e71b6bba53c8cafd98af99ea9eb0a3d666')

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
