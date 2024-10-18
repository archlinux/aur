# Maintainer: Asger Hautop Drewsen <asger@tyilo.com>
# Based on osslsigncode AUR package by Moritz Bunkus <moritz@bunkus.org>

pkgname="osslsigncode-git"
pkgver=r639.db5b4c4
pkgrel=1
pkgdesc="OpenSSL based Authenticode signing for PE/MSI/Java CAB files"
arch=('i686' 'x86_64')
url="https://github.com/mtrojnar/osslsigncode"
license=('GPL')
depends=('curl' 'openssl')
makedepends=('cmake' 'perl' 'python' 'git')
checkdepends=('libfaketime')
conflicts=('osslsigncode')
provides=('osslsigncode')
source=("git+https://github.com/mtrojnar/osslsigncode.git")
sha512sums=('SKIP')

pkgver() {
  cd osslsigncode
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cmake \
    -B build -S "$srcdir/osslsigncode" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
}

build() {
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
