# Maintainer: Maxime Arthaud <maxime@arthaud.me>

pkgname=ikos
pkgver=1.1.0
pkgrel=1
pkgdesc='A static analysis tool for C/C++ developed by NASA'
arch=('any')
url='https://ti.arc.nasa.gov/opensource/ikos/'
license=('custom:NOSA 1.3')
depends=('gmp' 'boost-libs' 'python' 'sqlite' 'llvm' 'llvm-libs' 'clang')
makedepends=('cmake' 'boost')
source=('https://ti.arc.nasa.gov/m/opensource/downloads/ikos/ikos-1.1.0.tar.gz'
        'https://ti.arc.nasa.gov/m/opensource/downloads/ikos/IKOS_NASA_Open_Source_Agreement.pdf')
sha512sums=('aee0e0851c6d7a05b1c9f12efd3dba71aafc889c93fcfe958970b88dc2b134ed193f06010501ff0d40f9e5834eb0866b89f17c2a9b3b144c96213f733273dc66'
            '3caeffbe06254b3a181eee1f172bde48d7c8007e989b07928b0ce4e737759d5e2649d25419722c3b7a78ca8ddf408ce150a143490489641527cbcac479c241b7')

prepare() {
  cd "$srcdir/ikos-1.1.0"

  mkdir build
}

build() {
  cd "$srcdir/ikos-1.1.0/build"

  cmake \
    -G "Unix Makefiles" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="$pkgdir/opt/ikos" \
    ..

  make
}

package() {
  cd "$srcdir/ikos-1.1.0/build"

  make install

  mkdir -p "$pkgdir/usr/bin"
  echo '#!/bin/bash
export IKOS_INSTALL=/opt/ikos
exec $IKOS_INSTALL/bin/ikos "$@"' > "$pkgdir/usr/bin/ikos"
  chmod 655 "$pkgdir/usr/bin/ikos"

  install -Dm644 "$srcdir/IKOS_NASA_Open_Source_Agreement.pdf" "$pkgdir/usr/share/licenses/ikos/LICENSE"
}
