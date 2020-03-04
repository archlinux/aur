# Maintainer: Markus Näther <naetherm@informatik.uni-freiburg.de>
pkgname=rocsparse
_pkgver=3.1
pkgver="$_pkgver.0"
pkgrel=1
pkgdesc="Next generation SPARSE implementation for ROCm platform."
arch=('x86_64')
url="https://github.com/ROCmSoftwarePlatform/rocSPARSE"
license=('custom:NCSAOSL')
depends=('hcc' 'hip')
makedepends=('cmake' 'hcc' 'python2' 'rocminfo')
source=("https://github.com/ROCmSoftwarePlatform/rocSPARSE/archive/rocm-$_pkgver.tar.gz")
sha256sums=('a180765be1e381570d6720b1ea452c71aa21a77bbcb907504d38c9ba2bbf5210')

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  # Tensile library needs python to be python2
  export PATH="$srcdir:$PATH"
  [[ -e "$srcdir/python" ]] || ln -s /usr/bin/python2 "$srcdir/python"

  # fix broken build with stack protection
  export CFLAGS="$(sed -e 's/-fstack-protector-strong//' <<< "$CFLAGS")"
  export CXXFLAGS="$(sed -e 's/-fstack-protector-strong//' <<< "$CXXFLAGS")"
  export CPPFLAGS="$(sed -e 's/-fstack-protector-strong//' <<< "$CPPFLAGS")"

  # compile with HCC
  export CXX="/opt/rocm/hcc/bin/hcc"

  # TODO: fix librocsparse.so, it contains references to $srcdir
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm/rocsparse \
        -Drocprim_DIR=/opt/rocm/rocprim/rocprim/lib/cmake/rocprim \
        -DBUILD_CLIENTS_SAMPLES=OFF \
        "$srcdir/rocSPARSE-rocm-$_pkgver"
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install

  install -d "$pkgdir/etc/ld.so.conf.d"
  cat << EOF > "$pkgdir/etc/ld.so.conf.d/rocsparse.conf"
/opt/rocm/rocsparse/lib
EOF
}
