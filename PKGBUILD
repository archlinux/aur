# Maintainer: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Stefan J. Betz <info@stefan-betz.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>
# Contributor: N. I. - izmntuk

pkgname=dar
pkgver=2.5.14
pkgrel=2
pkgdesc='A full featured command-line backup tool, short for Disk ARchive'
arch=('i686' 'x86_64')
url='http://dar.linux.free.fr/'
license=('GPL')
depends=('libgcrypt' 'zlib' 'lzo' 'bzip2' 'xz' 'attr')
optdepends=('perl: for running some samples')
makedepends=('doxygen')
source=("http://downloads.sourceforge.net/project/dar/dar/${pkgver}/dar-${pkgver}.tar.gz")
sha512sums=('035866bd891ff12adbcd18a78fa6f2475c232182b24e35aaf7c3c41c30e6298c4e655ea5a93b9be050c6dee332e2b7913f75e3d399cbee96a1f1d3101d33fbbc')
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
