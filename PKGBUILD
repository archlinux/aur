# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Daniel Bermond < yahoo-com: danielbermond >

pkgname=nccl
pkgver=2.28.9
_upstr_pkgrel=1
pkgrel=1
pkgdesc='Library for NVIDIA multi-GPU and multi-node collective communication primitives'
arch=(x86_64)
url='https://developer.nvidia.com/nccl/'
license=(BSD-3-Clause)
depends=(glibc gcc-libs)
makedepends=(git cuda)
source=(git+https://github.com/NVIDIA/nccl.git#tag=v$pkgver-$_upstr_pkgrel)
sha256sums=('45ca7da4035705fc5b70f413b6563d3abea8e2d83c9d24ed1b75b0053510831d')
b2sums=('121ff4f5865b2ac26eea5519fbfaef84c6154eef071c0e250f00b01859307c4e87b0084e4c192f9bef02b76ce55d6e3562b89f0eed70c0ed7b79c967120a429e')

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
  # fix permission on static lib
  chmod 644 "$pkgdir"/usr/lib/libnccl_static.a
  install -vDm 644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
