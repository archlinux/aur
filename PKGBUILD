# Maintainer: Markus Näther <naether.markus@gmail.com>
pkgname=rocblas
_pkgver=3.1
pkgver="$_pkgver.0"
pkgrel=1
pkgdesc="Next generation BLAS implementation for ROCm platform"
arch=('x86_64')
url="https://github.com/ROCmSoftwarePlatform/rocBLAS"
license=('custom:NCSAOSL')
depends=('hcc' 'hip')
makedepends=('cmake' "hcc>=$pkgver" 'python2' "rocm-comgr>=$pkgver" 'rocminfo')
source=("https://github.com/ROCmSoftwarePlatform/rocBLAS/archive/rocm-$_pkgver.tar.gz")
sha256sums=('b2240a4a413cd7887d8e0110953c92c67fa941d29c7ccf910e9e7faa44770c80')

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  # fix broken build with stack protection
  export CFLAGS="$(sed -e 's/-fstack-protector-strong//' <<< "$CFLAGS")"
  export CXXFLAGS="$(sed -e 's/-fstack-protector-strong//' <<< "$CXXFLAGS")"
  export CPPFLAGS="$(sed -e 's/-fstack-protector-strong//' <<< "$CPPFLAGS")"

  # compile with HCC
  export CXX="/opt/rocm/hcc/bin/hcc"

  # TODO: fix librocblas.so, it contains references to $srcdir
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm/rocblas \
        -HIP_DIR=/opt/rocm/hip/lib/cmake/hip \
        -hcc_DIR=/opt/rocm/hcc/lib/cmake/hcc \
        -Damd_comgr_DIR=/opt/rocm/lib/cmake/amd_comgr \
        -DBUILD_WITH_TENSILE=OFF \
        "$srcdir/rocBLAS-rocm-$_pkgver"
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install

  install -d "$pkgdir/etc/ld.so.conf.d"
  cat << EOF > "$pkgdir/etc/ld.so.conf.d/rocblas.conf"
/opt/rocm/rocblas/lib
EOF
}
