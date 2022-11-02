# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: codyfish <fe27 at gmx dot net>
# Contributor: sofiageo <george at sofianos dot dev>
pkgname=rocm-validation-suite
pkgver=5.3.0
pkgrel=1
pkgdesc="Tool for detecting and troubleshooting common problems affecting AMD GPUs"
arch=('x86_64')
url="https://github.com/ROCm-Developer-Tools/ROCmValidationSuite"
license=('MIT')
depends=('pciutils' 'doxygen' 'rocblas' 'rocm-smi-lib' 'git' 'libpciaccess')
makedepends=('cmake' 'systemd')
options=(!lto)
_git='https://github.com/ROCm-Developer-Tools/ROCmValidationSuite'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz")
sha256sums=('d6afb8a5f4eaf860fd510bcfe65e735cbf96d4b8817c758ea7aee84d4c994382')
_dirname="$(basename "$_git")-$(basename "${source[0]}" ".tar.gz")"

build() {
  # -fcf-protection is not supported by HIP, see
  # https://docs.amd.com/bundle/ROCm-Compiler-Reference-Guide-v5.3/page/Appendix_A.html
  CXXFLAGS="${CXXFLAGS} -fcf-protection=none" \
  cmake \
    -Wno-dev \
    -B build \
    -S "$_dirname" \
    -DCMAKE_INSTALL_PREFIX=/opt/rocm \
    -DBUILD_FILE_REORG_BACKWARD_COMPATIBILITY=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$_dirname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
