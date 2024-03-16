# Maintainer: bipin kumar <kbipinkumar@pm.me>
# Contributor: Saulius Lukauskas <luksaulius@gmail.com>
# Contributor: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
pkgname=salmon
pkgver=1.10.3
pkgrel=1
pkgdesc="Highly-accurate & wicked fast transcript-level quantification from RNA-seq reads using lightweight alignments"
arch=('x86_64')
url="https://combine-lab.github.io/$pkgname/"
license=('GPL3')
depends=('intel-tbb' 'bzip2' 'jemalloc' 'boost-libs' 'gcc-libs' 'xz' 'zlib' 'glibc')
makedepends=('boost>=1.55' 'cmake' 'unzip' 'cereal' 'curl' 'bzip2' 'python-sphinx')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/COMBINE-lab/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('a053fba63598efc4ade3684aa2c8e8e2294186927d4fcdf1041c36edc2aa0871')

prepare() {
  cd "$pkgname-$pkgver"

  # Add missing include <string> in 1.3.0 headers
  sed -i 's/#include <unordered_map>/#include <unordered_map>\n#include <string>/g' include/BAMUtils.hpp
}

build() {
  cd "$pkgname-$pkgver"

  # FIXME: NO_IPO=TRUE is for some reason needed in 1.3.0
  #        Otherwise it is segfaulting...

  cmake -B build \
    -DNO_IPO:BOOL='TRUE' \
    -DCMAKE_COLOR_MAKEFILE:BOOL='ON' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DCMAKE_SKIP_RPATH=YES \
    -Wno-dev \
    -DBOOST_INCLUDEDIR='/usr/include' \
    -DBOOST_LIBRARYDIR='/usr/lib' \
    -DUSE_SHARED_LIBS=ON

  cmake --build build
  # build manpages
  cd doc
  make man
}

check() {
  cd "$pkgname-$pkgver"

  ctest --test-dir build --output-on-failure

}

package() {
  cd "$pkgname-$pkgver"
  
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644  include/{*.h,*.hpp,*.tpp} -t ${pkgdir}/usr/include/${pkgname}

  #install manpages
  install -d ${pkgdir}/usr/share/man/man1/
  install -Dm644 doc/build/man/salmon.1 ${pkgdir}/usr/share/man/man1/salmon.1

  # clear cmake files
  rm -rf ${pkgdir}/usr/lib/{graphdump,ntcard,twopaco}
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
