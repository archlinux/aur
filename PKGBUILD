# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>
pkgname=cpprestsdk-git
pkgver=2.8.0.r1609.5abe0cb
pkgrel=1
pkgdesc="a cross-platform, modern, and asynchronous library that enables developers to access and author connected applications"
arch=('i686' 'x86_64')
url="https://github.com/Microsoft/cpprestsdk/"
license=('Apache')
depends=('boost' 'websocketpp' 'openssl>=1.0.0')
makedepends=('git' 'cmake>=2.6.0')
conflicts=('cpprestsdk' 'casablanca' 'casablanca-git')
provides=('cpprestsdk')
source=("git://github.com/Microsoft/cpprestsdk.git#branch=development")
sha512sums=('SKIP')

pkgver() {
  cd cpprestsdk
  _ver="$(cat Release/src/CMakeLists.txt | grep -m3 -e CPPREST_VERSION_MAJOR -e CPPREST_VERSION_MINOR -e CPPREST_VERSION_REVISION | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "$_ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../cpprestsdk/Release \
    -DBUILD_TESTS=OFF \
    -DBUILD_SAMPLES=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C build DESTDIR="$pkgdir/" install
  cd cpprestsdk
  install -Dm644 license.txt $pkgdir/usr/share/licenses/cpprestsdk/LICENSE
  install -Dm644 ThirdPartyNotices.txt $pkgdir/usr/share/licenses/cpprestsdk/ThirdPartyNotices
}
