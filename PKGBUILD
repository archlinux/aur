# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

_commit='f93fe9bfd94884cec2ba711897222e0df5569a53'

pkgname=nccl
pkgver=2.3.5.5
pkgrel=1
pkgdesc='Library for NVIDIA multi-GPU and multi-node collective communication primitives'
arch=('x86_64')
url='https://developer.nvidia.com/nccl/'
license=('BSD')
depends=('glibc')
makedepends=('git' 'cuda')
conflicts=('nccl-git')
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
    
    # header
    install -D -m644 include/nccl.h "${pkgdir}/opt/cuda/include/nccl.h"
    
    # libraries
    mkdir -p       "${pkgdir}/opt/cuda/lib64"
    cp    -a lib/* "${pkgdir}/opt/cuda/lib64"
    
    # license
    cd "${srcdir}/${pkgname}"
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
