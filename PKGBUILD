# Contributor: Daniel Kirchner <daniel at ekpyron dot org>
# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=lib32-assimp
_basename=assimp
pkgver=5.2.1
pkgrel=1
pkgdesc="Portable Open Source library to import various well-known 3D model formats in an uniform manner"
url='http://www.assimp.org/'
arch=('x86_64')
license=('BSD')
depends=('lib32-gcc-libs' 'lib32-zlib' 'lib32-minizip')
makedepends=('cmake' 'ninja')
source=("https://github.com/assimp/assimp/archive/v${pkgver}.tar.gz"
        'minizip-openfile.patch')
sha256sums=('c9cbbc8589639cd8c13f65e94a90422a70454e8fa150cf899b6038ba86e9ecff'
	    '331ce3d73b43934eaa17be5855503ea751c083c83192b00807177bcdd982d95d')

prepare() {
  cd ${_basename}-${pkgver}
  patch -p1 -i ${srcdir}/minizip-openfile.patch
}

build() {
  cd ${_basename}-${pkgver}

  cmake . \
    -B build \
    -G Ninja \
    -D ASSIMP_BUILD_ASSIMP_TOOLS=OFF \
    -D ASSIMP_BUILD_SAMPLES=OFF \
    -D ASSIMP_BUILD_TESTS=OFF \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_C_FLAGS="${CFLAGS/-march=x86_64} -march=i686 -m32" \
    -D CMAKE_CXX_FLAGS="${CXXFLAGS/-march=x86_64} -march=i686 -m32"
  ninja -C build
}

package() {
  cd ${_basename}-${pkgver}

  DESTDIR="$pkgdir" ninja -C build install

  rm -rf "$pkgdir"/usr/include
  mv "$pkgdir"/usr/lib{,32}

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
