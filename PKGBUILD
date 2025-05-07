# Contributor: Daniel Kirchner <daniel at ekpyron dot org>
# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=lib32-assimp
_basename=assimp
pkgver=5.4.3
pkgrel=1
pkgdesc='Library to import various well-known 3D model formats in an uniform manner'
url='http://www.assimp.org/'
arch=('x86_64')
license=('BSD')
depends=('lib32-gcc-libs' 'lib32-zlib' 'lib32-minizip')
makedepends=('cmake' 'ninja')
source=("https://github.com/assimp/assimp/archive/v${pkgver}.tar.gz"
        'minizip-openfile.patch')
sha512sums=('4738db84068d36face8caf61c0789178fdfc1310fa8e81ffb9b025e14183bde546b784d691c92438ab310a79ab7b75ab62ee0247d5f01e81ddf04fb94b7a9c0b'
            '76cbabac99a22597209c9f5e6f266f8b0d318bdad3e681ba851d406630d9fda2a7c1a36a6a374eb6d2a7c751e1e6a60e1d4672ae83b5c25beed943c5cb2dead5')

build() {
  cd "${_basename}-${pkgver}"

  cmake . \
    -B build \
    -G Ninja \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_C_FLAGS="${CFLAGS/-march=x86_64} -march=i686 -m32" \
    -D CMAKE_CXX_FLAGS="${CXXFLAGS/-march=x86_64} -march=i686 -m32" \
    -D ASSIMP_BUILD_ASSIMP_TOOLS=OFF \
    -D ASSIMP_BUILD_SAMPLES=OFF \
    -D ASSIMP_BUILD_TESTS=OFF \
    -D ASSIMP_WARNINGS_AS_ERRORS=OFF
  ninja -C build
}

package() {
  cd "${_basename}-${pkgver}"

  DESTDIR="${pkgdir}" ninja -C build install

  rm -rf "${pkgdir}/usr/include"
  mv "${pkgdir}"/usr/lib{,32}

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
