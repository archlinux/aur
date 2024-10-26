# Maintainer: n3e <n3e at thathat dot net>
#
# Adopted parts of glabels-qt PKGBUILD (original contributors)
# Maintainer: Mario Blättermann <mario.blaettermann@gmail.com>
#
# Adopted parts of barcode PKGBUILD (original contributors)
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
#
# Adopted patched provided by @christianlupus at glabels3-gnubarcode
# Maintainer: n3e <n3e at thathat dot net>

pkgname=glabels-qt-barcode
pkgver=3.99.564
pkgrel=10
pkgdesc="gLabels (Qt) 3.99 Now with GNU barcode 0.99 support."
arch=('x86_64')
url="https://github.com/jimevins/glabels-qt"
license=('GPL3')
depends=('qt5-base' 'qt5-svg' 'qt5-translations')
makedepends=('qt5-tools' 'git' 'cmake')
optdepends=('zint')
provides=("glabels-qt")
conflicts=("glabels-qt")

source=(
  'https://github.com/jimevins/glabels-qt/archive/refs/tags/glabels-3.99-master564.tar.gz'
  'ftp://ftp.gnu.org/gnu/barcode/barcode-0.99.tar.xz'
  'https://github.com/jimevins/glabels-qt/pull/186.patch'
  'glabels_gnubarcode_0.99.patch'
)
sha256sums=(
  '22806961037edf9a419ef7c7b00c8c9c8d230bdfa4267c40aa3ee9bc7160bdd4'
  'e87ecf6421573e17ce35879db8328617795258650831affd025fba42f155cdc6'
  'aac48198fdfc501734e8854c19c9c1686f8278d692f28ccc527580ae4fd0ab90'
  '741622933382c5d21737eccca536b40ba6811c42c440819de57900b7ce9e4aeb'
)

glname=glabels-qt-glabels-3.99-master564
gbname=barcode-0.99

prepare() {
  # Solve Zint issues
  # https://aur.archlinux.org/packages/glabels-qt-git#comment-896142
  patch --directory="${glname}" --forward --strip=1 --input="${srcdir}/186.patch"

  # Introduce support for chamges in GNU barcode 0.99
  patch --directory="${glname}" --forward --strip=1 --input="${srcdir}/glabels_gnubarcode_0.99.patch"
}

build() {

  # Build GNU barcode 0.99
  #

  cd "${srcdir}/${gbname}"
  ./configure --prefix=/usr 
  sed '/^AM_CFLAGS/ s/$/ -fcommon -Wno-error=format-security/' -i Makefile*
  make CFLAGS="$CFLAGS -Wno-error=format-security"

  # Extract some files needed when linking against GNU barcode 0.99
  #

  cd "${srcdir}/${gbname}" && mkdir -p @export
  cp barcode.h config.h lib/gettext.h @export

  # Build gLabels (Qt)
  #

	cd "${srcdir}/${glname}"
	mkdir -p build
	cd build
  CMAKE_INCLUDE_PATH="${srcdir}/${gbname}/@export" \
  CMAKE_LIBRARY_PATH="${srcdir}/${gbname}/.libs" \
  	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "${srcdir}/${glname}/build"
	make DESTDIR="${pkgdir}/" install
}

