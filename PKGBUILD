# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libopenblas
_pkgname=OpenBLAS
pkgver=0.2.19
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
sha256sums=('9c40b5e4970f27c5f6911cb0a28aa26b6c83f17418b69f8e5a116bb983ca8557')

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


  sed -i -e "s%${pkgdir}%%" "${pkgdir}/usr/lib/cmake/openblas/OpenBLASConfig.cmake"
}
