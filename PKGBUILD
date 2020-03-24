# Maintainer: Aksel Alpay <aksel.alpay at uni-heidelberg dot de>
# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=hipsycl-rocm-git
pkgver=r500.5f30bc1
pkgrel=1
pkgdesc="Implementation of SYCL 1.2.1 over AMD HIP/NVIDIA CUDA"
arch=("x86_64")
url="https://github.com/illuhad/hipSYCL"
license=("BSD")
provides=(hipsycl-rocm hipsycl sycl)
makedepends=(cmake)
depends=(llvm clang python boost hipcpu openmp hip-hcc rocm)
_pkgname=hipsycl
source=("${_pkgname}::git+https://github.com/illuhad/hipSYCL.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    # Delete the install lines for contrib hip and hipcpu
    sed -i '/contrib/d' ${srcdir}/${_pkgname}/CMakeLists.txt
}

build() {
    mkdir -p ${srcdir}/${_pkgname}/build
    cd ${srcdir}/${_pkgname}/build

    cmake .. -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/opt/hipSYCL/ROCm \
          -DWITH_CUDA_BACKEND=OFF \
          -DWITH_ROCM_BACKEND=ON \
          -DWITH_CPU_BACKEND=ON

    make

}

package() {
    cd "${srcdir}/${_pkgname}/build"
    make DESTDIR=${pkgdir} install
}
