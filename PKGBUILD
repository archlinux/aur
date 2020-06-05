# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=rocm-validation-suite
pkgver=3.6.0
pkgrel=1
pkgdesc="Tool for detecting and troubleshooting common problems affecting AMD
GPUs"
arch=('x86_64')
url="https://github.com/ROCm-Developer-Tools/ROCmValidationSuite"
license=('MIT')
depends=('pciutils' 'doxygen' 'rocblas' 'rocm-smi-lib' 'git')
makedepends=('cmake')
options=(!staticlibs strip)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ROCm-Developer-Tools/ROCmValidationSuite/archive/rocm-$pkgver.tar.gz")
sha256sums=('fd036ed5fb8cfc9b1e26c6c320ceb322177ed0b4d36d354edd35b120d337c8f6')

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
