# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=cpprestsdk-git
pkgver=2.9.0.r1852.935917a7
pkgrel=1
pkgdesc='A cross-platform, modern, and asynchronous library that enables developers to access and author connected applications'
arch=('i686' 'x86_64')
url='https://github.com/Microsoft/cpprestsdk/'
license=('MIT')
depends=('boost' 'websocketpp' 'openssl-1.0')
makedepends=('git' 'cmake>=3.0.0')
conflicts=('cpprestsdk' 'casablanca' 'casablanca-git')
provides=('cpprestsdk')
source=("git://github.com/Microsoft/cpprestsdk.git")
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
    -DCPPREST_EXPORT_DIR=lib/cmake/cpprestsdk \
    -DOPENSSL_INCLUDE_DIR=/usr/include/openssl-1.0 \
    -DOPENSSL_SSL_LIBRARY=/usr/lib/openssl-1.0/libssl.so \
    -DOPENSSL_CRYPTO_LIBRARY=/usr/lib/openssl-1.0/libcrypto.so \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  cd cpprestsdk
  install -Dm644 license.txt ${pkgdir}/usr/share/licenses/cpprestsdk-git/LICENSE
  install -Dm644 ThirdPartyNotices.txt ${pkgdir}/usr/share/licenses/cpprestsdk-git/ThirdPartyNotices
}
