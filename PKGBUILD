# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Daniel Bermond < yahoo-com: danielbermond >

_commit='f93fe9bfd94884cec2ba711897222e0df5569a53'

pkgname=nccl
pkgver=2.4.6
pkgrel=1
pkgdesc='Library for NVIDIA multi-GPU and multi-node collective communication primitives'
arch=('x86_64')
url='https://developer.nvidia.com/nccl/'
license=('BSD')
depends=('glibc')
makedepends=('git' 'cuda')
source=("$pkgname"::"git+https://github.com/NVIDIA/nccl.git#commit=${_commit}")
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

  make CUDA_HOME='/opt/cuda' src.build
}

package() {
  cd "${pkgname}/build"

  install -Dm644 include/nccl.h "${pkgdir}/usr/include/nccl.h"
  mkdir -p "${pkgdir}/usr/lib"
  cp -a lib/* "${pkgdir}/usr/lib"

  install -Dm644  "${srcdir}/${pkgname}"/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
