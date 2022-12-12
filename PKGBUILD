# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: Ranieri Althoff <ranisalt+aur at gmail dot com>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=rocm-opencl-runtime
pkgver=5.4.0
pkgrel=2
pkgdesc='OpenCL implementation for AMD'
arch=('x86_64')
url='https://github.com/RadeonOpenCompute/ROCm-OpenCL-Runtime'
license=('MIT')
depends=('hsakmt-roct' 'hsa-rocr' 'comgr' 'mesa' 'opencl-icd-loader')
makedepends=('rocm-cmake')
provides=('opencl-driver')
_rocclr='https://github.com/ROCm-Developer-Tools/ROCclr'
source=("$pkgname-$pkgver.tar.gz::$url/archive/rocm-$pkgver.tar.gz"
        "$pkgname-rocclr-$pkgver.tar.gz::$_rocclr/archive/rocm-$pkgver.tar.gz")
sha256sums=('a294639478e76c75dac0e094b418f9bd309309b07faf6af126cdfad9aab3c5c7'
            '46a1579310b3ab9dc8948d0fb5bed4c6b312f158ca76967af7ab69e328d43138')
_dirname="$(basename "$url")-$(basename "${source[0]}" .tar.gz)"
_rocclr_dir="$(basename "$_rocclr")-$(basename "${source[1]}" .tar.gz)"

build() {
    cmake \
        -Wno-dev \
        -B build-rocclr \
        -S "$_rocclr_dir" \
        -DCMAKE_BUILD_TYPE=None \
        -DAMD_OPENCL_PATH="$srcdir/$_dirname"
    cmake --build build-rocclr

    cmake \
        -Wno-dev \
        -B build \
        -S "$_dirname" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm \
        -DROCM_PATH=/opt/rocm \
        -DCMAKE_PREFIX_PATH="$srcdir/$_rocclr_dir;/opt/rocm" \
        -DAMD_OPENCL_PATH="$srcdir/$_dirname"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 "$_dirname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    echo '/opt/rocm/lib' > "$pkgname.conf"
    install -Dm644 "$pkgname.conf" "$pkgdir/etc/ld.so.conf.d/$pkgname.conf"

    echo '/opt/rocm/lib/libamdocl64.so' > 'amdocl64.icd'
    install -Dm644 'amdocl64.icd' "$pkgdir/etc/OpenCL/vendors/amdocl64.icd"
}
