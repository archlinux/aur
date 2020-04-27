# Maintainer: Markus Näther <naetherm@informatik.uni-freiburg.de>
pkgname=rccl
pkgver=3.3.0
pkgrel=2
pkgdesc="ROCm Communication Collectives Library"
arch=('x86_64')
url="https://github.com/ROCmSoftwarePlatform/rccl"
license=('custom:NCSAOSL')
depends=('hcc' 'hip')
makedepends=('cmake' 'hcc' 'python2' 'rocminfo')
source=("https://github.com/ROCmSoftwarePlatform/rccl/archive/rocm-$pkgver.tar.gz")
sha256sums=('fcebb7983d7299bb4d002ae21e31c1d372e0e4b2406ee2b2321d856388a1193e')

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  # fix broken build with stack protection
  export CFLAGS="$(sed -e 's/-fstack-protector-strong//' <<< "$CFLAGS")"
  export CXXFLAGS="$(sed -e 's/-fstack-protector-strong//' <<< "$CXXFLAGS")"
  export CPPFLAGS="$(sed -e 's/-fstack-protector-strong//' <<< "$CPPFLAGS")"

  # compile with HCC
  export CXX="/opt/rocm/hcc/bin/hcc"

  # TODO: fix librccl.so, it contains references to $srcdir
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm/rccl \
        -DBUILD_TESTS=OFF \
        "$srcdir/rccl-rocm-$pkgver"

  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install

  install -d "$pkgdir/opt/rocm/include"
  ln -s /opt/rocm/rccl/include/rccl.h "$pkgdir/opt/rocm/include"

  install -d "$pkgdir/etc/ld.so.conf.d"
  cat << EOF > "$pkgdir/etc/ld.so.conf.d/rccl.conf"
/opt/rocm/rccl/lib
EOF
}
