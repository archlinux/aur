# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="osslsigncode"
pkgver="2.7"
pkgrel="1"
pkgdesc="OpenSSL based Authenticode signing for PE/MSI/Java CAB files"
arch=('i686' 'x86_64')
url="https://github.com/mtrojnar/osslsigncode"
license=('GPL')
depends=('curl' 'openssl')
makedepends=('cmake' 'perl')
checkdepends=('libfaketime')
source=("https://github.com/mtrojnar/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('474ea2fcce8efb999148f53637a701814d6625a7b2b407b0903f7876cbc78d330ca3b15167a334bc728c00516b638ebaf6233756331c9f3ec3d66a4a6de1fa19')

prepare() {
  cmake \
    -B build -S "$srcdir/osslsigncode-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
}

build() {
  perl -pi -e 's{localhost}{127.0.0.1}' build/Testing/client_http.py

  cmake --build build
}

check() {
  cd build
  ctest Release
}

package() {
  # The HTTP server is started by cmake during the configuration
  # phase, no matter if we want to run tests or not. Therefore we need
  # to ensure the server's been shut down here.
  cd build
  python Testing/client_http.py || true 2> /dev/null
  cd ..

  DESTDIR="$pkgdir" cmake --install build
}
