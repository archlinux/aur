# Maintainer: Martin Reboredo <yakoyoku@gmail.com>

pkgname=libmongocrypt
pkgver=1.7.2
pkgrel=1
pkgdesc='C library for client side and queryable encryption in MongoDB'
arch=('x86_64')
url='https://docs.mongodb.com/mongodb-shell/'
license=('Apache' 'BSD')
depends=(libbson)
makedepends=(cmake)
source=(
  https://github.com/mongodb/$pkgname/archive/refs/tags/$pkgver.tar.gz
  shared-libbson.patch
)
sha256sums=('451d991747a34a06eb0534cb6ec5d486a05c1bd607e66ca5597da170e569cde9'
            '7d07b7f86d7c868e17d1c954d11aadd67e4c1f18455d029ee4afd0e0d132f841')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver

  # patch -Np1 -i ../shared-libbson.patch
  sed -i 's/\(libbson_for_\)static/\1shared/' CMakeLists.txt
}

build() {
  cd "$srcdir"/$pkgname-$pkgver

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
  cd "$srcdir"/$pkgname-$pkgver

  DESTDIR="$pkgdir" cmake --install build
  ln -s libmongocrypt.so "$pkgdir"/usr/lib/mongosh_crypt_v1.so

  install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
