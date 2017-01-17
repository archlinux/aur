# Maintainer: Popkornium18 <mail@popkornium18.de>
# Contributor: James Morris <james@jwm-art.net>

pkgname=subtitleripper
pkgver=0.3_4
pkgrel=1
pkgdesc="DVD subtitle to text converter"
arch=('x86_64' 'i686')
url="http://subtitleripper.sourceforge.net/"
license=('GPL')
depends=('netpbm')
makedepends=('make' 'gcc')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}-${pkgver//_/-}/${pkgname}-${pkgver//_/-}.tgz")
sha256sums=('8af6c2ebe55361900871c731ea1098b1a03efa723cd29ee1d471435bd21f3ac4')

prepare() {
  cd "$pkgname"
  # use netpbm instead of libppm or whatever it was
  sed -i 's/_HAVE_LIB_PPM_/_HAVE_NETPBM_/g' *
  sed -i 's|<ppm.h>|<netpbm/ppm.h>|g' *.[ch]
  sed -i 's/-lppm/-lnetpbm/' Makefile
  # quieten warnings about exit():
  sed -i '1s/^/#include <stdlib.h>/' subtitle2pgm.c
  # force use of getline to prevent aborted build:
  sed -i 's/DEFINES :=/DEFINES := -DHAVE_GETLINE/' Makefile
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  mkdir -p "${pkgdir}/usr/bin"
  chmod +rx pgm2txt srttool subtitle2pgm subtitle2vobsub vobsub2pgm
  cp pgm2txt srttool subtitle2pgm subtitle2vobsub vobsub2pgm "${pkgdir}/usr/bin"
}
