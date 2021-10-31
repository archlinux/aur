# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Daniel Bermond < yahoo-com: danielbermond >

pkgname=nccl
pkgver=2.11.4
_upstr_pkgrel=1
pkgrel=2
pkgdesc='Library for NVIDIA multi-GPU and multi-node collective communication primitives'
arch=('x86_64')
url='https://developer.nvidia.com/nccl/'
license=('BSD')
depends=('glibc' 'gcc-libs')
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
                       -gencode=arch=compute_86,code=compute_86"

  make CUDA_HOME=/opt/cuda PREFIX=/usr src.build
}

package() {
  cd "${pkgname}"

  make PREFIX="${pkgdir}"/usr install
  # fix permission on static lib
  chmod 644 "${pkgdir}"/usr/lib/libnccl_static.a
  install -Dm644  "${srcdir}/${pkgname}"/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
