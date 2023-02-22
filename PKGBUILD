# Maintainer: Aksel Alpay <aksel.alpay at uni-heidelberg dot de>
# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=hipsycl-cuda-git
pkgver=r2006.d9b45cd4
pkgrel=1
pkgdesc="Multi-backend implementation of SYCL for CPUs and GPUs"
arch=("x86_64")
url="https://github.com/OpenSYCL/OpenSYCL"
license=("BSD")
provides=(hipsycl-cuda hipsycl sycl)
makedepends=(cmake git)
depends=(llvm clang python boost hipcpu openmp hip-runtime-nvidia cuda)
_pkgname=opensycl
source=("${_pkgname}::git+https://github.com/OpenSYCL/OpenSYCL.git")
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
          -DCMAKE_INSTALL_PREFIX=/opt/hipSYCL/CUDA \
          -DWITH_CUDA_BACKEND=ON \
          -DWITH_ROCM_BACKEND=OFF \
          -DWITH_CPU_BACKEND=ON \
          -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda

    make
}

package() {
    cd "${srcdir}/${_pkgname}/build"
    make DESTDIR=${pkgdir} install
}
