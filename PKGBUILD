# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=opendht-git
pkgver=2.1.9.5.r1.ga77dc855
pkgrel=1
epoch=1
pkgdesc="C++14 implementation of the Kademlia DHT (Distributed Hash Table)"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://github.com/savoirfairelinux/opendht"
license=(GPL3)
depends=(gnutls nettle readline asio jsoncpp argon2)
makedepends=(git msgpack-c cmake cython)
optdepends=('python: to use the Python bindings')
provides=(opendht)
conflicts=(opendht)
source=("git+https://github.com/savoirfairelinux/opendht")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname%-*}"
  install -d build
}

build() {
  cd "${srcdir}/${pkgname%-git}/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DOPENDHT_PYTHON=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}/build"
  make DESTDIR="${pkgdir}" install
  install -D -m644 ../README.md "${pkgdir}/usr/share/doc/opendht/README.md"
}

