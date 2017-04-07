# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=lib32-libsquish
pkgver=1.15
pkgrel=1
pkgdesc='DXT compression library'
depends=('lib32-gcc-libs' 'libsquish')
makedepends=('cmake')
arch=('x86_64')
url='http://sourceforge.net/projects/libsquish/'
license=('MIT')
source=("http://downloads.sourceforge.net/project/libsquish/libsquish-${pkgver}.tgz")
md5sums=('c02645800131e55b519ff8dbe7284f93')

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

  install -Dm 644 ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
