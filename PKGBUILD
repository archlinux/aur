# Maintainer: Ulysses R. Ribeiro <ulyssesrr@gmail.com>
# Forked from rocsparse - Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
_pkgname=rocsparse
pkgname=rocsparse-gfx1010
pkgver=5.6.1
pkgrel=1
pkgdesc='BLAS for sparse computation on top of ROCm - supports only gfx1010 (Navi 10)'
arch=('x86_64')
url='https://rocsparse.readthedocs.io/en/master/'
license=('MIT')
depends=('hip' 'rocprim')
makedepends=('rocm-cmake' 'gcc-fortran')
_git='https://github.com/ROCmSoftwarePlatform/rocSPARSE'
source=("$_pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz")
sha256sums=('6a50a64354507f1374e1a86aa7f5c07d1aaa96ac193ac292c279153087bb5d54')
options=(!lto)
_dirname="$(basename "$_git")-$(basename "${source[0]}" ".tar.gz")"
provides=('rocsparse')
conflicts=('rocsparse')

build() {
  # -fcf-protection is not supported by HIP, see
  # https://rocm.docs.amd.com/en/latest/reference/rocmcc/rocmcc.html#support-status-of-other-clang-options
  CXXFLAGS="${CXXFLAGS} -fcf-protection=none" \
  cmake \
    -Wno-dev \
    -B build \
    -S "$_dirname" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_CXX_COMPILER=/opt/rocm/bin/hipcc \
    -DCMAKE_INSTALL_PREFIX=/opt/rocm \
    -DAMDGPU_TARGETS="gfx1010"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  echo '/opt/rocm/rocsparse/lib' > "$_pkgname.conf"
  install -Dm644 "$_pkgname.conf" "$pkgdir/etc/ld.so.conf.d/$_pkgname.conf"

  install -Dm644 "$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
