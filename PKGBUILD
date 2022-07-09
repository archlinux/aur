# Contributor: Daniel Kirchner <daniel at ekpyron dot org>
# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=lib32-assimp
_basename=assimp
pkgver=5.2.4
pkgrel=1
pkgdesc='Library to import various well-known 3D model formats in an uniform manner'
url='http://www.assimp.org/'
arch=('x86_64')
license=('BSD')
depends=('lib32-gcc-libs' 'lib32-zlib' 'lib32-minizip')
makedepends=('cmake' 'ninja')
source=("https://github.com/assimp/assimp/archive/v${pkgver}.tar.gz"
        'minizip-openfile.patch')
sha512sums=('ee988b1806b46c78f97bb5b25237a3f56a7028ed37898fb9b243e379e29e8bfd29e4dffc616566941ed9bdcf502bd30568904ad2ef2ef7d0f63b40daefdc66bf'
            '76cbabac99a22597209c9f5e6f266f8b0d318bdad3e681ba851d406630d9fda2a7c1a36a6a374eb6d2a7c751e1e6a60e1d4672ae83b5c25beed943c5cb2dead5')

prepare() {
  cd "${_basename}-${pkgver}"
  patch -p1 -i "${srcdir}/minizip-openfile.patch"
}

build() {
  cd "${_basename}-${pkgver}"

  cmake . \
    -B build \
    -G Ninja \
    -D ASSIMP_BUILD_ASSIMP_TOOLS=OFF \
    -D ASSIMP_BUILD_SAMPLES=OFF \
    -D ASSIMP_BUILD_TESTS=OFF \
    -D ASSIMP_WARNINGS_AS_ERRORS=OFF \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_C_FLAGS="${CFLAGS/-march=x86_64} -march=i686 -m32" \
    -D CMAKE_CXX_FLAGS="${CXXFLAGS/-march=x86_64} -march=i686 -m32"
  ninja -C build
}

package() {
  cd "${_basename}-${pkgver}"

  DESTDIR="${pkgdir}" ninja -C build install

  rm -rf "${pkgdir}/usr/include"
  mv "${pkgdir}"/usr/lib{,32}

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
