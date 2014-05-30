# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=xpdf
pkgver=3.04
pkgrel=1
pkgdesc='Viewer for Portable Document Format (PDF) files'
url='http://www.foolabs.com/xpdf/'
license=('GPL2')
arch=('i686' 'x86_64')
depends=('lesstif' 'gsfonts' 'libxt')
optdepends=('poppler: tools that used to be included in xpdf'
            'desktop-file-utils: for desktop environments')
source=("ftp://ftp.foolabs.com/pub/${pkgname}/${pkgname}-${pkgver%_*}.tar.gz"
        'desktop')
sha1sums=('b9b1dbb0335742a09d0442c60fd02f4f934618bd'
          '17ebbfe457cb92e97b12b7362e8ce961526012d9')

install=install
backup=('etc/xpdfrc')

build() {
	cd "${srcdir}/${pkgname}-${pkgver%_*}"

	sed -i 's:/usr/share/fonts/type1/gsfonts:/usr/share/fonts/Type1:' xpdf/GlobalParams.cc
	sed -i 's:times-medium-r-normal--16:times-medium-r-normal--14:' xpdf/XPDFViewer.cc # FS#14217

	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--mandir=/usr/share/man \
		--enable-multithreaded \
		--enable-wordlist \
		--with-freetype2-library=/usr/lib \
		--with-freetype2-includes=/usr/include/freetype2 \
		--x-includes=/usr/include \
		--with-Xm-library=/usr/lib \
		--with-Xm-includes=/usr/include \

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver%_*}"

	make DESTDIR="${pkgdir}" install

	install -Dm644 ../desktop "${pkgdir}/usr/share/applications/xpdf.desktop"
	install -Dm644 xpdf/xpdfIcon.xpm "${pkgdir}/usr/share/pixmaps/xpdf.xpm"

	# stuff provided by poppler
	for tool in pdfdetach pdffonts pdfimages pdfinfo pdftoppm pdftops pdftotext; do
		rm "${pkgdir}/usr/bin/${tool}" "${pkgdir}/usr/share/man/man1/${tool}.1"
	done
}
