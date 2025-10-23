# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: Christos Tsirigotis <tsirif \at/ gmail \dot/ com>
pkgname=nccl-git
_name="${pkgname%%-git}"
pkgver=2.28.7.1.r0.ae7aed1
pkgrel=1
pkgdesc='Library for NVIDIA multi-GPU and multi-node collective communication primitives'
arch=('x86_64')
url='https://github.com/NVIDIA/nccl.git'
license=('BSD')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cuda')
optdepends=('openmpi: Use NCCL with MPI')
provides=('nccl')
conflicts=('nccl')
source=("git+https://github.com/NVIDIA/nccl.git")
md5sums=('SKIP')

pkgver() {
  git -C "${_name}" describe --long --tags --abbrev=7 | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^.//'
}

build() {
  cd "${_name}"
  export NVCC_GENCODE="-gencode=arch=compute_80,code=sm_80 \
                       -gencode=arch=compute_90,code=sm_90 \
                       -gencode=arch=compute_100,code=sm_100 \
                       -gencode=arch=compute_110,code=sm_110 \
                       -gencode=arch=compute_120,code=sm_120 \
                       -gencode=arch=compute_121,code=sm_121 \
                       -gencode=arch=compute_121,code=compute_121"

  # do not use cudart_static, it leads to weird issues like https://github.com/NVIDIA/nccl/issues/1660
  export CUDARTLIB=cudart

  export CXXFLAGS+=" -ffat-lto-objects"
  make CXX="$NVCC_CCBIN" CUDA_HOME=/opt/cuda PREFIX=/usr src.build
}


package() {
  cd "${_name}"
  make CUDA_HOME=/opt/cuda PREFIX="${pkgdir}"/usr install

  # fix permission on static lib
  chmod 644 "${pkgdir}"/usr/lib/libnccl_static.a
  install -vDm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${_name}/"
}
