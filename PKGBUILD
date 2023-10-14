# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=opendht-git
pkgver=3.0.0.r1.g601758f5
pkgrel=2
epoch=1
pkgdesc="C++17 Distributed Hash Table (DHT) implementation"
arch=(x86_64 i686 pentium4 armv7h aarch64)
url="https://github.com/savoirfairelinux/opendht"
license=(GPL3)
depends=(gnutls nettle readline jsoncpp argon2 fmt glibc gcc-libs)
makedepends=(git msgpack-cxx cmake cython python-setuptools cppunit asio)
optdepends=('python: to use the Python bindings')
provides=(opendht)
conflicts=(opendht)
source=("git+https://github.com/savoirfairelinux/opendht")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "opendht" -Wno-dev \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DOPENDHT_PYTHON=ON

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -D -m644 opendht/README.md "${pkgdir}/usr/share/doc/opendht/README.md"
}

