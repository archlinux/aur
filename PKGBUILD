# Maintainer: Markus Näther <naetherm@informatik.uni-freiburg.de>
pkgname=hipsparse
_pkgver=3.1
pkgver="$_pkgver.0"
pkgrel=2
pkgdesc="ROCm SPARSE marshalling library."
arch=('x86_64')
url="https://github.com/ROCmSoftwarePlatform/hipSPARSE"
license=('custom:NCSAOSL')
depends=('hcc' 'hip')
makedepends=('cmake' "hcc>=$pkgver" "hip>=$pkgver" 'python2' "rocprim>=$pkgver" "rocsparse>=$pkgver" "rocm-comgr>=$pkgver" 'rocminfo')
source=("https://github.com/ROCmSoftwarePlatform/hipSPARSE/archive/rocm-$_pkgver.tar.gz"
        "hipsparse_hsa.patch")
sha256sums=('df210c1dd18a23b8013558ea82058601a75d8572ad54d13d59beb6746759ced6'
            'd3a926958b84c660f273d6b3a644e8a775e9ed779a7d81baa8f4c4981cee076b')

prepare() {
  cd "$srcdir/hipSPARSE-rocm-$_pkgver"
  patch -Np1 -i "$srcdir/hipsparse_hsa.patch"
}

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  # fix broken build with stack protection
  export CFLAGS="$(sed -e 's/-fstack-protector-strong//' <<< "$CFLAGS")"
  export CXXFLAGS="$(sed -e 's/-fstack-protector-strong//' <<< "$CXXFLAGS")"
  export CPPFLAGS="$(sed -e 's/-fstack-protector-strong//' <<< "$CPPFLAGS")"

  # compile with HCC
  export CXX="/opt/rocm/hcc/bin/hcc"

  # TODO: fix librocsparse.so, it contains references to $srcdir
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=opt/rocm/hipsparse \
        -Dhcc_DIR=/opt/rocm/hcc/lib/cmake/hcc \
        -Dhip_DIR=/opt/rocm/hip/lib/cmake/hip \
        -Damd_comgr_DIR=/opt/rocm/lib/cmake/amd_comgr \
        -Drocsparse_DIR=/opt/rocm/rocsparse/lib/cmake/rocsparse \
        -DBUILD_CLIENTS_SAMPLES=OFF \
        -DBUILD_CLIENTS_TESTS=OFF \
        -DHSA_HEADER=/opt/rocm/hsa/include \
        "$srcdir/hipSPARSE-rocm-$_pkgver"
  make
}

package() {
  cd "$srcdir/build"

  make install

  cp -r "$srcdir/build/opt" "$pkgdir/"

  install -d "$pkgdir/etc/ld.so.conf.d"
  cat << EOF > "$pkgdir/etc/ld.so.conf.d/hipsparse.conf"
/opt/rocm/hipsparse/lib
EOF
}
