_pkgname=faiss
pkgbase=faiss-mkl
pkgname=('faiss-mkl')
arch=('i686' 'x86_64')
url="https://github.com/facebookresearch/faiss"
license=('MIT')
pkgver=1.7.2
pkgrel=1
source=(faiss-${pkgver}.zip::https://github.com/facebookresearch/faiss/archive/refs/tags/v${pkgver}.zip)
sha256sums=('bd583f711c15bf9dc8247ccdf0884b971887e2c4679d11f7403b18ab2a4742d8')
depends=('blas' 'lapack' 'intel-mkl')
makedepends=('git' 'cmake')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  mkdir -p build
  cd build
  cmake .. \
    -DFAISS_ENABLE_GPU=OFF \
    -DFAISS_ENABLE_PYTHON=OFF \
    -DBUILD_TESTING=OFF \
    -DBLA_VENDOR=Intel10_64_dyn \
    -DMKL_LIBRARIES=/opt/intel/mkl \
    -DFAISS_OPT_LEVEL=avx2 \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/build"
  make -j${_NPROC}
}

package() {
  pkgdesc='A library for efficient similarity search and clustering of dense vectors (with MKL+AVX2 support).'
  provides=('faiss')
  conflicts=('faiss')
  cd "${srcdir}/${_pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir" install
  cd ..
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
