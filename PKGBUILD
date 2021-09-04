# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=mothur
pkgver=1.46.1
pkgrel=1
pkgdesc='A bioinformatics program for analyzing microbial communities.'
arch=('x86_64')
url='https://www.mothur.org/'
license=('GPL3')
depends=('boost-libs')
makedepends=('boost' 'hdf5')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('29b500b3c92d726cde34922f697f2e47f0b7127d76d9a6fb167cc2b8ba3d00fd')

prepare() {
  cd "${pkgname}-${pkgver}"

   # I hate this so much.
   sed -i '87d' source/mothur.h
   sed -i '13 i \#include <memory>' source/writer.h
   sed -i 's/skipUchime),/skipUchime), source\/,/g' Makefile
   sed -i 's/CXXFLAGS = -O3/CXXFLAGS = -O3 -std=c++11/' source/uchime_src/makefile
}

build() {
  cd "${pkgname}-${pkgver}"

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 mothur "${pkgdir}/usr/bin/mothur"
  install -Dm755 uchime "${pkgdir}/usr/bin/uchime"
}
