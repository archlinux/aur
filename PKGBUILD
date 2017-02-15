# Contributor: Daniel Kirchner <daniel at ekpyron dot org>
# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=lib32-assimp
_basename=assimp
pkgver=3.3.1
pkgrel=1
pkgdesc="Portable Open Source library to import various well-known 3D model formats in an uniform manner"
url='http://assimp.sourceforge.net/index.html'
arch=('x86_64')
license=('BSD')
depends=('lib32-gcc-libs' 'lib32-zlib' 'lib32-minizip')
makedepends=('cmake')
source=("https://github.com/assimp/assimp/archive/v${pkgver}.tar.gz")
md5sums=('fc57b024e80ebb13301bd0983826cad3')

build()
{
  cd ${srcdir}

  rm -rf build && mkdir build && cd build

  cmake \
    -D ASSIMP_BUILD_ASSIMP_TOOLS=OFF \
    -D ASSIMP_BUILD_SAMPLES=OFF \
    -D ASSIMP_BUILD_TESTS=OFF \
    -D CMAKE_INSTALL_PREFIX="/usr" \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_C_FLAGS="${CFLAGS/-march=x86_64} -march=i686 -m32" \
    -D CMAKE_CXX_FLAGS="${CXXFLAGS/-march=x86_64} -march=i686 -m32" \
    ../${_basename}-${pkgver}
  make
}

package()
{
  cd ${srcdir}/build

  make DESTDIR=$pkgdir install
  rm -rf ${pkgdir}/usr/include
  mv ${pkgdir}/usr/lib ${pkgdir}/usr/lib32

  install -Dm644 ${srcdir}/${_basename}-${pkgver}/LICENSE \
		 ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
