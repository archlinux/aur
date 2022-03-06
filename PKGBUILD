# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: codyfish <fe27 at gmx dot net>
# Contributor: sofiageo <george at sofianos dot dev>
pkgname=rocm-validation-suite
pkgver=5.0.2
pkgrel=1
pkgdesc="Tool for detecting and troubleshooting common problems affecting AMD
GPUs"
arch=('x86_64')
url="https://github.com/ROCm-Developer-Tools/ROCmValidationSuite"
license=('MIT')
depends=('pciutils' 'doxygen' 'rocblas' 'rocm-smi-lib64' 'git' 'libpciaccess')
makedepends=('cmake')
options=(!staticlibs strip !lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ROCm-Developer-Tools/ROCmValidationSuite/archive/rocm-$pkgver.tar.gz"
        "gtest.patch::https://patch-diff.githubusercontent.com/raw/ROCm-Developer-Tools/ROCmValidationSuite/pull/523.patch"
        "rvs-os-type.patch::https://github.com/acxz/ROCmValidationSuite/commit/eb1a4bf5de8d8ba25f21ee13d6af1c46416e3961.patch")
sha256sums=('f249fe700a5a96c6dabf12130a3e366ae6025fe1442a5d11d08801d6c0265af4'
            'SKIP'
            'SKIP')

prepare() {
  cd "$srcdir/ROCmValidationSuite-rocm-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/gtest.patch"
  patch --forward --strip=1 --input="${srcdir}/rvs-os-type.patch"
}

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  # -fcf-protection is not supported by HIP, see
  # https://github.com/ROCm-Developer-Tools/HIP/blob/develop/docs/markdown/clang_options.md
  CXXFLAGS="${CXXFLAGS} -fcf-protection=none" \
  cmake -DROCM_PATH=/opt/rocm \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm \
        "$srcdir/ROCmValidationSuite-rocm-$pkgver"
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install

  # add links
  install -d "$pkgdir/usr/bin"
  local _fn
  for _fn in rvs; do
    ln -s "/opt/rocm/rvs/$_fn" "$pkgdir/usr/bin/$_fn"
  done
}
