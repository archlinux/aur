# Maintainer: Mihai Coman <mihai@m1x.ro>
# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: jepaan <jepaan at hotmail dot com>

pkgname=libassimp5-compat
origpkgname=assimp
pkgver=5.4.3
pkgrel=1
pkgdesc="Library to import various well-known 3D model formats in an uniform manner"
arch=('x86_64')
license=('BSD')
depends=('zlib' 'gcc-libs')
makedepends=('cmake' 'ninja')
url='https://github.com/assimp/assimp'
source=("$origpkgname-$pkgver.tar.gz::https://github.com/assimp/assimp/archive/v${pkgver}.tar.gz")
sha512sums=('4738db84068d36face8caf61c0789178fdfc1310fa8e81ffb9b025e14183bde546b784d691c92438ab310a79ab7b75ab62ee0247d5f01e81ddf04fb94b7a9c0b')

build() {
  cd ${origpkgname}-${pkgver}

  cmake \
    -Bbuild \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DASSIMP_BUILD_SAMPLES=OFF \
    -DASSIMP_WARNINGS_AS_ERRORS=OFF \
    -DASSIMP_BUILD_ASSIMP_TOOLS=ON \
    -DASSIMP_BUILD_ZLIB=OFF
  ninja -C build
}

package()  {
  cd ${origpkgname}-${pkgver}

  DESTDIR="$pkgdir" ninja -C build install

  rm -rfv "${pkgdir}/usr/"{include,bin,share}
  rm -rfv "${pkgdir}"/usr/lib/{lib*.so,pkgconfig,cmake}
}
