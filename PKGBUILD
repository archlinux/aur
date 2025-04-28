pkgname=fmilib
pkgver=3.0.1
pkgrel=1
pkgdesc="open-source implementation of the FMI open standard"
arch=('x86_64')
url="http://www.jmodelica.org/FMILibrary"
license=('BSD')
makedepends=('cmake3-bin')
depends=('glibc')
options=(!lto)
source=("https://github.com/modelon-community/fmi-library/archive/${pkgver}.tar.gz")
sha256sums=('c7a76f486281e4f086b9da5a4137e56c9553bea7fd12461b40e74b046deecccc')

prepare() {
  cd "$srcdir"/fmi-library-${pkgver}

  # error: implicit declaration of function 'fileno'
  sed -i "18i#define _GNU_SOURCE" src/XML/src-gen/FMI1/lex.yyfmi1.c src/XML/src-gen/FMI2/lex.yyfmi2.c
  sed -i "90i#define _GNU_SOURCE" src/XML/src-gen/FMI3/lex.yyfmi3.c
}

build() {
  cd "$srcdir"/fmi-library-${pkgver}
  PATH=/opt/cmake3/bin:$PATH cmake -DCMAKE_INSTALL_PREFIX=/usr -DFMILIB_BUILD_TESTS=OFF -B build .
  make -C build
}

package() {
  cd "$srcdir"/fmi-library-${pkgver}/build
  make DESTDIR="$pkgdir" install
}
