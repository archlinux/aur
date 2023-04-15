# Maintainer: haxibami <contact at haxibami dot net>

pkgname=xkblas
pkgver=0.4_rc7
_ver=0.4-rc7
pkgrel=1
_rel=0
_hash=g513c021b
pkgdesc="a drop in replacement of blas library for multi-GPUs servers"
arch=('any')
url="https://gitlab.inria.fr/xkblas"
license=("CeCILL-C")
depends=('blas' 'hipblas' 'rocm-smi-lib' 'intel-oneapi-mkl' 'cuda')
makedepends=('cmake' 'hipify-clang')
source=(
  "https://gitlab.inria.fr/xkblas/versions/-/raw/master/xkblas-v${_ver}-${_rel}-${_hash}.tgz"
)
sha256sums=(
  "7079d50518b10c75043aa360d93ecf9c6f0eadb3a7f4b959927674835852e62f"
)
build() {
  cd "${srcdir}/xkblas-v${_ver}-${_rel}-${_hash}"
  mkdir build && cd build
  export ROCM_PATH=/opt/rocm HIP_PATH=/opt/rocm/hip
  export PATH=/opt/rocm/bin:/opt/rocm/hip/bin:$PATH
  # default is to use HIP & MKL, but we can also use CUDA OR openblas
  cmake .. -DKAAPI_USE_CUDA_RT=OFF -DKAAPI_USE_HIP=ON -DKAAPI_USE_MKL=ON \
    -DKAAPI_USE_TRACE=OFF -DKAAPI_USE_PERFCTR=OFF -DCMAKE_BUILD_TYPE=Release \
    -DROCSMI_PREFIX=/opt/rocm/rocm_smi -DCMAKE_INSTALL_PREFIX=/usr
  make -j
}

package() {
  cd "${srcdir}/xkblas-v${_ver}-${_rel}-${_hash}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}
