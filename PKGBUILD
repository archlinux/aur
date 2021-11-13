# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: Gianluca Pettinello <g_pet at hotmail dot com>
# Contributor: Alessandro G. Magnasco <alessandromagnasco at gmail dot com>
# Contributor: Bertrand Lacoste <bertrandlacoste at gmail dot com>
# Contributor: Tim Langlois <langlois at cs dot cornell dot edu>
# Contributor: Christian Pfeiffer <cpfeiffer at live dot de>
# Contributor: Wink Saville <wink at saville dot com>
pkgname=hypre
pkgver=2.23.0
pkgrel=1
pkgdesc="Parallel solvers for sparse linear systems featuring multigrid methods"
arch=('x86_64')
url="https://github.com/${pkgname}-space/${pkgname}"
license=('APACHE' 'MIT' 'LGPL2')
depends=('superlu' 'superlu_dist')
makedepends=('gcc-fortran')
source=(${pkgname}-${pkgver}::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('bed8426d093e2290ab443f49deffad96a64e1b3844a4236bc59af19523b16ea8bf2318db21e42ab2b8a4dd529246ba1d9a4eb0cb3bd943633569d03e6311f67f')

build() {
  cd "${pkgname}-${pkgver}/src"
  # disable internal superlu and fei for now, not sure yet how to get it to use external superlu
  CFLAGS="${CFLAGS} -fopenmp" CXXFLAGS="${CXXFLAGS} -fopenmp" LDFLAGS="${LDFLAGS} -lgomp" \
    ./configure \
    --prefix="${pkgdir}/usr" \
    --includedir="${pkgdir}/usr/include/hypre" \
    --enable-shared \
    --with-superlu \
    --with-superlu-include=/usr/include/superlu \
    --with-superlu-lib="-lsuperlu" \
    --with-dsuperlu \
    --with-dsuperlu-include=/usr/include/superlu_dist \
    --with-dsuperlu-lib="-lsuperlu_dist" \
    --with-blas \
    --with-lapack \
    --with-openmp \
    --enable-fortran \
    --with-mli \
    --with-MPI
  make
}

check() {
  cd "${pkgname}-${pkgver}/src"
  make test
}

package() {
  cd "${pkgname}-${pkgver}/src"
  make install
}
