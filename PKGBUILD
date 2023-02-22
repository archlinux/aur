# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=hipsycl-rocm
pkgver=0.9.3
pkgrel=1
pkgdesc="Implementation of SYCL 1.2.1 over AMD HIP/NVIDIA CUDA"
arch=("x86_64")
url="https://github.com/illuhad/hipSYCL"
license=("BSD")
provides=(hipsycl sycl)
makedepends=(cmake)
depends=(llvm clang python boost hipcpu openmp hip-runtime-amd rocm-hip-sdk)
source=("$pkgname-$pkgver::https://github.com/illuhad/hipSYCL/archive/v$pkgver.tar.gz")
sha256sums=('7a1d6c39dd73d8b84e7506003f20918aa3763850e7a5ea3d6add5bd67f6ec0da')

_pkgname=hipSYCL

prepare() {
    # Delete the install lines for contrib hip and hipcpu
    sed -i '/contrib/d' ${srcdir}/${_pkgname}-${pkgver}/CMakeLists.txt
}

build() {
    mkdir -p ${srcdir}/${_pkgname}-${pkgver}/build
    cd ${srcdir}/${_pkgname}-${pkgver}/build

    cmake .. -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/opt/hipSYCL/ROCm \
          -DWITH_CUDA_BACKEND=OFF \
          -DWITH_ROCM_BACKEND=ON \
          -DWITH_CPU_BACKEND=ON

    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}/build"
    make DESTDIR=${pkgdir} install
}
