# Maintainer: TiD91 <tidusuper91 at gmail dot com>

pkgname='xdmf-git'
pkgver=3.0.r2461.04a84bab
pkgrel=1
pkgdesc="eXtensible Data Model and Format"
arch=('i686' 'x86_64')
url="https://gitlab.kitware.com/xdmf/xdmf.git"
license=('BSD')
depends=('hdf5' 'libxml2' 'libtiff')
makedepends=('cmake' 'boost' 'doxygen')
provides=('xdmf')
conflicts=('xdmf')
source=("git+https://gitlab.kitware.com/xdmf/xdmf.git" "hid_t_int64.patch")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/xdmf"
  printf "3.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/xdmf"
  patch --forward --strip=2 --input="${srcdir}/hid_t_int64.patch"
}

build() {
  cd xdmf
  mkdir -p build && cd build
  cmake \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DXDMF_BUILD_DOCUMENTATION=OFF\
    -DXDMF_BUILD_TESTING=OFF \
    -DXDMF_BUILD_UTILS=ON \
    -DXDMF_WRAP_PYTHON=OFF \
    -Wno-dev \
    ..
  make
}

package() {
  cd xdmf/build
  make DESTDIR="$pkgdir/" install
}
sha256sums=('SKIP'
            '41d8707c40e6e5fe3828f0427791e61bf0aee4582cf1e985884edb86cb713f01')
