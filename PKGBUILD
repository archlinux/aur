# Maintainer: Michael Hansen <zrax0111 gmail com>
# Contributor: Nicolas Quiénot < niQo at aur >

pkgname=libkqueue
pkgver=2.2.0
pkgrel=1
pkgdesc="userspace implementation of the kqueue kernel event notification mechanism found in FreeBSD and other BSD-based"
url="https://github.com/mheily/libkqueue"
arch=('i686' 'x86_64')
license=('BSD')
depends=('glibc')
makedepends=('gcc')
options=('!libtool')
source=(https://github.com/mheily/$pkgname/archive/v$pkgver.tar.gz
        gcc8.patch)
sha256sums=('bb91679c23224ef9544d55a7a7f39ac833ace6ca2e4feff705a5cce0c6c7d739'
            'f36b0ef0f9298dedbf931fc8d83a7dc1b56a8fb731d6f39141d02440df5a1e80')

prepare() {
  mkdir -p build

  cd $pkgname-$pkgver
  patch -p1 -i "$srcdir"/gcc8.patch
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ../$pkgname-$pkgver
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  cd ../$pkgname-$pkgver
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
