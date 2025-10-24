# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=libsmu-git
pkgver=1.0.4.r0.gdbb484f
pkgrel=1
pkgdesc="Software abstractions for the analog signal exploration tools."
arch=('i686' 'x86_64')
url="https://github.com/analogdevicesinc/libsmu"
license=('BSD-3-Clause')
depends=('boost>=1.53' 'libusb' 'openmp' 'python')
makedepends=('cmake' 'git' 'pkg-config')
provides=('libsmu')
conflicts=('libsmu')
source=("$pkgname::git+https://github.com/analogdevicesinc/libsmu.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname

  mkdir -p build && cd build
  cmake \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_CXX_STANDARD=14 \
    -DCMAKE_CXX_STANDARD_REQUIRED=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..

  make
}

package() {
  cd $pkgname

  # Install the license
  install -d "$pkgdir"/usr/share/licenses/libsmu-git/
  install -m 644 LICENSE "$pkgdir"/usr/share/licenses/libsmu-git/

  # Install the library
  cd build
  make DESTDIR="$pkgdir/" install
}
