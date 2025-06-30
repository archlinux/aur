# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="osslsigncode"
pkgver="2.10"
pkgrel='1'
pkgdesc="OpenSSL based Authenticode signing for PE/MSI/Java CAB files"
arch=('i686' 'x86_64')
url="https://github.com/mtrojnar/osslsigncode"
license=('GPL-3.0-or-later')
depends=('curl' 'openssl')
makedepends=('cmake' 'perl' 'python')
checkdepends=('libfaketime')
source=("https://github.com/mtrojnar/${pkgname}/archive/${pkgver}.tar.gz"
        "support-for--python-cryptography-43.patch")
sha512sums=('f91fa1238d7efb8c3a159be158cebfb22deee57ba9b58777e84bf5f0f3f3e6cb7c23226abe52fa45901ae7061e6553a20245055f600de5fdaf60f5e71d5ae438'
            '987026a909418027081615a34cadff2aa93a2bc4b9c07dd695c4965853f3c01072c1fca6b1d4ef6f053d2e104df51562d63289427d8bdec3466e310ec2a43693')

prepare() {
  cd "$srcdir/osslsigncode-${pkgver}"
  patch -p1 -i "$srcdir/support-for--python-cryptography-43.patch"
  cd -

  cmake \
    -B build -S "$srcdir/osslsigncode-${pkgver}" \
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
