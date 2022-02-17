# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: Ranieri Althoff <ranisalt+aur at gmail dot com>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=rocm-opencl-runtime
pkgver=5.0.1
pkgrel=1
pkgdesc='Radeon Open Compute - OpenCL runtime'
arch=('x86_64')
url='https://github.com/RadeonOpenCompute/ROCm-OpenCL-Runtime'
license=('MIT')
depends=('hsakmt-roct' 'hsa-rocr' 'comgr' 'mesa' 'opencl-icd-loader')
makedepends=('cmake' 'rocm-cmake')
provides=('opencl-driver')
conflicts=('opencl-amdgpu-pro-pal')
_rocclr='https://github.com/ROCm-Developer-Tools/ROCclr'
source=("$pkgname-$pkgver.tar.gz::$url/archive/rocm-$pkgver.tar.gz"
        "$pkgname-rocclr-$pkgver.tar.gz::$_rocclr/archive/rocm-$pkgver.tar.gz")
sha256sums=('948bd36e212ce3015540aebc5c8a1741ba7f0a8d5b0d52aba2178bbb202cff84'
            'f7e0fdedf50b1b1378708ce02afd6194dd5df94611dec20e9a5aab95751b3959')
_dirname="$(basename "$url")-$(basename "${source[0]}" .tar.gz)"
_rocclr_dir="$(basename "$_rocclr")-$(basename "${source[1]}" .tar.gz)"

build() {
    cmake -Wno-dev -B build-rocclr \
	-S "$_rocclr_dir" \
    -DAMD_OPENCL_PATH="$srcdir/$_dirname"

    make -C build-rocclr

    cmake -Wno-dev -B build \
    -S "$_dirname" \
    -DCMAKE_INSTALL_PREFIX=/opt/rocm \
    -DUSE_COMGR_LIBRARY=yes \
    -DROCCLR_PATH="$srcdir/$_rocclr_dir" \
    -DAMD_OPENCL_PATH="$srcdir/$_dirname"

    make -C build
}

package() {
    DESTDIR="$pkgdir" make -C build install
    install -Dm644 "$_dirname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/$pkgname.conf" <<-EOF
      /opt/rocm/lib
EOF
    install -Dm644 /dev/stdin "$pkgdir/etc/OpenCL/vendors/amdocl64.icd" <<EOF
/opt/rocm/lib/libamdocl64.so
EOF
}
