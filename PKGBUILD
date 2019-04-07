# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=allegro4
pkgname=lib32-$_pkgbase
pkgver=4.4.3.1
pkgrel=1
pkgdesc='Portable library aimed at video game and multimedia programming (legacy version, 32 bit)'
arch=('x86_64')
url='https://liballeg.org/'
license=('custom')
depends=('lib32-jack' 'lib32-libxcursor' 'lib32-libxpm' 'lib32-libxxf86dga' 'lib32-libxxf86vm'
         'lib32-libpng' 'lib32-glu' "$_pkgbase>=$pkgver")
makedepends=('cmake' 'lib32-mesa' 'gcc-multilib' 'ninja')
options=(staticlibs)
source=("https://github.com/liballeg/allegro5/releases/download/$pkgver/allegro-$pkgver.tar.gz")
sha256sums=('ec19dbc9a021244582b4819b3583ee594b50141f9fcf6944a4ed8069cbf8d4d4')

build() {
  rm -rf build

  cmake allegro-$pkgver -Bbuild \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_LIBRARY_PATH=/usr/lib32 \
    -DWANT_DOCS=OFF \
    -DWANT_TOOLS=OFF \
    -DWANT_EXAMPLES=OFF \
    -DWANT_TESTS=OFF \
    -DLIB_SUFFIX="32" \
    -DCMAKE_C_FLAGS="$CFLAGS -m32" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -m32" \
    -GNinja
  cmake --build build
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install

  # remove header files
  rm -rf "$pkgdir"/usr/include

  # rename allegro-config
  mv "$pkgdir"/usr/bin/allegro-config{,-32}

  # link to license
  install -d "$pkgdir"/usr/share/licenses/
  ln -s $_pkgbase "$pkgdir"/usr/share/licenses/$pkgname
}
