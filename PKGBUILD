# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=hdf5-git
pkgver=1.14.3.r1717.gd212ae6b41
pkgrel=1
pkgdesc="General purpose library and file format for storing scientific data"
arch=('i686' 'x86_64')
url="https://www.hdfgroup.org/solutions/hdf5/"
license=('BSD-3-Clause')
depends=('glibc' 'bash' 'libaec' 'zlib')
makedepends=('git' 'cmake')  # gcc-fortran
provides=("hdf5=$pkgver")
conflicts=('hdf5')
options=('staticlibs')
source=("git+https://github.com/HDFGroup/hdf5.git")
sha256sums=('SKIP')


pkgver() {
  cd "hdf5"

  _tag=$(git tag -l --sort -v:refname | grep -E 'hdf5-[0-9_]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^hdf5-//;s/_/./g'
}

build() {
  cd "hdf5"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DHDF5_BUILD_FORTRAN=OFF \
    -DHDF5_ENABLE_Z_LIB_SUPPORT=ON \
    -DHDF5_ENABLE_SZIP_SUPPORT=ON \
    -DHDF5_ENABLE_SZIP_ENCODING=ON \
    ./
  cmake --build "_build"
}

check() {
  cd "hdf5"

  #cmake --build "_build" --target test
}

package() {
  cd "hdf5"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/hdf5"
}
