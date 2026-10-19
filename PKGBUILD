# Maintainer: Yangtse Su <yangtsesu@gmail.com>
#
# Contributor: Andreas Radke <andyrtr@archlinux.org> (original Arch package recipe)
# Patched rebuild of Arch's "libcupsfilters" package.
#
# Problem (upstream): https://github.com/OpenPrinting/libcupsfilters/issues/263
#   "pdftopdf: back pages upside down in long-edge duplex" - the same defect was
#   reported earlier as cups-filters#762 (filed in the wrong repository, closed
#   as a duplicate).  The responsible code lives in this package, not in
#   cups-filters: cupsfilters/pdftopdf.c, cfFilterPDFToPDF() hard-codes the back
#   side transform ("const char *sheet_back = \"rotated\";"), so every
#   two-sided-long-edge job gets an extra 180 degree rotation on the back pages
#   while the printer applies its own duplex imposition - the back side prints
#   upside down.  Introduced by the QPDF -> PDFio rewrite (74fc5c36), shipped
#   since libcupsfilters 2.2.0, and for ordinary jobs only since 1973c4a9
#   (print-scaling=auto default).
#
# Fix: libcupsfilters-pdftopdf-backside.patch is the pending upstream fix from
#   https://github.com/OpenPrinting/libcupsfilters/pull/265 : the value becomes
#   "normal".  The PDF stage must not apply a back side transform at all -
#   printers that need a rotated/flipped/manual-tumble back side are handled
#   downstream (cfFilterGhostscript() passes -scupsBackSideOrientation=... to
#   Ghostscript; the raster filters set swap_image_x/y or the CUPS raster header
#   transforms), so deriving the value here would rotate twice.  Drop this
#   package once a fixed libcupsfilters release is in the repositories.
#
_pkgname=libcupsfilters
pkgname=libcupsfilters-duplexfix
pkgver=2.2.1.r32.gd49e9284
_commit=d49e92848060d6d9d2e95679a115a8da5102f1de # master 2026-10-13
pkgrel=2
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
            '9e5d2e27a084caf05a5f1b950559203f8969ae21b03a2bce1110c0a88bb2eed0')

pkgver() {
 cd "$_pkgname"
 git describe --tags | sed 's/-/.r/' | sed 's/-/./'
}

prepare() {
  cd "$_pkgname"
  # https://github.com/OpenPrinting/libcupsfilters/issues/263 (fix: PR #265)
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
