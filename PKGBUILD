# Maintainer: n3e <n3e at thathat dot net>
#
# Adopted parts of glabels PKGBUILD (original contributors)
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Damir Perisa <damir@archlinux.org>
#
# Adopted parts of barcode PKGBUILD (original contributors)
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
#
# Fingers crossed?

pkgname=glabels3-gnubarcode
pkgver=3.4.1
pkgrel=8
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

  # GCC 10 fixes,
  #
  # As per https://bugs.gentoo.org/707686 (a hint in the right direction)
  # As per https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common (solution)
  #
  # With gcc-10 '-fno-common' becomes default, 
  # we must include '-fcommon' for backwards compatibility.

  # The usual way of things

  ./configure --prefix=/usr 

  # AM_CFLAGS seemed like the best insertion point for -fcommon

  sed '/^AM_CFLAGS/ s/$/ -fcommon/' -i Makefile*

  # We could just run 
  # make AM_CFLAGS='-Ilib -march=x86-64 -mtune=generic -O2 -pipe -fno-plt -DHAVE_CONFIG_H -fcommon'
  # but this could break on non-x86-64 builds.

  make

  # Extract header files we'll need when linking against GNU barcode

  cd "${srcdir}/barcode-0.99" && mkdir -p 4glabels
  cp barcode.h config.h lib/gettext.h 4glabels

  # Configure & build glabels, include GNU barcode headers & libraries,
  # include the gcc-10 fix.

  export  CFLAGS="-I${srcdir}/barcode-0.99/4glabels -fcommon"
  export LDFLAGS="-L${srcdir}/barcode-0.99/.libs    -fcommon"

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
