# Maintainer: Michael Yang <ohmyarchlinux@protonmail.com>

pkgname=cpprestsdk-git
pkgver=2.1.0.r1705.g1e4717e5
pkgrel=1
pkgdesc='A Microsoft project for cloud-based client-server communication in native code using a modern asynchronous C++ API design'
arch=('i686' 'x86_64')
url='https://github.com/Microsoft/cpprestsdk'
license=('MIT')
depends=('boost-libs' 'websocketpp-git-dev' 'openssl>=1.0.0')
makedepends=('git' 'boost' 'cmake>=3.0.0')
conflicts=('cpprestsdk' 'casablanca' 'casablanca-git')
provides=('cpprestsdk')
source=('git+https://github.com/Microsoft/cpprestsdk.git')
sha512sums=('SKIP')

pkgver() {
  cd cpprestsdk
  git describe | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../cpprestsdk/Release \
    -DBUILD_SAMPLES=OFF \
    -DCPPREST_EXPORT_DIR=lib/cmake/cpprestsdk \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

check() {
  cd build
  make test
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  cd cpprestsdk
  install -Dm644 license.txt "${pkgdir}"/usr/share/licenses/cpprestsdk-git/license.txt
  install -Dm644 ThirdPartyNotices.txt "${pkgdir}"/usr/share/licenses/cpprestsdk-git/ThirdPartyNotices.txt
}
