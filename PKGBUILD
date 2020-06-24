# Maintainer: acxz <akashpatel at yahoo dot com>

pkgname=miopen-opencl
pkgver=3.5.0
pkgrel=2
pkgdesc="AMD's Machine Intelligence Library (OpenCL backend)"
arch=('x86_64')
url="https://github.com/ROCmSoftwarePlatform/MIOpen"
license=('custom:NCSAOSL')
depends=('ocl-icd' 'rocblas' 'boost' 'llvm-amdgpu')
makedepends=('opencl-headers' 'cmake' 'half' 'miopengemm')
provides=('miopen')
conflicts=('miopen')
source=("$pkgname-$pkgver::https://github.com/ROCmSoftwarePlatform/MIOpen/archive/rocm-$pkgver.tar.gz")
sha256sums=('aa362e69c4dce7f5751f0ee04c745735ea5454c8101050e9b92cc60fa3c0fb82')

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake -DCMAKE_INSTALL_PREFIX=/opt/rocm/miopen \
        -DMIOPEN_BACKEND=OpenCL \
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
