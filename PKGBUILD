# Maintainer: Filip Matzner <floop@floop.cz>
# Contributor: Benoît Allard <benoit.allard@gmx.de>
# Contributor: Oliver Mader <b52@reaktor42.de>

pkgname=libcmaes-openmp
pkgver=0.10
pkgrel=2
pkgdesc="C++11 library with Python bindings for high performance blackbox stochastic optimization using the CMA-ES algorithm for Covariance Matrix Adaptation Evolution Strategy. Build with OpenMP support."
url="https://github.com/CMA-ES/libcmaes"
arch=('x86_64' 'i686')
license=('LGPLv3')
depends=('gcc-libs')
optdepends=('boost-libs: Python support' 'python-numpy: Python support')
makedepends=('eigen' 'boost' 'python-numpy' 'clang' 'openmp' 'ninja' 'python-setuptools')
source=("libcmaes-${pkgver}.tar.gz::https://github.com/CMA-ES/libcmaes/archive/v${pkgver}.tar.gz")
sha256sums=('a77fb892654356c5657dd677161b7c67b196dc732cfb77eaca6708abc4f6cffc')
conflicts=('libcmaes' 'libcmaes-debug')

build() {
  cd "${srcdir}/libcmaes-${pkgver}"

  cmake \
    -GNinja \
    -Bbuild \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DLIBCMAES_BUILD_PYTHON=ON \
    -DLIBCMAES_BUILD_TESTS=OFF
  cmake --build build
}

package() {
  cd "${srcdir}/libcmaes-${pkgver}"

  DESTDIR="${pkgdir}/" ninja -C build install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/libcmaes/COPYING"
}
