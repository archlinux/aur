# Maintainer: Qirui Wang <wqr.prg@gmail.com>

pkgname=rumur
pkgver=2019.06.30
pkgrel=1
pkgdesc="Yet another Murphi model checker"
arch=('x86_64')
url="https://github.com/Smattr/rumur"
license=('custom:UNLICENSE')
depends=('gmp')
makedepends=('cmake' 'bison>=3.3.2' 'flex' 'python')
checkdepends=('valgrind')
source=("https://github.com/Smattr/$pkgname/archive/v$pkgver.tar.gz"
        '0001-fix-misuse-of-fcntl.patch')
sha256sums=('d51c7cccc65700c11f0854309d5f60f8befa29430350b6b64fe27b83396c9291'
            'e9474f18d2bedadc0150e85273cd8f28a7cd1957875027a10a983c7838d8671f')

prepare() {
  mkdir -p $pkgname-$pkgver/build

  cd $pkgname-$pkgver
  patch -p1 -i ../0001-fix-misuse-of-fcntl.patch
}

build() {
  cd $pkgname-$pkgver/build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make
}

check() {
  cd $pkgname-$pkgver/build
  ../tests/integration-tests.py --verbose
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/licence"
}
