# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=rocm-validation-suite
pkgver=3.6.0
pkgrel=2
pkgdesc="Tool for detecting and troubleshooting common problems affecting AMD
GPUs"
arch=('x86_64')
url="https://github.com/ROCm-Developer-Tools/ROCmValidationSuite"
license=('MIT')
depends=('pciutils' 'doxygen' 'rocblas' 'rocm-smi-lib' 'git')
makedepends=('cmake')
options=(!staticlibs strip)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ROCm-Developer-Tools/ROCmValidationSuite/archive/rocm-$pkgver.tar.gz")
sha256sums=('4b9b4438c007173e0cb2f1058f9cf9c0f8d0bbd1e6065ffb99fa51910a303e68')

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake -DCMAKE_INSTALL_PREFIX=/opt/rocm/rvs \
        "$srcdir/ROCmValidationSuite-rocm-$pkgver"
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
