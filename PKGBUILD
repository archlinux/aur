# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Ian Yang <doit.ian@gmail.com>

pkgname=google-glog-static
pkgver=0.4.0
pkgrel=1
pkgdesc="Logging library for C++"
arch=('x86_64')
license=('custom:BSD3')
url='https://github.com/google/glog'
depends=('gcc-libs')
makedepends=('cmake')
options=('staticlibs')
source=("glog-$pkgver.tar.gz::https://github.com/google/glog/archive/v$pkgver.tar.gz")
provides=('google-glog')
conflicts=('google-glog')
sha256sums=('f28359aeba12f30d73d9e4711ef356dc842886968112162bc73002645139c39c')

build() {
  cd glog-$pkgver
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR="/usr/lib" \
    -DBUILD_SHARED_LIBS=ON ..
  make
}

package() {
  cd glog-$pkgver/build

  make DESTDIR="$pkgdir" install

  # Lazy way of dealing with conflicting man and info pages...
  rm -rf "$pkgdir"/usr/share

  install -Dm644 ../COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
