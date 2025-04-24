pkgname=fmilib
pkgver=3.0
pkgrel=1
pkgdesc="open-source implementation of the FMI open standard"
arch=('x86_64')
url="http://www.jmodelica.org/FMILibrary"
license=('BSD')
makedepends=('cmake3-bin')
depends=('glibc')
options=(!lto)
source=("https://github.com/modelon-community/fmi-library/archive/${pkgver}.tar.gz")
sha256sums=('527bd40f4927b6e42c461ef1088dc1df5b1be107ee11200a73ad1a4ab66fe2df')

prepare() {
  cd "$srcdir"/fmi-library-${pkgver}

  # miniunz.c:141:11: error: implicit declaration of function mkdir
  sed -i "50i#include <sys/stat.h>" ThirdParty/Minizip/minizip/miniunz.c

  # https://github.com/modelon-community/fmi-library/issues/147
  curl -L https://github.com/madler/zlib/commit/63ba7582b80eb81b126c2931e485481c35596aab.patch | patch -p2 -d ThirdParty/Minizip/

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
