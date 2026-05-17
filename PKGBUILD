# Maintainer: Neurofibromin <125222560+Neurofibromin@users.noreply.github.com>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: codyfish <fe27 at gmx dot net>
# Contributor: sofiageo <george at sofianos dot dev>
pkgname=rocm-validation-suite
pkgver=7.2.3
pkgrel=1
pkgdesc="Tool for monitoring, stress testing, detecting, and troubleshooting AMD GPU issues"
arch=('x86_64')
url="https://github.com/ROCm/ROCmValidationSuite"
license=('MIT')
depends=('amdsmi' 'hip-runtime-amd' 'hipblaslt' 'hiprand' 'hsa-rocr' 'openmp'
         'pciutils' 'rocblas' 'yaml-cpp')
makedepends=('cmake' 'doxygen' 'git' 'rocrand')
options=(!lto)
_mxdatagenerator_commit='12c016dc694139317feb2e23c59028fde70beaf4'
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/rocm-$pkgver.tar.gz"
        "mxDataGenerator-$_mxdatagenerator_commit.tar.gz::https://github.com/ROCm/mxDataGenerator/archive/$_mxdatagenerator_commit.tar.gz"
        'mxdatagenerator-optional-download.patch'
        'rvslib-explicit-linking.patch')
sha256sums=('363009b394350a2ae1d8debe7092c96ab5aa2b183487aed6834580979e969c8c'
            'a0c0a78684da2d26ee883ccc632c8f51a4b00cfd3915707f9675cc8c0cf96483'
            'a25f9e476b5d9956d7b1d2c9ec7d0dd98c8b157ae3890af9ecfabd56083d73ff'
            '4d43c70e73d79507eafbbe4199d838172d3490717e3bca67e6848d158be2cf70')
_srcdir="ROCmValidationSuite-rocm-$pkgver"
_mxdatagenerator_dir="mxDataGenerator-$_mxdatagenerator_commit"

prepare() {
  cd "$_srcdir"
  patch -Np1 -i "$srcdir/mxdatagenerator-optional-download.patch"
  patch -Np1 -i "$srcdir/rvslib-explicit-linking.patch"
}

build() {
  # -fcf-protection is not supported by HIP, see
  # https://docs.amd.com/bundle/ROCm-Compiler-Reference-Guide-v5.3/page/Appendix_A.html

  CXXFLAGS+=" -fcf-protection=none" \
  cmake \
    -Wno-dev \
    -B build \
    -S "$_srcdir" \
    -DCMAKE_BUILD_TYPE=Release \
    -DROCM_PATH=/opt/rocm \
    -DCMAKE_INSTALL_PREFIX=/opt/rocm \
    -DCPACK_PACKAGING_INSTALL_PREFIX=/opt/rocm \
    -DMXDATAGENERATOR_INC_DIR="$srcdir/$_mxdatagenerator_dir/lib/include" \
    -DRVS_BUILD_TESTS=OFF \
    -DBUILD_FILE_REORG_BACKWARD_COMPATIBILITY=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$_srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
