# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libopenblas
_pkgname=OpenBLAS
pkgver=0.2.20
pkgrel=1
pkgdesc="An optimized BLAS library based on GotoBLAS2 1.13 BSD"
arch=('i686' 'x86_64')
url='http://www.openblas.net'
license=('BSD')
depends=('gcc-libs')
makedepends=('perl'
             'gcc-fortran'
             )
options=(!emptydirs)
source=("${_pkgname}-v${pkgver}.tar.gz::http://github.com/xianyi/OpenBLAS/archive/v${pkgver}.tar.gz")
sha256sums=('5ef38b15d9c652985774869efd548b8e3e972e1e99475c673b25537ed7bcf394')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make \
    USE_OPENMP=1 \
    NO_AFFINITY=1 \
    MAJOR_VERSION=3 \
    NUM_THREADS="$(nproc)"

}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make \
    PREFIX="${pkgdir}/usr" \
    NUM_THREADS=$(nproc) \
    OPENBLAS_INCLUDE_DIR="${pkgdir}/usr/include/openblas" \
    MAJOR_VERSION=3 \
    install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"


  sed -e "s|${pkgdir}||" \
      -i "${pkgdir}/usr/lib/cmake/openblas/OpenBLASConfig.cmake" \
      -i "${pkgdir}/usr/lib/pkgconfig/openblas.pc"

}
