# Maintainer: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Stefan J. Betz <info@stefan-betz.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>
# Contributor: N. I. - izmntuk

pkgname=dar
pkgver=2.5.10
pkgrel=2
pkgdesc='A full featured command-line backup tool, short for Disk ARchive'
arch=('i686' 'x86_64')
url='http://dar.linux.free.fr/'
license=('GPL')
depends=('libgcrypt' 'zlib' 'lzo' 'bzip2' 'xz' 'attr')
optdepends=('perl: for running some samples')
makedepends=('doxygen')
source=("http://downloads.sourceforge.net/project/dar/dar/${pkgver}/dar-${pkgver}.tar.gz")
sha512sums=('90727f206634fc7d8ab7ca1faf588cfdb504d7474096b2965fde18a0a3cc54f603f0df3ddd1b00d331951d5d4688a1adb861eec71034e92aa1428e5ba9e665f1')
backup=('etc/darrc')
options=('!libtool')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	## --enable-threadar: EXPERIMENTAL multithread support
	if [[ "${CARCH}" == x86_64 ]];then
		EXTRA_OPTIONS="--enable-mode=64"
	elif [[ "${CARCH}" == i686 ]];then
		EXTRA_OPTIONS="--enable-mode=32"
	fi
	./configure --prefix=/usr --sysconfdir=/etc --disable-dar-static --disable-static --disable-upx --disable-build-html ${EXTRA_OPTIONS}
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" pkgdatadir="/usr/share/doc/${pkgname}/html" install
	install -d "${pkgdir}/usr/share/doc/${pkgname}"
	install -pm644 AUTHORS ChangeLog NEWS README THANKS TODO "${pkgdir}/usr/share/doc/${pkgname}"
	rm -rf "${pkgdir}/usr/share/doc/dar/html/man"
}
