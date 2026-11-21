# Maintainer: Zen Wen <zen.8841@gmail.com>
# Contributor: Moritz Bunkus <moritz@bunkus.org>

pkgname="osslsigncode"
pkgver="2.16"
pkgrel=1
pkgdesc="OpenSSL based Authenticode signing for PE/MSI/Java CAB files"
arch=('i686' 'x86_64')
url="https://github.com/mtrojnar/osslsigncode"
license=('GPL-3.0-or-later')
depends=('curl' 'openssl')
makedepends=('cmake' 'perl' 'python' 'pandoc')
checkdepends=('libfaketime' 'python-cryptography')
source=("https://github.com/mtrojnar/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('02f1235126b821c1aa6eb933a0ea2a0fc8dc08cfa5c0ee6776a50a0c0c48df8cb8b73a7fae08962b90564bfd94b9bb5d651a878423f63e4dde712de8f95028bc')

build() {
  cd "$srcdir"
  cmake \
    -B build -S "$srcdir/osslsigncode-${pkgver}" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

check() {
  cd "$srcdir/build"
  ctest --output-on-failure
}

package() {
  # The HTTP server is started by cmake during the configuration
  # phase, no matter if we want to run tests or not. Therefore we need
  # to ensure the server's been shut down here.
  cd "$srcdir/build"
  python Testing/client_http.py || true 2> /dev/null
  cd ..

  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 build/osslsigncode.1 "$pkgdir/usr/share/man/man1/osslsigncode.1"
  install -Dm644 build/osslsigncode.html "$pkgdir/usr/share/doc/osslsigncode/osslsigncode.html"
}
