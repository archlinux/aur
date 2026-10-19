# Maintainer: Yangtse Su <yangtsesu@gmail.com>
#
# Contributor: Andreas Radke <andyrtr@archlinux.org> (original Arch package recipe)
# Patched rebuild of Arch's "libcupsfilters" package.
#
# Problem (upstream issue): https://github.com/OpenPrinting/cups-filters/issues/762
#   "pdftopdf rotates duplex back sides 180 degrees when the job carries
#    sides=two-sided-* (duplex prints upside down on IPP Everywhere/URF printers)"
#   The responsible code lives in this package, not in cups-filters:
#   cupsfilters/pdftopdf.c, cfFilterPDFToPDF() sets the back side transform to
#   the hard-coded placeholder  "const char *sheet_back = \"rotated\"; "
#   instead of asking the printer (cfGetBackSideOrientation() in
#   cupsfilters/ipp.c reads sides-supported and urf-supported; a URF "DM1"
#   printer reports "normal").  As a result every two-sided-long-edge job gets
#   an extra 180 degree rotation on the back sides, while the printer applies
#   its own duplex imposition - the back side prints upside down.
#
# Fix: libcupsfilters-pdftopdf-backside.patch derives the transform from the
#   printer's reported back side orientation and defaults to "normal"
#   (same default as the raster filters).  Printers that really need a rotated
#   back side are unaffected.  This patch is meant to go upstream; drop this
#   package once libcupsfilters ships a fixed release.
#
_pkgname=libcupsfilters
pkgname=libcupsfilters-duplexfix
pkgver=2.2.1.r32.gd49e9284
_commit=d49e92848060d6d9d2e95679a115a8da5102f1de # master 2026-10-13
pkgrel=1
pkgdesc="OpenPrinting CUPS Filters - contains all the code of the filters of the former cups-filters package as library functions"
arch=('x86_64')
url="https://github.com/OpenPrinting/libcupsfilters"
license=('Apache-2.0 WITH LLVM-exception')
# keep poppler for pdftoppm
depends=('libcups' 'libexif' 'pdfio' 'libjxl' 'poppler'
         'libjpeg-turbo' 'libpng' 'libtiff' 'lcms2'
         'fontconfig' 'glibc' 'dbus')
makedepends=(
	'ghostscript'
	'git' 
#        'mupdf-tools' ???
)
checkdepends=('ttf-dejavu') # ttf-dejavu for make check
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(#"https://github.com/OpenPrinting/libcupsfilters/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
        "git+https://github.com/OpenPrinting/libcupsfilters#commit=$_commit"
        # libcupsfilters-PR167.patch::https://github.com/OpenPrinting/libcupsfilters/pull/167.patch
        libcupsfilters-pdftopdf-backside.patch)
sha256sums=('4136e3d0bc8ef8e881818cf62be67d2486361025200627c22233a7a40b8ec989'
            # 'fa77ba778dcbea8826edcf87c4d022a11c073d288b39a1eaf06e0eaf3376f525'
            '825ab878dd4dd4806478705b44a687fcee4a41353f75f65033d9f126335cf514')

pkgver() {
 cd "$_pkgname"
 git describe --tags | sed 's/-/.r/' | sed 's/-/./'
}

prepare() {
  cd "$_pkgname"
  # https://github.com/OpenPrinting/cups-filters/issues/762
  patch -Np1 -i ../libcupsfilters-pdftopdf-backside.patch
  # https://github.com/OpenPrinting/libcupsfilters/issues/209
  # patch -Np1 -i ../libcupsfilters-PR167.patch
  autoreconf -vfi
}

build() {
  cd "$_pkgname"
  ./configure --prefix=/usr  \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --disable-mutool
  make
}

check() {
  cd "$_pkgname"
  make check
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir/" install
  # license
  mkdir -p "${pkgdir}"/usr/share/licenses/${pkgname}
  # install -m644 "${srcdir}"/${pkgname}-${pkgver}/{COPYING,NOTICE} "${pkgdir}"/usr/share/licenses/${pkgname}/
  install -m644 "${srcdir}"/${_pkgname}/{COPYING,NOTICE} "${pkgdir}"/usr/share/licenses/${pkgname}/
}
