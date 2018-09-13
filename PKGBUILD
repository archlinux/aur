# $Id$

pkgname=cups-filters-patched
_pkgname=cups-filters
pkgver=1.21.2
pkgrel=1
pkgdesc="Patched version of OpenPrinting CUPS Filters for glibc 2.28"
arch=('x86_64')
url="https://wiki.linuxfoundation.org/openprinting/cups-filters"
license=('custom')
depends=('lcms2' 'poppler' 'qpdf' 'imagemagick' 'liblouis' 'ijs' 'libcups>=2.2.6-2' 'systemd')
makedepends=('ghostscript' 'ttf-dejavu' 'python' 'mupdf-tools') # ttf-dejavu for make check
optdepends=('ghostscript: for non-PostScript printers to print with CUPS to convert PostScript to raster images'
	    'foomatic-db: drivers use Ghostscript to convert PostScript to a printable form directly'
	    'foomatic-db-engine: drivers use Ghostscript to convert PostScript to a printable form directly'
	    'foomatic-db-nonfree: drivers use Ghostscript to convert PostScript to a printable form directly'
	    'antiword: needed to convert MS Word documents (requires also docx2txt (AUR)')
backup=(etc/cups/cups-browsed.conf)
provides=(cups-filters=1.21.2)
conflicts=(cups-filters)
source=(https://www.openprinting.org/download/cups-filters/$_pkgname-$pkgver.tar.xz
	rewind.patch)
sha256sums=('2203060fd55406e5454b52a7b4bf8906a29a26fdc5777df75709443a5a78e09b'
            '45e368028d6235979010c48d7ee42422f1827f728d35f8df00a5b5249c250ca8')

prepare() {
  cd $_pkgname-$pkgver
  patch -p1 -i ../rewind.patch
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr  \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --with-rcdir=no \
    --enable-avahi \
    --with-browseremoteprotocols=DNSSD,CUPS \
    --enable-auto-setup-driverless \
    --with-test-font-path=/usr/share/fonts/TTF/DejaVuSans.ttf
  make
}

check() {
  cd $_pkgname-$pkgver
  make check
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
  
  # add upstream systemd support file
  install -Dm644 utils/cups-browsed.service ${pkgdir}/usr/lib/systemd/system/cups-browsed.service
  sed -i "s|/usr/sbin/cups-browsed|/usr/bin/cups-browsed|" ${pkgdir}/usr/lib/systemd/system/cups-browsed.service
  sed -i "s|cups.service|org.cups.cupsd.service|g" ${pkgdir}/usr/lib/systemd/system/cups-browsed.service
  
  # use cups group from cups pkg FS#56818
  chgrp -R 209 ${pkgdir}/etc/cups

  # license
  mkdir -p "${pkgdir}"/usr/share/licenses/${_pkgname}
  install -m644 "${srcdir}"/${_pkgname}-${pkgver}/COPYING "${pkgdir}"/usr/share/licenses/${_pkgname}/
}
