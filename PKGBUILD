# Maintainer: bipin kumar <bipin@ccmb.res.in>
# Contributor: Saulius Lukauskas <luksaulius@gmail.com>
# Contributor: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
pkgname=salmon
pkgver=1.10.0
pkgrel=1
pkgdesc="Highly-accurate & wicked fast transcript-level quantification from RNA-seq reads using lightweight alignments"
arch=('x86_64')
url="https://combine-lab.github.io/$pkgname/"
license=('GPL')
depends=('intel-tbb'  'jemalloc' 'boost-libs' 'bzip2')
makedepends=('boost>=1.55' 'cmake' 'unzip' 'cereal')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/COMBINE-lab/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('fd8039c20f8dc717d414c89d32ce80a37b1cf4fda2eb9dba839adedd33a4fa3a')

prepare() {
  cd "$pkgname-$pkgver"

  # Add missing include <string> in 1.3.0 headers
  sed -i 's/#include <unordered_map>/#include <unordered_map>\n#include <string>/g' include/BAMUtils.hpp
}

build() {
  cd "$pkgname-$pkgver"

  # FIXME: NO_IPO=TRUE is for some reason needed in 1.3.0
  #        Otherwise it is segfaulting...

  cmake \
    -DNO_IPO:BOOL='TRUE' \
    -DCMAKE_COLOR_MAKEFILE:BOOL='ON' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -Wno-dev \
    -DUSE_SHARED_LIBS=ON \
    .

  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 include/{*.h,*.hpp,*.tpp} -t ${pkgdir}/usr/include/${pkgname}

  # clear cmake files
  rm -rf ${pkgdir}/usr/lib/{graphdump,ntcard,twopaco}
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
