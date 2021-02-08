# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Stas Solovey <whats_up@tut.by>

pkgname=nas
pkgver=1.9.4
pkgrel=5
pkgdesc='Network Audio System is a network transparent, client/server audio transport system. Provides libaudio2.so.'
arch=('i686' 'x86_64')
url='http://radscan.com/nas.html'
license=('MIT')
depends=('libxaw')
makedepends=('imake' 'bison' 'flex')
provides=('libaudio2')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.src.tar.gz"
        'license'
        'nasd.service'
        'nasd'
        'patch-llvm11.patch')
sha256sums=('cf36ea63751ce86cfd3b76c1659ce0d6a361a2e7cb34069854e156532703b39d'
            '2f143b0fca5008b88798c8447d169731d93a7c1c2012a33a6ab6cb75c73b8a92'
            'c8c62a2a4d54fa2efbcf722cc277afd0fec75bee204e2f51b2706a4e6a75713e'
            '7c2b7c37d9b9054b6e0f60928bb9c276896f8684ed13ae2477d3ffd31855ed19'
            'c345d1dfd30289847b4f4591f18867fe6e7988217711f1c113f56b6a849fae23')

prepare() {
	cd "${pkgname}-${pkgver}"
	
	patch -f "server/dia/main.c" < "../patch-llvm11.patch"
}

build() {
	cd "${pkgname}-${pkgver}"	

	xmkmf
	make Makefiles
	for f in $(find . -type f -name "Makefile"); do sed -i -r 's/ar clq/ar cq/' "$f"; done
	make cleandir
	make includes
	make depend
	make -k all
}

package() {
	cd "${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" USRLIBDIR="/usr/lib" LDLIBS=-lfl install

	# Remove static libraries
	rm ${pkgdir}/usr/lib/*.a
	# Rename config file
	mv ${pkgdir}/etc/nas/nasd.conf{.eg,}

	install -D -m644 "${srcdir}/nasd.service" "${pkgdir}/usr/lib/systemd/system/nasd.service"
	install -D -m644 "${srcdir}/nasd" "${pkgdir}/etc/conf.d/nasd"
	install -D -m644 "${srcdir}/license" "${pkgdir}/usr/share/licenses/${pkgname}/license"
}
