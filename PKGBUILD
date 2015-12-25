# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=lib32-libsquish
pkgver=1.13
pkgrel=1
pkgdesc='DXT compression library'
depends=('lib32-gcc-libs' 'libsquish')
arch=('x86_64')
url='http://sourceforge.net/projects/libsquish/'
license=('MIT')
source=("http://downloads.sourceforge.net/project/libsquish/libsquish-${pkgver}.tgz")
md5sums=('ca4b9563953ad6ea9c43f7831a8c50c7')

build() {
  rm -rf "$srcdir/build" && mkdir -p "$srcdir/build" && cd "$srcdir/build"

  cmake \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_C_FLAGS="-march=i686 -m32 ${CFLAGS/-march=x86-64}" \
    -D CMAKE_CXX_FLAGS="-march=i686 -m32 ${CXXFLAGS/-march=x86-64}" \
    -D BUILD_SHARED_LIBS=ON \
    ..

  make
}

package() {
  cd "$srcdir/build"

  cmake -D CMAKE_INSTALL_PREFIX="$pkgdir/usr" -P cmake_install.cmake
  mv "$pkgdir/usr/lib" "$pkgdir/usr/lib32"
  rm -rf "$pkgdir/usr/include"

  install -Dm 644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
