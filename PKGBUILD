# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Daniel Bermond < yahoo-com: danielbermond >

pkgname=nccl
pkgver=2.30.7
_upstr_pkgrel=1
pkgrel=1
pkgdesc='Library for NVIDIA multi-GPU and multi-node collective communication primitives'
arch=(x86_64)
url='https://developer.nvidia.com/nccl/'
license=(BSD-3-Clause)
depends=(
  glibc
  libgcc
  libstdc++
)
makedepends=(
  git
  cuda
)
source=(git+https://github.com/NVIDIA/nccl.git#tag=v$pkgver-$_upstr_pkgrel)
sha256sums=('304b5450651ee0d8d7241645ae9fb98e3700086b3dad33e11ca6687a81667a9f')
b2sums=('129e880d2d584add18560d8f9c1e890072d6bea8ded1e93a47afc63b1ea5a2249144cac30d97e35bd38b137a8272989af01564f09f8abe181149c6249fc9c625')

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
  export NVCC_GENCODE="-gencode=arch=compute_75,code=sm_75 \
                       -gencode=arch=compute_80,code=sm_80 \
                       -gencode=arch=compute_86,code=sm_86 \
                       -gencode=arch=compute_87,code=sm_87 \
                       -gencode=arch=compute_88,code=sm_88 \
                       -gencode=arch=compute_89,code=sm_89 \
                       -gencode=arch=compute_90,code=sm_90 \
                       -gencode=arch=compute_100,code=sm_100 \
                       -gencode=arch=compute_103,code=sm_103 \
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
  cd $pkgname

  make CUDA_HOME=/opt/cuda PREFIX="${pkgdir}"/usr install

  # remove static libs
  rm "$pkgdir"/usr/lib/*.a

  install -vDm 644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
