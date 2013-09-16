# $Id: PKGBUILD 193957 2013-09-08 17:18:11Z bisson $
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=xpdf
#pkgver=3.03_pl1
pkgver=3.03
pkgrel=4
pkgdesc='Viewer for Portable Document Format (PDF) files'
url='http://www.foolabs.com/xpdf/'
license=('GPL2')
arch=('i686' 'x86_64')
depends=('lesstif' 'gsfonts' 'libxt')
optdepends=('poppler: tools that used to be included in xpdf'
            'desktop-file-utils: for desktop environments')
#       "ftp://ftp.foolabs.com/pub/${pkgname}/${pkgname}-${pkgver%_*}pl1.patch"
source=("ftp://ftp.foolabs.com/pub/${pkgname}/${pkgname}-${pkgver%_*}.tar.gz"
        'sanitize.patch'
        'char.patch'
        'desktop')
sha1sums=('499423e8a795e0efd76ca798239eb4d0d52fe248'
          '2face78a2f550fd15eeceb8a1ce47c566104f457'   
          '5c471944685a6b24a2b0c0e000562d1a3263aeeb'
          '17ebbfe457cb92e97b12b7362e8ce961526012d9')

install=install
backup=('etc/xpdfrc')

build() {
	cd "${srcdir}/${pkgname}-${pkgver%_*}"

#	patch -p1 -i "../${pkgname}-${_srcver}pl1.patch"
	patch -p1 -i ../sanitize.patch
	patch -p1 -i ../char.patch

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
