# Maintainer: afontenot <adam.m.fontenot@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Simone Sclavi 'Ito' <darkhado@gmail.com>
# Contributor: N30N <archlinux@alunamation.com>

pkgname="mozjpeg"
pkgver=3.2
pkgrel=1
pkgdesc="JPEG image codec with accelerated baseline decoding and superior encoding"
url="https://github.com/mozilla/mozjpeg"
license=("BSD")
arch=("i686" "x86_64")
makedepends=("nasm")
source=("https://github.com/mozilla/${pkgname}/archive/v${pkgver}.tar.gz")
sha1sums=('da2106543d82bfa51fb51e5d4b53397ac28ac87b')

provides=("libjpeg=8.1.2" "turbojpeg" "libjpeg-turbo")
conflicts=("libjpeg" "mozjpeg-git" "turbojpeg" "libjpeg-turbo")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	autoreconf -fiv
	./configure --prefix=/usr --with-jpeg8 --mandir=/usr/share/man
	make
}

# much too slow for default, can be enabled if desired
#check() {
#	cd "${srcdir}/${pkgname}-${pkgver}"
#	make test
#}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make \
		DESTDIR="${pkgdir}" \
		docdir="/usr/share/doc/${pkgname}" \
		exampledir="/usr/share/doc/${pkgname}" \
		install

	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -t "${pkgdir}/usr/share/licenses/${pkgname}" -s "../../doc/${pkgname}/README"{,-turbo.txt,-mozilla.txt}
	install -m644 jpegint.h "${pkgdir}/usr/include"
}
