# Maintainer: piernov <piernov@piernov.org>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Daniel Bermond < yahoo-com: danielbermond >

pkgname=nccl-cuda12.9
_pkgname=nccl
pkgver=2.30.4
pkgver=2.30.7
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
sha256sums=('304b5450651ee0d8d7241645ae9fb98e3700086b3dad33e11ca6687a81667a9f'
            '84c398c767fac725d242c53f9b1050c8cff33cc1855a1336dae63f72080b9cd3')
b2sums=('129e880d2d584add18560d8f9c1e890072d6bea8ded1e93a47afc63b1ea5a2249144cac30d97e35bd38b137a8272989af01564f09f8abe181149c6249fc9c625'
        'd310242b86df7224d6496758f47a206f6118a51ea341f03e04edd76b79642f393dcf1ffc7d5b8690d5a5eaa902b31929bffaf92a45ad7ba6547e411a95effba8')

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
