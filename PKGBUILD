# Maintainer: piernov <piernov@piernov.org>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Daniel Bermond < yahoo-com: danielbermond >

pkgname=nccl-cuda12.9
_pkgname=nccl
pkgver=2.30.4
_upstr_pkgrel=1
pkgrel=1
pkgdesc='Library for NVIDIA multi-GPU and multi-node collective communication primitives (Maxwell/Pascal/Volta support)'
arch=(x86_64)
url='https://developer.nvidia.com/nccl/'
license=(BSD-3-Clause)
provides=(nccl)
conflicts=(nccl)
depends=(
  glibc
  libgcc
  libstdc++
)
makedepends=(
  gcc14
  git
  "cuda=12.9"
  python3
)
source=(git+https://github.com/NVIDIA/nccl.git#tag=v$pkgver-$_upstr_pkgrel
        fix-cc5.2-for-pytorch.patch)
sha256sums=('cb7e7e7b5c9837d0d3bd8724b9dfe576314710f039d66f8a3eb15d42518795d1'
            '7fc5a7aa085340afbefb33594fea31717b403245e3046112b8603555a3117620')
b2sums=('50040a09c7dd94507f4d5d5410d2076826349492e1f7dbfac8ac7b2eac8a7da1450f29e811e1fd93b8fd2e29058fde72cc0ce794d839dff19c0e58073d3d432c'
        '61b6764eec5288448010d5114f22ef6e951aac721d690d8ec9d60c203ff1bded4a5f3d24acf2453c5e16c8abc8875c59d13443fb96820bc665480bc9e779dff9')

prepare() {
  cd $_pkgname

  # rename BUILDDIR Makefile variable to avoid conflict with makepkg's one
  local _file
  local _filelist
  _filelist="$(find . -type f -exec grep 'BUILDDIR' {} + | awk -F':' '{ print $1 }' | uniq)"
  for _file in $_filelist
  do
    sed -i 's/BUILDDIR/_BUILDPATH/g' "$_file"
  done

  patch -p1 -i "${srcdir}/fix-cc5.2-for-pytorch.patch"
}

build() {
  cd $_pkgname

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
                       -gencode=arch=compute_72,code=sm_72"

  # do not use cudart_static, it leads to weird issues like https://github.com/NVIDIA/nccl/issues/1660
  export CUDARTLIB=cudart

  export CXXFLAGS+=" -ffat-lto-objects"
  make CXX="$NVCC_CCBIN" CUDA_HOME=/opt/cuda PREFIX=/usr src.build
}

package() {
  cd $_pkgname

  make CUDA_HOME=/opt/cuda PREFIX="${pkgdir}"/usr install

  # remove static libs
  rm "$pkgdir"/usr/lib/*.a

  install -vDm 644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$_pkgname/
}
