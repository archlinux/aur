# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=hdf5-git
pkgver=r36008.gf745476aa5
pkgrel=1
pkgdesc="General purpose library and file format for storing scientific data"
arch=('i686' 'x86_64')
url="https://www.hdfgroup.org/solutions/hdf5/"
license=('custom')
depends=('glibc' 'bash' 'libaec' 'zlib')
makedepends=('git' 'cmake')  # gcc-fortran
provides=('hdf5')
conflicts=('hdf5')
options=('staticlibs')
source=("git+https://github.com/HDFGroup/hdf5.git")
sha256sums=('SKIP')


pkgver() {
  cd "hdf5"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "hdf5"

  mkdir -p "_build" && cd "_build"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DHDF5_BUILD_FORTRAN=OFF \
    -DHDF5_ENABLE_Z_LIB_SUPPORT=ON \
    -DHDF5_ENABLE_SZIP_SUPPORT=ON \
    -DHDF5_ENABLE_SZIP_ENCODING=ON \
    "../"
  make
}

check() {
  cd "hdf5"

  make test
}

package() {
  cd "hdf5"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/hdf5"
}
