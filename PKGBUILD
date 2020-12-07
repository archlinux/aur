# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=rocm-validation-suite
pkgver=3.10.0
pkgrel=1
pkgdesc="Tool for detecting and troubleshooting common problems affecting AMD
GPUs"
arch=('x86_64')
url="https://github.com/ROCm-Developer-Tools/ROCmValidationSuite"
license=('MIT')
depends=('pciutils' 'doxygen' 'rocblas' 'rocm-smi-lib64' 'git')
makedepends=('cmake')
options=(!staticlibs strip)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ROCm-Developer-Tools/ROCmValidationSuite/archive/rocm-$pkgver.tar.gz"
        "action.patch")
sha256sums=('9f9a530f7850770663e0b0ec0c786367f2e22500a472ac6652c4fd9fb4df4f64'
            '8edac06b0658c77f91ce77bbfbe539c4f001b27ab205aabcad91cbecf19bd4d0')

prepare() {
  cd "$srcdir/ROCmValidationSuite-rocm-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/action.patch"
}

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
