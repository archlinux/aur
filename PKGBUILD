# Maintainer: n3e <n3e at thathat dot net>
#
# Adopted parts of glabels PKGBUILD
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Damir Perisa <damir@archlinux.org>
#
# Adopted parts of barcode PKGBUILD
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
#
# Fingers crossed?

pkgname=glabels3-gnubarcode
pkgver=3.4.1
pkgrel=6
pkgdesc="Creating labels and business cards the very easy way. Now with GNU barcode support."
arch=('x86_64')

url="https://glabels.org/"
license=('GPL' 'LGPL')

depends=('iec16022' 'qrencode' 'zint')
makedepends=('intltool' 'itstool' 'python')

conflicts=(glabels)
provides=(glabels)

source=(
  https://download.gnome.org/sources/glabels/3.4/glabels-${pkgver}.tar.xz
  ftp://ftp.gnu.org/gnu/barcode/barcode-0.99.tar.xz
)
sha256sums=(
  '18e457298abb1c617187361109eeae769317686303fc07726af31e11519c5938'
  'e87ecf6421573e17ce35879db8328617795258650831affd025fba42f155cdc6'
)

prepare() {

  # Via glabels PKGBUILD
  #
  # Don't use legacy path for AppStream metainfo file
  # https://gitlab.gnome.org/GNOME/glabels/merge_requests/2

  cd "${srcdir}/glabels-${pkgver}"
  sed -i 's|appdatadir = $(datadir)/appdata|appdatadir = $(datadir)/metainfo|' data/appdata/Makefile.{am,in}
}

build() {

  # Configure & build barcode-0.99

  cd "${srcdir}/barcode-0.99"
  ./configure --prefix=/usr 
  make

  # Extract header files we'll need when linking against GNU barcode

  cd "${srcdir}/barcode-0.99" && mkdir -p 4glabels
  cp barcode.h config.h lib/gettext.h 4glabels

  # Configure & build glabels, include GNU barcode headers & libraries

  export  CFLAGS="-I${srcdir}/barcode-0.99/4glabels"
  export LDFLAGS="-L${srcdir}/barcode-0.99/.libs"

  cd "${srcdir}/glabels-${pkgver}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-schemas-compile \
    --with-libbarcode
  make

}

package() {
  # Via glabels PKGBUILD

  cd "${srcdir}/glabels-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
