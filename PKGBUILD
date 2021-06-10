pkgname=hmat-oss16
pkgver=1.6.1
pkgrel=2
pkgdesc="A hierarchical matrix C/C++ library"
license=('GPL')
arch=('x86_64')
url="https://github.com/jeromerobert/hmat-oss"
depends=('cblas' 'lapack')
makedepends=('cmake')
provides=("hmat-oss=${pkgver}")
conflicts=('hmat-oss')
source=("https://github.com/jeromerobert/hmat-oss/archive/${pkgver}.tar.gz" set_num_threads.patch leak.patch)
sha256sums=('1517be8bde1c06bd8bc42d95926c72d787af95fc3d37439c911a7cea3243d2ca' SKIP SKIP)

prepare() {
  cd hmat-oss-$pkgver
  patch -p1 -i "$srcdir"/set_num_threads.patch
  patch -p1 -i "$srcdir"/leak.patch
  sed -i "s|-Werror ||g" CMakeLists.txt
}


build() {
  cd hmat-oss-$pkgver
  cmake -DHMAT_GIT_VERSION=OFF -DCMAKE_INSTALL_PREFIX=/usr -DINSTALL_INCLUDE_DIR=/usr/include/hmat \
    -DDISABLE_CLANG_FALSE_POSITIVES=0 -DCMAKE_CXX_FLAGS="-Wno-deprecated-declarations" .
  make
}

package() {
  cd hmat-oss-$pkgver
  make DESTDIR="$pkgdir" install
}

