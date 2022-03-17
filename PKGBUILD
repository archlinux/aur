# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Xpdf-nodrm: Mark Pustjens <pustjens@dds.nl>

pkgname=xpdf-motif
pkgver=3.04
pkgrel=3
pkgdesc='Viewer for Portable Document Format (PDF) files, legacy version without qt'
url='http://www.foolabs.com/xpdf/'
license=('GPL2')
arch=('i686' 'x86_64')
depends=('openmotif' 'libpaper' 'libxpm')
conflicts=('xpdf')
provides=('xpdf')
optdepends=('gsfonts: providing the 14 standard postscript fonts'
	    'poppler: tools that used to be included in xpdf'
            'desktop-file-utils: for desktop environments')
source=(https://dl.xpdfreader.com/old/${pkgname%-motif}-${pkgver%_*}.tar.gz{,.sig}
	'02-permissions.patch'
        'desktop')
sha256sums=('11390c74733abcb262aaca4db68710f13ffffd42bfe2a0861a5dfc912b2977e5'
            'SKIP'
            '5f6b730c3d9b99a138a17826c5131ca70315928687757717583056c2429fc3e7'
            '571b528aa130c04106e40f86b17a557f2814d377aab13c29bad08e7dc55087d3')
validpgpkeys=('22CCDF00E35F018434DCD4C5429CCA86671B682D') # Derek B. Noonburg
backup=('etc/xpdfrc')

build() {
  cd "${srcdir}/${pkgname%-motif}-${pkgver%_*}"

  patch -p1 -i ../02-permissions.patch

  sed -i 's:/usr/share/fonts/type1/gsfonts:/usr/share/fonts/Type1:' xpdf/GlobalParams.cc
  sed -i 's:times-medium-r-normal--16:times-medium-r-normal--14:' xpdf/XPDFViewer.cc # FS#14217

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --mandir=/usr/share/man \
    --enable-multithreaded \
    --with-freetype2-library=/usr/lib \
    --with-freetype2-includes=/usr/include/freetype2 \
    --x-includes=/usr/include \
    --with-Xm-library=/usr/lib \
    --with-Xm-includes=/usr/include 

  make
}

package() {
  cd "${srcdir}/${pkgname%-motif}-${pkgver%_*}"

  make DESTDIR="${pkgdir}" install

  install -Dm644 ../desktop "${pkgdir}/usr/share/applications/xpdf.desktop"
  install -Dm644 xpdf/xpdfIcon.xpm "${pkgdir}/usr/share/pixmaps/xpdf.xpm"

  # stuff provided by poppler
  for tool in pdfdetach pdffonts pdfimages pdfinfo pdftoppm pdftops pdftotext; do
    rm "${pkgdir}/usr/bin/${tool}" "${pkgdir}/usr/share/man/man1/${tool}.1"
  done
}
