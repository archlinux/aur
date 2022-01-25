# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=mothur
pkgver=1.47.0
pkgrel=1
pkgdesc='A bioinformatics program for analyzing microbial communities.'
arch=('x86_64')
url='https://www.mothur.org/'
license=('GPL3')
depends=('boost-libs')
makedepends=('boost' 'hdf5')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v.${pkgver}.tar.gz")
sha256sums=('b33a1d56476c729fe0f7070345712caaee6b3aa2e603953eec052e945b6f2eab')

prepare() {
  cd "${pkgname}-v.${pkgver}"

   # I hate this so much.
   sed -i '87d' source/mothur.h
   sed -i '13 i \#include <memory>' source/writer.h
   sed -i '17 i \#include "unistd.h"' source/utils.cpp
   sed -i 's/skipUchime),/skipUchime), source\/,/g' Makefile
   sed -i 's/CXXFLAGS = -O3/CXXFLAGS = -O3 -std=c++11/' source/uchime_src/makefile
}

build() {
  cd "${pkgname}-v.${pkgver}"

  make
}

package() {
  cd "${pkgname}-v.${pkgver}"

  install -Dm755 mothur "${pkgdir}/usr/bin/mothur"
  install -Dm755 uchime "${pkgdir}/usr/bin/uchime"
}
