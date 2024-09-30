# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: Christos Tsirigotis <tsirif \at/ gmail \dot/ com>
pkgname=nccl-git
_name="${pkgname%%-git}"
pkgver=2.23.4.1.r3.2ea4ee9
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
                       -gencode=arch=compute_75,code=sm_75 \
                       -gencode=arch=compute_80,code=sm_80 \
                       -gencode=arch=compute_86,code=sm_86 \
                       -gencode=arch=compute_89,code=sm_89 \
                       -gencode=arch=compute_90,code=sm_90 \
                       -gencode=arch=compute_90,code=compute_90"

  export CXXFLAGS+=" -ffat-lto-objects"
  make CXX=$NVCC_CCBIN CUDA_HOME=/opt/cuda PREFIX=/usr src.build
}


package() {
  cd "${_name}"
  make CUDA_HOME=/opt/cuda PREFIX="${pkgdir}"/usr install

  # fix permission on static lib
  chmod 644 "${pkgdir}"/usr/lib/libnccl_static.a
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}
