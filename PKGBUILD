# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >

pkgname=soqt-git
pkgver=r2135.2f85c94b
pkgrel=1
pkgdesc='The glue between Coin and Qt'
arch=(x86_64)
url='https://github.com/coin3d/soqt'
license=(GPL)
provides=(soqt)
conflicts=(soqt)
depends=(coin qt5-base)
makedepends=(cmake git mesa ninja doxygen)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd soqt
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd soqt
  git submodule init
  git submodule update
}

build() {
  mkdir -p build
  cd build
  cmake ../soqt \
    -DCMAKE_C_FLAGS="$CFLAGS -fPIC -Wno-deprecated-declarations" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -fPIC -Wno-deprecated-declarations" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DSOQT_BUILD_DOC_MAN=ON \
    -DSOQT_BUILD_DOC_CHM=OFF \
    -G Ninja
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  # Skip the HTML documentation
  rm -rf "$pkgdir/usr/share/doc"
}
