# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Daniel Bermond < yahoo-com: danielbermond >

pkgname=nccl
pkgver=2.27.7
_upstr_pkgrel=1
pkgrel=1
pkgdesc='Library for NVIDIA multi-GPU and multi-node collective communication primitives'
arch=(x86_64)
url='https://developer.nvidia.com/nccl/'
license=(BSD-3-Clause)
depends=(glibc gcc-libs)
makedepends=(git cuda)
source=(git+https://github.com/NVIDIA/nccl.git#tag=v$pkgver-$_upstr_pkgrel)
sha256sums=('e34ea01d667b299ad61821bc02db37fa8a2d11bea44f52bfeae4f8b1321b7078')
b2sums=('6d6b36845f0dac2c5ed8f71552b84ec63e1eabb3bfa4bade2ade0adb8ebf561f3560ea9e4fc24ee38e8d8c3fdf875ee4b67dfa33031702d4017c581b3a64e2ac')

prepare() {
  cd $pkgname

  # rename BUILDDIR Makefile variable to avoid conflict with makepkg's one
  local _file
  local _filelist
  _filelist="$(find . -type f -exec grep 'BUILDDIR' {} + | awk -F':' '{ print $1 }' | uniq)"
  for _file in $_filelist
  do
    sed -i 's/BUILDDIR/_BUILDPATH/g' "$_file"
  done
}

build() {
  cd $pkgname

  # https://docs.nvidia.com/cuda/turing-compatibility-guide/index.html
  # specify as follows:
  ## PTX virtual arch: -gencode=arch=compute_XX,code=compute_XX
  ## binary cubin arch: -gencode=arch=compute_XX,code=sm_XX
  # we provide binary support on all arches, no PTX is needed
  # drop PTX to improve performance and reduce linking issues
  # keep only latest version PTX for future compatibility
  export NVCC_GENCODE="-gencode=arch=compute_52,code=sm_52 \
                       -gencode=arch=compute_53,code=sm_53 \
                       -gencode=arch=compute_60,code=sm_60 \
                       -gencode=arch=compute_61,code=sm_61 \
                       -gencode=arch=compute_62,code=sm_62 \
                       -gencode=arch=compute_70,code=sm_70 \
                       -gencode=arch=compute_72,code=sm_72 \
                       -gencode=arch=compute_75,code=sm_75 \
                       -gencode=arch=compute_80,code=sm_80 \
                       -gencode=arch=compute_86,code=sm_86 \
                       -gencode=arch=compute_87,code=sm_87 \
                       -gencode=arch=compute_89,code=sm_89 \
                       -gencode=arch=compute_90,code=sm_90 \
                       -gencode=arch=compute_90a,code=sm_90a \
                       -gencode=arch=compute_100,code=sm_100 \
                       -gencode=arch=compute_100a,code=sm_100a \
                       -gencode=arch=compute_101,code=sm_101 \
                       -gencode=arch=compute_101a,code=sm_101a \
                       -gencode=arch=compute_120,code=sm_120 \
                       -gencode=arch=compute_120a,code=sm_120a \
                       -gencode=arch=compute_120,code=compute_120"

  # do not use cudart_static, it leads to weird issues like https://github.com/NVIDIA/nccl/issues/1660
  export CUDARTLIB=cudart

  export CXXFLAGS+=" -ffat-lto-objects"
  make CXX="$NVCC_CCBIN" CUDA_HOME=/opt/cuda PREFIX=/usr src.build
}

package() {
  cd $pkgname

  make PREFIX="${pkgdir}"/usr install
  # fix permission on static lib
  chmod 644 "$pkgdir"/usr/lib/libnccl_static.a
  install -vDm 644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
