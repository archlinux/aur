# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=hipsycl-cpu
pkgver=0.9.4
pkgrel=1
pkgdesc="Multi-backend implementation of SYCL for CPUs and GPUs"
arch=("x86_64")
url="https://github.com/OpenSYCL/OpenSYCL"
license=("BSD")
provides=(hipsycl sycl)
makedepends=(cmake)
depends=(llvm clang python boost hipcpu openmp)
source=("$pkgname-$pkgver::https://github.com/OpenSYCL/OpenSYCL/archive/v$pkgver.tar.gz")
sha256sums=('6262533191c812966e2f8b67e6ae510ae5ad2cf7e0caecc9957e8a69423e51c4')

_pkgname=OpenSYCL

prepare() {
    # Delete the install lines for contrib hip and hipcpu
    sed -i '/contrib/d' ${srcdir}/${_pkgname}-${pkgver}/CMakeLists.txt
}

build() {
    mkdir -p ${srcdir}/${_pkgname}-${pkgver}/build
    cd ${srcdir}/${_pkgname}-${pkgver}/build

    cmake .. -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DWITH_CUDA_BACKEND=OFF \
          -DWITH_ROCM_BACKEND=OFF \
          -DWITH_CPU_BACKEND=ON
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}/build"
    make DESTDIR=${pkgdir} install
}
