# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=flatcc
pkgver=0.4.3
pkgrel=1
pkgdesc="FlatBuffers Compiler and Library in C for C"
arch=('i686' 'x86_64')
makedepends=('cmake' 'make')
url="https://github.com/dvidelabs/flatcc"
license=('Apache')
options=('staticlibs')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/dvidelabs/$pkgname/tar.gz/v$pkgver)
sha256sums=('c0e9e40ddf90caa0cfefc3f3ce73713e6b9ac5eba4b2e946ae20dee0a559f82e')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  mkdir -p build/install && cd build/install
  cmake \
    ../.. \
    -DBUILD_SHARED_LIBS=on \
    -DFLATCC_ALLOW_WERROR=off \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFLATCC_INSTALL=on
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 LICENSE NOTICE -t "$pkgdir/usr/share/licenses/$pkgname"

  msg2 'Installing documentation...'
  install -Dm 644 *.md doc/* -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install -C build/install/
}
