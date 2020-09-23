# Maintainer: acxz <akashpatel at yahoo dot com>

pkgname=miopen-opencl
pkgver=3.8.0
pkgrel=1
pkgdesc="AMD's Machine Intelligence Library (OpenCL backend)"
arch=('x86_64')
url="https://github.com/ROCmSoftwarePlatform/MIOpen"
license=('custom:NCSAOSL')
depends=('ocl-icd' 'rocblas' 'boost' 'llvm-amdgpu')
makedepends=('opencl-headers' 'rocm-cmake' 'cmake' 'half' 'miopengemm')
provides=('miopen')
conflicts=('miopen')
source=("$pkgname-$pkgver::https://github.com/ROCmSoftwarePlatform/MIOpen/archive/rocm-$pkgver.tar.gz")
sha256sums=('612b30d4a967bf18c7fa7aa3ef12ed558314ed04cee2775b842bf6a96cd7276f')

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake -DCMAKE_INSTALL_PREFIX=/opt/rocm \
        -DMIOPEN_BACKEND=OpenCL \
        -DMIOPEN_HIP_COMPILER=/opt/rocm/llvm/bin/clang++ \
        -DHALF_INCLUDE_DIR=/usr/include/half \
        -DBoost_NO_BOOST_CMAKE=ON \
        "$srcdir/MIOpen-rocm-$pkgver"

  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install

  install -d "$pkgdir/etc/ld.so.conf.d"
  cat << EOF > "$pkgdir/etc/ld.so.conf.d/miopen.conf"
/opt/rocm/miopen/lib
EOF
}
