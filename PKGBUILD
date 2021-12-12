# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=libgraphqlparser
pkgver=0.7.0
pkgrel=3
pkgdesc="A GraphQL query parser in C++ with C and C++ APIs"
arch=('x86_64')
url="https://github.com/graphql/libgraphqlparser"
license=('BSD')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'python')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/graphql/$pkgname/archive/v$pkgver.tar.gz"
  'use_python3.patch'
)
sha512sums=('973292b164d0d2cfe453a2f01559dbdb1b9d22b6304f6a3aabf71e2c0a3e24ab69dfd72a086764ad5befecf0005620f8e86f552dacc324f9615a05f31de7cede'
            'bf20aad5ce3708aed8508c999b03f24ea1f63c281d95a4e1d5683f85309eadca3c2caa9f2ef43cedf0d849c571b853adf05de2ded30a8fa306fd544dde6a4c40')

prepare() {
  cd "$pkgname-$pkgver"

  # Python 2 is super *super* _super_ EOL.
  patch -p1 -i ../use_python3.patch
  2to3 \
    --write \
    --nobackups \
    ast
}

build() {
  cd "$pkgname-$pkgver"

  cmake -DCTYPESGEN_FOUND=Off -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
