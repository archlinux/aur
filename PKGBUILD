# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Stas Solovey <whats_up@tut.by>

pkgname=nas
pkgver=1.9.5
pkgrel=2
pkgdesc='Network Audio System is a network transparent, client/server audio transport system. Provides libaudio2.so.'
arch=('i686' 'x86_64')
url='http://radscan.com/nas.html'
license=('MIT')
depends=('libxaw')
makedepends=('imake' 'bison' 'flex')
provides=('libaudio2')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'license'
        'nasd.service'
        'nasd')
sha256sums=('b7884afb38feec03a196bd3b7e9c47b803c830ecd10d7455e9c97e122c37944c'
            '2f143b0fca5008b88798c8447d169731d93a7c1c2012a33a6ab6cb75c73b8a92'
            'c8c62a2a4d54fa2efbcf722cc277afd0fec75bee204e2f51b2706a4e6a75713e'
            '7c2b7c37d9b9054b6e0f60928bb9c276896f8684ed13ae2477d3ffd31855ed19')
backup=('etc/conf.d/nasd'
        'etc/nas/nasd.conf')

prepare() {
	cd "${pkgname}-${pkgver}"
	sed -i 's/unset CFLAGS LDFLAGS; //' 'config/Imakefile'
}

build() {
	cd "${pkgname}-${pkgver}"

	export CFLAGS+=' -std=c11 -Wno-error=implicit-function-declaration -Wno-error=implicit-int'

	xmkmf
	make Makefiles
	for f in $(find . -type f -name "Makefile"); do
		sed -i -r 's/ar clq/ar cq/' "$f"
		sed -E -i \
			-e 's/ CDEBUGFLAGS =.*/ CDEBUGFLAGS = $\(CFLAGS\)/' \
			-e 's/ CFLAGS =.*/ CFLAGS += $\(CCOPTIONS\) $\(THREADS_CFLAGS\) $\(MODULE_CFLAGS\) $\(ALLDEFINES\)/' \
			"$f"
	done
	make cleandir
	make includes
	make depend
	make -j1 all
}

package() {
	cd "${pkgname}-${pkgver}"

	make -j1 DESTDIR="${pkgdir}" USRLIBDIR="/usr/lib" LDLIBS=-lfl install

	# Remove static libraries
	rm ${pkgdir}/usr/lib/*.a
	# Rename config file
	mv ${pkgdir}/etc/nas/nasd.conf{.eg,}

	install -D -m644 "${srcdir}/nasd.service" "${pkgdir}/usr/lib/systemd/system/nasd.service"
	install -D -m644 "${srcdir}/nasd" "${pkgdir}/etc/conf.d/nasd"
	install -D -m644 "${srcdir}/license" "${pkgdir}/usr/share/licenses/${pkgname}/license"
}
