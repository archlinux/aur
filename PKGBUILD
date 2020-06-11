# Maintainer: Markus Näther <naetherm@informatik.uni-freiburg.de>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=rccl
pkgver=3.5.0
pkgrel=1
pkgdesc="ROCm Communication Collectives Library"
arch=('x86_64')
url="https://github.com/ROCmSoftwarePlatform/rccl"
license=('custom:NCSAOSL')
depends=('hip')
makedepends=('cmake' 'python' 'rocminfo')
source=("$pkgname-$pkgver::https://github.com/ROCmSoftwarePlatform/rccl/archive/rocm-$pkgver.tar.gz")
sha256sums=('290b57a66758dce47d0bfff3f5f8317df24764e858af67f60ddcdcadb9337253')

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  # fix broken build with stack protection
  export CFLAGS="$(sed -e 's/-fstack-protector-strong//' <<< "$CFLAGS")"
  export CXXFLAGS="$(sed -e 's/-fstack-protector-strong//' <<< "$CXXFLAGS")"
  export CPPFLAGS="$(sed -e 's/-fstack-protector-strong//' <<< "$CPPFLAGS")"

  cmake -DCMAKE_INSTALL_PREFIX=/opt/rocm/rccl \
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
