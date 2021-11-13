# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: Gianluca Pettinello <g_pet at hotmail dot com>
# Contributor: Christian Pfeiffer <cpfeiffer at live dot de>
pkgname=superlu_dist
pkgver=7.1.1
pkgrel=1
pkgdesc="Distributed memory, MPI based SuperLU"
arch=('x86_64')
url="https://github.com/xiaoyeli/${pkgname}"
license=('custom')
depends=('lapack' 'parmetis' 'openblas') # 'combblas'
makedepends=('cmake' 'gcc-fortran')      # 'ninja'
source=(${pkgname}-${pkgver}::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b5e4c6a99a0f71bb81170f6f90e6300d584ada608dd31d43f8bb3aa5ad6e4ba00f75043bbe14899d6f8bdb597552ef6eeb3cc1db20e06798421de71d810b32ee')
options=('staticlibs')

# prepare() {
#   # CombBLAS uses C++14 in its headers. Otherwise the code won't build
#   sed -i "s/set(CMAKE_CXX_STANDARD 11)/set(CMAKE_CXX_STANDARD 14)/" "${pkgname}-${pkgver}/CMakeLists.txt"
# }

# -DTPL_ENABLE_COMBBLASLIB=ON \
# -DTPL_COMBBLAS_INCLUDE_DIRS="/usr/include/CombBLAS;/usr/include/CombBLAS/BipartiteMatchings" \
# -DTPL_COMBBLAS_LIBRARIES="/usr/lib/libCombBLAS.so" \
# -DCMAKE_INSTALL_LIBDIR=lib \

build() {
  cmake \
    -S ${pkgname}-${pkgver} \
    -B build-cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_CXX_STANDARD=14 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_Fortran_COMPILER=gfortran \
    -DTPL_PARMETIS_INCLUDE_DIRS="/usr/include" \
    -DTPL_PARMETIS_LIBRARIES="/usr/lib/libparmetis.so" \
    -DTPL_ENABLE_INTERNAL_BLASLIB=OFF \
    -DTPL_ENABLE_LAPACKLIB=ON \
    -DCMAKE_INSTALL_INCLUDEDIR=include/superlu_dist \
    -Wno-dev
  cmake --build build-cmake --target all
}

# check() {
#   ctest -E "pdtest_*" --test-dir build-cmake
# }

package() {
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -Dm644 ${pkgname}-${pkgver}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 ${pkgname}-${pkgver}/License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 ${pkgname}-${pkgver}/DOC/ug.pdf "${pkgdir}/usr/share/doc/${pkgname}/ug.pdf"
}
