# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: codyfish <fe27 at gmx dot net>
# Contributor: sofiageo <george at sofianos dot dev>
pkgname=rocm-validation-suite
pkgver=5.2.1
pkgrel=1
pkgdesc="Tool for detecting and troubleshooting common problems affecting AMD GPUs"
arch=('x86_64')
url="https://github.com/ROCm-Developer-Tools/ROCmValidationSuite"
license=('MIT')
depends=('pciutils' 'doxygen' 'rocblas' 'rocm-smi-lib' 'git' 'libpciaccess')
makedepends=('cmake' 'systemd')
options=(!staticlibs strip !lto)
_git='https://github.com/ROCm-Developer-Tools/ROCmValidationSuite'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz"
        "rvs-os-type.patch::https://github.com/acxz/ROCmValidationSuite/commit/eb1a4bf5de8d8ba25f21ee13d6af1c46416e3961.patch"
        "rocblas-header.patch::https://github.com/acxz/ROCmValidationSuite/commit/3522af8597773cb5071746401280b8d813ca12cc.patch")
sha256sums=('a0ea3ab9cbb8ac17bfa4537713a4d7075f869949bfdead4565a46f75864bd4a9'
            'SKIP'
            'SKIP')
_dirname="$(basename "$_git")-$(basename "${source[0]}" ".tar.gz")"

prepare() {
  cd "$_dirname"
  patch -Np1 -i "$srcdir/rvs-os-type.patch"
  patch -Np1 -i "$srcdir/rocblas-header.patch"
}

build() {
  # -fcf-protection is not supported by HIP, see
  # https://docs.amd.com/bundle/ROCm-Compiler-Reference-Guide-v5.2/page/Appendix_A.html
  CXXFLAGS="${CXXFLAGS} -fcf-protection=none" \
  cmake -B build -Wno-dev \
        -S "$_dirname" \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm \
        -DBUILD_FILE_REORG_BACKWARD_COMPATIBILITY=OFF
  make -C build
}

package() {
  DESTDIR="$pkgdir" make -C build install

  # add links
  install -d "$pkgdir/usr/bin"
  local _fn
  for _fn in rvs; do
    ln -s "/opt/rocm/rvs/$_fn" "$pkgdir/usr/bin/$_fn"
  done

  install -Dm644 "$_dirname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
