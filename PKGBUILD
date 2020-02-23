# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Daniel Bermond < yahoo-com: danielbermond >

pkgname=nccl
pkgver=2.5.7
_upstr_pkgrel=1
pkgrel=4
pkgdesc='Library for NVIDIA multi-GPU and multi-node collective communication primitives'
arch=('x86_64')
url='https://developer.nvidia.com/nccl/'
license=('BSD')
depends=('glibc')
makedepends=('git' 'cuda')
source=("$pkgname"::"git+https://github.com/NVIDIA/nccl.git#tag=v${pkgver}-${_upstr_pkgrel}")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"

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
  cd "$pkgname"

  export NVCC_GENCODE="-gencode=arch=compute_35,code=sm_35 \
                       -gencode=arch=compute_50,code=sm_50 \
                       -gencode=arch=compute_52,code=sm_52 \
                       -gencode=arch=compute_60,code=sm_60 \
                       -gencode=arch=compute_61,code=sm_61 \
                       -gencode=arch=compute_70,code=sm_70 \
                       -gencode=arch=compute_72,code=sm_72 \
                       -gencode=arch=compute_75,code=sm_75 \
                       -gencode=arch=compute_60,code=compute_60 \
                       -gencode=arch=compute_61,code=compute_61 \
                       -gencode=arch=compute_70,code=compute_70 \
                       -gencode=arch=compute_72,code=compute_72 \
                       -gencode=arch=compute_75,code=compute_75"

  make CUDA_HOME=/opt/cuda PREFIX=/usr src.build
}

package() {
  cd "${pkgname}"

  make PREFIX="${pkgdir}"/usr install

  install -Dm644  "${srcdir}/${pkgname}"/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
