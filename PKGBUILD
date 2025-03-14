# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: Christos Tsirigotis <tsirif \at/ gmail \dot/ com>
pkgname=nccl-git
_name="${pkgname%%-git}"
pkgver=2.26.2.1.r0.f44ac75
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
  export NVCC_GENCODE="-gencode=arch=compute_70,code=sm_70 \
                       -gencode=arch=compute_80,code=sm_80 \
                       -gencode=arch=compute_90,code=sm_90 \
                       -gencode=arch=compute_100,code=sm_100 \
                       -gencode=arch=compute_120,code=sm_120 \
                       -gencode=arch=compute_70,code=compute_70 \
                       -gencode=arch=compute_80,code=compute_80 \
                       -gencode=arch=compute_90,code=compute_90 \
                       -gencode=arch=compute_120,code=compute_120"

  export CXXFLAGS+=" -ffat-lto-objects"
  make CXX="$NVCC_CCBIN" CUDA_HOME=/opt/cuda PREFIX=/usr src.build
}


package() {
  cd "${_name}"
  make CUDA_HOME=/opt/cuda PREFIX="${pkgdir}"/usr install

  # fix permission on static lib
  chmod 644 "${pkgdir}"/usr/lib/libnccl_static.a
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}
