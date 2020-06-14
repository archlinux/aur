# Maintainer: Markus Näther <naetherm@informatik.uni-freiburg.de>
pkgname=hipsparse
pkgver=3.5.0
pkgrel=1
pkgdesc='rocSPARSE marshalling library.'
arch=('x86_64')
url='https://rocmdocs.amd.com/en/latest/ROCm_Libraries/ROCm_Libraries.html#hipsparse'
license=('MIT')
depends=('hip-rocclr' 'rocsparse')
makedepends=('cmake' 'git' 'rocminfo')
_git='https://github.com/ROCmSoftwarePlatform/hipSPARSE'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz")
sha256sums=('fa16b2a307a5d9716066c2876febcbc1cef855bf0c96d235d2d8f2206a0fb69d')

build() {
  CXX=/opt/rocm/hip/bin/hipcc \
  cmake -B build -Wno-dev \
        -DCMAKE_INSTALL_PREFIX=opt/rocm \
        -Damd_comgr_DIR=/opt/rocm/lib/cmake/amd_comgr \
        -DAMDDeviceLibs_DIR=/opt/rocm/lib/cmake/AMDDeviceLibs \
        -Dhip_DIR=/opt/rocm/hip/lib/cmake/hip \
        -Drocsparse_DIR=/opt/rocm/rocsparse/lib/cmake/rocsparse \
        -DBUILD_CLIENTS_SAMPLES=OFF \
        -DBUILD_CLIENTS_TESTS=OFF \
        "$srcdir/hipSPARSE-rocm-$pkgver"
  make -C build
}

package() {
  DESTDIR="$pkgdir" make -C build install

  install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/hipsparse.conf" << EOF 
/opt/rocm/hipsparse/lib
EOF
  install -Dm644 "$srcdir/hipSPARSE-rocm-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
