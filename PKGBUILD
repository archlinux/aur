# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=rocm-validation-suite
pkgver=3.3.0
pkgrel=1
pkgdesc="Tool for detecting and troubleshooting common problems affecting AMD
GPUs"
arch=('x86_64')
url="https://github.com/ROCm-Developer-Tools/ROCmValidationSuite"
license=('MIT')
depends=('pciutils' 'doxygen' 'rocblas' 'rocm-smi-lib' 'git')
makedepends=('cmake')
options=(!staticlibs strip)
source=("rocm_validation_suite-roc-$pkgver.tar.gz::https://github.com/ROCm-Developer-Tools/ROCmValidationSuite/archive/roc-$pkgver.tar.gz")
sha256sums=('37c62381a98d3f83aecad0b4870bdc98059b844e71a60fbc0eab1348d407a87a')

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm/rvs \
        "$srcdir/ROCmValidationSuite-roc-$pkgver"
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install

  # add links
  install -d "$pkgdir/usr/bin"
  local _fn
  for _fn in rocm_validation_suite; do
    ln -s "/opt/rocm/rvs/bin/$_fn" "$pkgdir/usr/bin/$_fn"
  done
}
