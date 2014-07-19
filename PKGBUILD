# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

_dotted_zero=false
_centered_tilde=true
_encodings='uni i15'

pkgname='uw-ttyp0-font'
pkgver='1.2'
pkgrel='0'
arch='any'
url='http://people.mpi-inf.mpg.de/~uwe/misc/uw-ttyp0'
source=("${url}/uw-ttyp0-${pkgver}.tar.gz")
license=('custom')
makedepends=('xorg-bdftopcf' 'perl')
install=font.install
sha512sums=('aff3f70fd381921bf4e6394a16b112675ca269930e6b293180c9ec421b2af1ea2b09eccc2f579fde8d51f4541f1a83718f80e589764cbe55316d4cc1fdd98d82')

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
