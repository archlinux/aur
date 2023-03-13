# Maintainer: bipin kumar <kbipinkumar@pm.me>
# Contributor: Saulius Lukauskas <luksaulius@gmail.com>
# Contributor: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
pkgname=salmon
pkgver=1.10.1
pkgrel=3
pkgdesc="Highly-accurate & wicked fast transcript-level quantification from RNA-seq reads using lightweight alignments"
arch=('x86_64')
url="https://combine-lab.github.io/$pkgname/"
license=('GPL3')
depends=('intel-tbb'  'jemalloc' 'boost-libs')
makedepends=('boost>=1.55' 'cmake' 'unzip' 'cereal' 'curl' 'bzip2')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/COMBINE-lab/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('babd9ccc189cfea07566d8a11d047f25fad5b446b4b69257bc6ad8869f8b7707')

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
}

check() {
  cd "$pkgname-$pkgver"

  ctest --test-dir build --output-on-failure

}

package() {
  cd "$pkgname-$pkgver"
  
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644  include/{*.h,*.hpp,*.tpp} -t ${pkgdir}/usr/include/${pkgname}

  # clear cmake files
  rm -rf ${pkgdir}/usr/lib/{graphdump,ntcard,twopaco}
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
