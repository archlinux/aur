# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Contriubtor: Markus Näther <naetherm@informatik.uni-freiburg.de>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=rccl
pkgver=5.4.1
pkgrel=1
pkgdesc="ROCm Communication Collectives Library"
arch=('x86_64')
url='https://rccl.readthedocs.io/en/rocm-5.4.1/'
license=('custom')
depends=('hip' 'rocm-smi-lib')
makedepends=('rocm-cmake' 'python')
_git='https://github.com/ROCmSoftwarePlatform/rccl'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz")
sha256sums=('d423921c69b3d4c522c109c2f17ec1703f0fa573e2999564803da2fe788f3a00')
_dirname="$(basename $_git)-$(basename ${source[0]} .tar.gz)"

build() {
  # -fcf-protection is not supported by HIP, see
  # https://docs.amd.com/bundle/ROCm-Compiler-Reference-Guide-v5.4/page/Appendix_A.html
  CXXFLAGS="${CXXFLAGS} -fcf-protection=none" \
  cmake \
    -Wno-dev \
    -B build \
    -S "$_dirname" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_CXX_COMPILER=/opt/rocm/hip/bin/hipcc \
    -DCMAKE_INSTALL_PREFIX=/opt/rocm
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  echo "/opt/rocm/$pkgname/lib" > "$pkgname.conf"
  install -Dm644 "$pkgname.conf" "$pkgdir/etc/ld.so.conf.d/$pkgname.conf"

  install -Dm644 "$srcdir/$_dirname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
