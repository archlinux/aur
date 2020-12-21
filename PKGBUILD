# Maintainer: acxz <akashpatel at yahoo dot com>

pkgname=miopen-opencl
pkgver=4.0.0
pkgrel=1
pkgdesc="AMD's Machine Intelligence Library (OpenCL backend)"
arch=('x86_64')
url="https://github.com/ROCmSoftwarePlatform/MIOpen"
license=('custom:NCSAOSL')
depends=('ocl-icd' 'rocblas' 'boost' 'llvm-amdgpu')
makedepends=('opencl-headers' 'rocm-cmake' 'cmake' 'half' 'miopengemm')
provides=('miopen')
conflicts=('miopen')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ROCmSoftwarePlatform/MIOpen/archive/rocm-$pkgver.tar.gz")
sha256sums=('84c6c17be9c1a9cd0d3a2af283433f64b07a4b9941349f498e40fed82fb205a6')

build() {
  cmake -B build \
        -S "MIOpen-rocm-$pkgver" \
        -DMIOPEN_BACKEND=OpenCL \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm \
        -DCMAKE_PREFIX_PATH=/opt/rocm \
        -DMIOPEN_HIP_COMPILER=/opt/rocm/llvm/bin/clang++ \
        -DHALF_INCLUDE_DIR=/usr/include/half

  make -C build
}

package() {
  DESTDIR="$pkgdir" make -C build install

  install -d "$pkgdir/etc/ld.so.conf.d"
  cat << EOF > "$pkgdir/etc/ld.so.conf.d/miopen.conf"
/opt/rocm/miopen/lib
EOF
}
