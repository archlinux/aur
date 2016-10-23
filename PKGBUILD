# Maintainer: Maxime Arthaud <maxime@arthaud.me>

pkgname=ikos
pkgver=1.2
pkgrel=1
pkgdesc='A static analysis tool for C/C++ developed by NASA'
arch=('any')
url='https://ti.arc.nasa.gov/opensource/ikos/'
license=('custom:NOSA 1.3')
depends=('gmp' 'boost-libs' 'python' 'sqlite' 'llvm' 'llvm-libs' 'clang')
makedepends=('cmake' 'boost')
source=("https://ti.arc.nasa.gov/m/opensource/downloads/ikos-$pkgver.tar.gz"
        'https://ti.arc.nasa.gov/m/opensource/downloads/ikos/IKOS_NASA_Open_Source_Agreement.pdf')
sha512sums=('b8d594ae6fd2c6458242eeac30cd6350e2837705e5aae057133ab4a19457161c81c641b68043c807e488e15f352061cd29544c407ca10d7ad9bc98b33e7f44f9'
            '3caeffbe06254b3a181eee1f172bde48d7c8007e989b07928b0ce4e737759d5e2649d25419722c3b7a78ca8ddf408ce150a143490489641527cbcac479c241b7')

prepare() {
  cd "$srcdir/ikos-$pkgver"

  mkdir build
}

build() {
  cd "$srcdir/ikos-$pkgver/build"

  cmake \
    -G "Unix Makefiles" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="$pkgdir/opt/ikos" \
    ..

  make
}

package() {
  cd "$srcdir/ikos-$pkgver/build"

  make install

  mkdir -p "$pkgdir/usr/bin"
  echo '#!/bin/bash
export IKOS_INSTALL=/opt/ikos
exec $IKOS_INSTALL/bin/ikos "$@"' > "$pkgdir/usr/bin/ikos"
  chmod 655 "$pkgdir/usr/bin/ikos"

  install -Dm644 "$srcdir/IKOS_NASA_Open_Source_Agreement.pdf" "$pkgdir/usr/share/licenses/ikos/LICENSE"
}
