# Maintainer: Maxime Arthaud <maxime@arthaud.me>

pkgname=ikos
pkgver=1.0.0
pkgrel=1
pkgdesc='A static analysis tool for C/C++ developed by NASA'
arch=('any')
url='https://ti.arc.nasa.gov/opensource/ikos/'
license=('custom:NOSA 1.3')
depends=('gmp' 'boost-libs' 'python' 'sqlite' 'llvm' 'llvm-libs' 'clang')
makedepends=('cmake' 'boost')
source=('https://ti.arc.nasa.gov/m/opensource/downloads/ikos/ikos-1.0.0.tar.gz'
        'https://ti.arc.nasa.gov/m/opensource/downloads/ikos/IKOS_NASA_Open_Source_Agreement.pdf'
        'llvm-3.8.patch')
sha512sums=('d8b71d401d002ee22d39b4c68ecd97ba098d334fa966cf6b0d4f3328bdd85fa60b68d3c66543f154933dbb4dd53247422243cdb12418338d85a6ef8bb35b9051'
            '3caeffbe06254b3a181eee1f172bde48d7c8007e989b07928b0ce4e737759d5e2649d25419722c3b7a78ca8ddf408ce150a143490489641527cbcac479c241b7'
            '2b0862679081be24772d2172fc1145833edf124f4ec54839925022428bb7db91e28e30be9fe8ccd0884f60526188db5ce1e621748e68b7e69e7423856a527596')

prepare() {
  cd "$srcdir/ikos-1.0.0"

  # Fix for llvm 3.8
  patch -p0 < ../llvm-3.8.patch

  mkdir build
}

build() {
  cd "$srcdir/ikos-1.0.0/build"

  cmake \
    -G "Unix Makefiles" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="$pkgdir/opt/ikos" \
    ..

  make
}

package() {
  cd "$srcdir/ikos-1.0.0/build"

  make install

  mkdir -p "$pkgdir/usr/bin"
  echo '#!/bin/bash
export IKOS_INSTALL=/opt/ikos
exec $IKOS_INSTALL/bin/ikos "$@"' > "$pkgdir/usr/bin/ikos"
  chmod 655 "$pkgdir/usr/bin/ikos"

  install -Dm644 "$srcdir/IKOS_NASA_Open_Source_Agreement.pdf" "$pkgdir/usr/share/licenses/ikos/LICENSE"
}
