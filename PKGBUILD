# Maintainer: Doron Behar <doron.behar@gmail.com>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname=saws
pkgver=20260503
pkgrel=2
pkgdesc="Scientific Application Web Server: monitor and steer running programs (such as PETSc) from a web browser"
arch=('x86_64')
url="https://gitlab.com/petsc/$pkgname"
license=('MIT')
depends=('glibc'
         'cjson')
makedepends=('python')
_commit=028a32f0118f227c9264bebdc282ab71f8eb88db
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$_commit/$pkgname-$_commit.tar.gz")
sha256sums=('d1ea701e0642046e6fc832d54cc5be2196c248845a06abd5069c7b9e441c1f68')

prepare() {
  cd "$pkgname-$_commit"
  # Use the system cJSON instead of the bundled copy
  rm src/cJSON.c src/cJSON.h
}

build() {
  cd "$pkgname-$_commit"
  python ./configure --prefix=/usr --enable-shared --CFLAGS="$CFLAGS -I/usr/include/cjson -MMD -MP" --LDFLAGS="$LDFLAGS" --LIBS="-lcjson -lpthread -lm"
  make -C build all
}

check() {
  cd "$pkgname-$_commit"
  build/bin/simpleJSONtoCStructTest
  build/bin/simpleMultiDirectoryJSONTest
  build/bin/simpleRegisterDeleteTest
}

package() {
  cd "$pkgname-$_commit"
  make -C build DESTDIR="$pkgdir" install
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 js/*.js -t "$pkgdir"/usr/share/$pkgname/js/
}
