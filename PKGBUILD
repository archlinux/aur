# Maintainer: Ranieri Althoff <ranisalt+aur at gmail dot com>

pkgname=rocm-comgr
pkgdesc='Radeon Open Compute - compiler support'
pkgver=3.3.0
pkgrel=2
arch=('x86_64')
url='https://github.com/RadeonOpenCompute/ROCm-CompilerSupport'
license=('custom:NCSAOSL')
depends=(llvm-roc)
makedepends=(cmake rocm-cmake rocm-device-libs)
source=("$url/archive/rocm-$pkgver.tar.gz")
sha256sums=('01e2524e0f28ecd6f46c9720f279207de935d826b0172158792aa3ec86af9ca7')
# makepkg-optimize options will not work due to llvm-roc not bundling dependencies
options=(!lto !lto-clang !lto-thin !lto-thin-clang !graphite !polly !rice !rice-clang)
_dirname="$(basename "$url")-$(basename "${source[0]}" .tar.gz)"

build() {
  cmake -DCMAKE_C_COMPILER=/opt/rocm/bin/clang \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DAMDDeviceLibs_DIR=/opt/rocm/lib/cmake/AMDDeviceLibs/AMDDeviceLibsConfig.cmake \
        -DClang_DIR=/opt/rocm/lib/cmake/clang \
        -DLLD_INCLUDE_DIRS=/opt/rocm/include/lld \
        -DROCM_DIR=/opt/rocm/share/rocm/cmake \
        "$_dirname/lib/comgr"
  make
}

package() {
  DESTDIR="$pkgdir" make install
  install -Dm644 "$_dirname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
