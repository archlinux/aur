# Maintainer: Martin Reboredo <yakoyoku@gmail.com>

pkgname=libmongocrypt
pkgver=1.8.1
pkgrel=1
pkgdesc='C library for client side and queryable encryption in MongoDB'
arch=('x86_64')
url='https://github.com/mongodb/libmongocrypt'
license=('Apache' 'BSD')
provides=(
  libkms_message.so
  libmongocrypt.so
)
depends=(libbson)
makedepends=(cmake)
source=(
  https://github.com/mongodb/$pkgname/archive/refs/tags/$pkgver.tar.gz
  shared-libbson.patch
)
sha256sums=('068a677d3716ac89d730223c1758f041d840eb3363f0521b9969a02bb3a0f977'
            '11dc755ae4560c51f8fad642bb04c8693835e2f2170ab74b18816a04c42c4d55')

prepare() {
  cd "$srcdir"/$pkgbase-$pkgver

  patch -Np1 -i ../shared-libbson.patch
  # sed -i 's/\(libbson_for_\)static/\1shared/' CMakeLists.txt
}

build() {
  cd "$srcdir"/$pkgbase-$pkgver

  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_VERSION="$pkgver" \
    -DBUILD_TESTING=OFF \
    -DENABLE_ONLINE_TESTS=OFF \
    -DENABLE_STATIC=OFF \
    -DMONGOCRYPT_MONGOC_DIR="USE-SYSTEM" \
    -DUSE_SHARED_LIBBSON=ON
  cmake --build build
}

package() {
  cd "$srcdir"/$pkgbase-$pkgver

  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
