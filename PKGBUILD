# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Gaël Donval <gdonval+aur at google mail>
pkgname=dynd
pkgver=0.7.2
pkgrel=2
pkgdesc="C++ dynamic ndarray library, with Python exposure"
groups=('blaze-ecosystem')
arch=('x86_64')
url="http://lib${pkgname}.org"
license=('custom:BSD-2-clause')
depends=(fftw llvm)
makedepends=(cmake)
source=(https://github.com/lib${pkgname}/lib${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('134195ba5839e05af07dd9ad0b8e749a83345511acd2a22a029a4d9a2c0fc77a8a1f36722bce20653d28189b7883afe7feb651c7d32ff921ef257a8a9aa4bd7f')

# -DBUILD_SHARED_LIBS=TRUE \
# -DCMAKE_INSTALL_LIBDIR=lib \
# -DFFTW_PATH=/usr/include \
build() {
  # https://stackoverflow.com/a/28279475/9302545
  # https://stackoverflow.com/a/11561340/9302545
  cmake \
    -S lib${pkgname}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_FLAGS="-Wno-error=tautological-compare -Wno-error=class-memaccess -Wno-error=deprecated-copy -Wno-error=implicit-fallthrough -Wno-error=parentheses" \
    -DCMAKE_CXX_STANDARD=14 \
    -DCMAKE_CXX_COMPILER=g++ \
    -DDYND_SHARED_LIB=ON \
    -DDYND_LLVM=ON \
    -DDYND_FFTW=ON \
    -DDYND_BUILD_TESTS=OFF \
    -DDYND_BUILD_BENCHMARKS=OFF \
    -DDYND_BUILD_PLUGINS=OFF \
    -DDYND_BUILD_DOCS=OFF \
    -DDYND_COVERAGE=OFF \
    -Wno-dev
  cmake --build build --target all
}

# check() {
#   cmake --build build --target test_libdynd
# }

package_dynd() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 lib${pkgname}-${pkgver}/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 lib${pkgname}-${pkgver}/README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
