# Maintainer: Aleksandar Trifunović <akstrfn@gmail.com>

pkgname=prime_server
pkgver=0.7.0
pkgrel=2
pkgdesc="Non-blocking server API for distributed computing and SOA based on zeromq."
arch=('x86_64')
url="https://github.com/kevinkreiser/prime_server"
license=('custom')
depends=('curl' 'zeromq' 'czmq')
makedepends=('cmake')
source=("https://github.com/kevinkreiser/prime_server/archive/$pkgver.tar.gz")
sha256sums=('4c540c351cec29c19229b26fb0db1ba5dfba719dd0b4e029198da6a936950107')

prepare() {
  cd "$pkgname-$pkgver"
  curl https://gist.githubusercontent.com/kevinkreiser/39f2e39273c625d96790/raw/c5b9b40d1e47cd190d78582993fd07e4478540af/logging.hpp > src/logging/logging.hpp
  curl https://gist.githubusercontent.com/kevinkreiser/ada902fb51a1ad1e5a27/raw/1c45352fa2c4e25a748cf1221b93a9aed4dbc34c/testing.hpp > test/testing/testing.hpp
  sed -i 's/-pedantic//;s/-Werror//' CMakeLists.txt
  sed -i 's/VERSION 0.6.7/VERSION 0.7.0/' CMakeLists.txt

  cmake -S. -Bbuild \
    -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
    -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
    -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

}

build() {
  cd "$pkgname-$pkgver/build"
  make
}

check() {
  cd "$pkgname-$pkgver/build"
  ctest --parallel `nproc`
}

package() {
  cd "$pkgname-$pkgver"
  cmake --build build -- DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set softtabstop=2 shiftwidth=2 expandtab:
