# Maintainer: Ranieri Althoff <ranisalt+aur at gmail dot com>

pkgname=rocm-opencl-runtime
pkgver=3.7.0
pkgrel=1
pkgdesc='Radeon Open Compute - OpenCL runtime'
arch=('x86_64')
url='https://github.com/RadeonOpenCompute/ROCm-OpenCL-Runtime'
license=('MIT')
depends=('hsakmt-roct' 'hsa-rocr' 'rocclr' 'opencl-icd-loader')
makedepends=('cmake' 'rocm-cmake')
provides=("$pkgname" 'opencl-driver')
source=("$pkgname-$pkgver::git+$url#branch=rocm-3.7.x")
sha256sums=('SKIP')
_dirname="rocm-opencl-runtime-$pkgver"

build() {
    CFLAGS="$CFLAGS -isystem /opt/rocm/rocclr/include/include -isystem /opt/rocm/rocclr/include/compiler/lib -isystem /opt/rocm/rocclr/include/compiler/lib/include" \
    CXXFLAGS="$CXXFLAGS -isystem /opt/rocm/rocclr/include/include -isystem /opt/rocm/rocclr/include/compiler/lib -isystem /opt/rocm/rocclr/include/compiler/lib/include" \
    cmake -DCMAKE_INSTALL_PREFIX=/opt/rocm \
          -DROCclr_DIR=/opt/rocm/rocclr \
          -DLIBROCclr_STATIC_DIR=/opt/rocm/rocclr/lib \
          -DUSE_COMGR_LIBRARY=yes \
          -DBUILD_TESTING=OFF \
          "$_dirname"
    make
}

package() {
    DESTDIR="$pkgdir" make install
    install -Dm644 "$_dirname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/$pkgname.conf" <<-EOF
      /opt/rocm/lib
EOF
    install -Dm644 /dev/stdin "$pkgdir/etc/OpenCL/vendors/amdocl64.icd" <<EOF
/opt/rocm/lib/libamdocl64.so
EOF
}
