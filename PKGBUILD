# Maintainer: Markus Näther <naetherm@informatik.uni-freiburg.de>
pkgname=hipsparse
pkgver=3.3.0
pkgrel=3
pkgdesc='ROCm SPARSE marshalling library'
arch=('x86_64')
url='https://github.com/ROCmSoftwarePlatform/hipSPARSE'
license=('custom:NCSAOSL')
depends=('hcc' 'hip')
makedepends=('cmake' 'python' 'rocprim' 'rocsparse' 'comgr' 'rocminfo')
source=("$url/archive/rocm-$pkgver.tar.gz")
sha256sums=('c69336071f56c857e969f0fdfbc351f75cc44ed2e3b854b4688675a9cafe4e22')
_dirname="$(basename "$url")-$(basename "${source[0]}" .tar.gz)"

build() {
  # fix broken build with stack protection
  export CFLAGS="$(sed -e 's/-fstack-protector-strong//' <<< "$CFLAGS")"
  export CXXFLAGS="$(sed -e 's/-fstack-protector-strong//' <<< "$CXXFLAGS")"
  export CPPFLAGS="$(sed -e 's/-fstack-protector-strong//' <<< "$CPPFLAGS")"

  # compile with hipcc
  export CXX="/opt/rocm/hip/bin/hipcc"

  # TODO: fix librocsparse.so, it contains references to $srcdir
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm/hipsparse \
        -DBUILD_CLIENTS_SAMPLES=OFF \
        -DBUILD_CLIENTS_TESTS=OFF \
        -Drocsparse_DIR=/opt/rocm/rocsparse/lib/cmake/rocsparse \
        -Dhip_DIR=/opt/rocm/hip/lib/cmake/hip \
        -Dhcc_DIR=/opt/rocm/hcc/lib/cmake/hcc \
        -Damd_comgr_DIR=/opt/rocm/lib/cmake/amd_comgr \
        "$_dirname"
  make
}

package() {
  DESTDIR="$pkgdir" make install
  install -Dm644 "$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/$pkgname.conf" <<-EOF
    /opt/rocm/hipsparse/lib
EOF
}
