# Maintainer: Jah Way <jahway603 at protonmail dot com>
# Upstream Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>

pkgname=opendht-wtf
_pkgname=opendht
epoch=1
pkgver=2.4.12
pkgrel=1
pkgdesc="C++17 Distributed Hash Table (DHT) implementation"
arch=(x86_64)
url="https://git.jami.net/savoirfairelinux/opendht"
license=(GPL3)
depends=(glibc gnutls nettle readline argon2 jsoncpp libjsoncpp.so fmt http-parser openssl)
makedepends=(git cmake msgpack-cxx asio restinio cython python-setuptools)
checkdepends=(cppunit)
optdepends=('python: to use the Python bindings'
            'msgpack-cxx: linking against opendht')
provides=(opendht)
conflicts=(opendht opendht-git)
source=("$url/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz")
sha512sums=('6d49b86a1e1521406b65d4afa089e8cf11b44ec08bfb54dfe4232707f389c13bd97124ee67cddc1affbb275f87815a02397bdc7581c02b8704015bee464850c9')

build() {
  cmake -B build -S $_pkgname-v$pkgver \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DOPENDHT_DOCUMENTATION=OFF \
    -DOPENDHT_TESTS=ON \
    -DOPENDHT_STATIC=OFF \
    -DOPENDHT_SYSTEMD=ON \
    -DOPENDHT_SYSTEMD_UNIT_FILE_LOCATION=/usr/lib/systemd/system/ \
    -DOPENDHT_INDEX=ON \
    -DOPENDHT_PYTHON=ON \
    -DOPENDHT_HTTP=ON \
    -DOPENDHT_PROXY_SERVER=ON \
    -DOPENDHT_PROXY_CLIENT=ON \
    -DOPENDHT_PUSH_NOTIFICATIONS=ON
  make -C build
}

check() {
  # https://github.com/savoirfairelinux/opendht/issues/568
  make -C build test || echo "Tests failed"
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/$_pkgname-v$pkgver/COPYING" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
