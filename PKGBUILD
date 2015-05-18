# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

_dotted_zero=false
_centered_tilde=true
_encodings='uni i15'

pkgname='uw-ttyp0-font'
pkgdesc='Bitmap monospaced font with unicode support and Powerline symbols'
pkgver='1.3'
pkgrel='1'
arch='any'
url='http://people.mpi-inf.mpg.de/~uwe/misc/uw-ttyp0'
source=("${url}/uw-ttyp0-${pkgver}.tar.gz")
license=('custom')
makedepends=('xorg-bdftopcf' 'perl')
install=font.install
sha512sums=('193966b826cafa313384f20e225d4a0b0057364ed23c2beaf27a59095fdb9079281fdc1d292592038512a56ec0387e531a28449344e2960f0ecd3e64c7a6f6e7')

prepare () {
	cd "uw-ttyp0-${pkgver}"

	if ${_dotted_zero} ; then
		echo 'COPYTO Digit0Dotted Digit0'
	else
		echo 'COPYTO Digit0Slashed Digit0'
	fi >> VARIANTS.dat

	if ${_centered_tilde} ; then
		echo 'COPYTO MTilde AccTildeAscii'
	fi >> VARIANTS.dat

	if [[ -n ${_encodings} ]] ; then
		echo "ENCODINGS = ${_encodings}"
	fi >> ENCODINGS.dat
}

build () {
	cd "uw-ttyp0-${pkgver}"
	./configure --prefix=/usr --pcfdir=/usr/share/fonts/misc
	make
}

package () {
	cd "uw-ttyp0-${pkgver}"
	make install DESTDIR="${pkgdir}"

	# Remove stray files, those are regenerated on install
	rm -f "${pkgdir}/usr/share/fonts/misc/fonts.scale" \
	      "${pkgdir}/usr/share/fonts/misc/fonts.dir"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
