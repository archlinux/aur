# Maintainer: Isho Antar <IshoAntar@protonmail.com>
# Contributor: Michael Yang <ohmyarchlinux@protonmail.com>

pkgname=spdlog-git
pkgver=1.8.2.55bfa8d
pkgrel=1
pkgdesc='Very fast, header only, C++ logging library'
arch=('any')
url='https://github.com/gabime/spdlog'
license=('MIT')
makedepends=('git' 'cmake>=3.1.0')
conflicts=('spdlog')
provides=('spdlog')
source=('git+https://github.com/gabime/spdlog.git#branch=v1.x')
sha512sums=('SKIP')

pkgver() {
  cd spdlog
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../spdlog \
    -DSPDLOG_BUILD_BENCH=OFF \
    -DSPDLOG_BUILD_EXAMPLE=OFF \
    -DSPDLOG_BUILD_TESTS=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make -j$(nproc)
}

check() {
  cd build
  ctest
}

package() {
  make -C build DESTDIR=${pkgdir} install
  install -Dm644 spdlog/LICENSE ${pkgdir}/usr/share/licenses/spdlog/LICENSE
}
