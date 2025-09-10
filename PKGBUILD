# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

_dotted_zero=false
_centered_tilde=true
_encodings='uni i15'

pkgname=uw-ttyp0-font
pkgdesc='Bitmap monospaced font with unicode support and Powerline symbols'
pkgver=2.0
pkgrel=1
arch=(any)
url=http://people.mpi-inf.mpg.de/~uwe/misc/uw-ttyp0
source=("${url}/uw-ttyp0-${pkgver}.tar.gz")
license=(custom)
conflicts=(uw-ttyp0-otb otb-uw_ttyp0)
makedepends=(xorg-bdftopcf xorg-mkfontscale perl xorg-fonttosfnt)
sha512sums=('b30d45bbf307ff62b93b433daf9969637a659f52543f8a896eb4a0d29453bde2d08efdbc50237c44f8ff84bb99c857bc9eb534a02f9e37727cfa998f8e2207ac')

prepare () {
	cd "uw-ttyp0-${pkgver}"

	if [[ -f ${SRCDEST}/VARIANTS.dat ]] ; then
		cp "${SRCDEST}/VARIANTS.dat" .
	else
		if ${_dotted_zero} ; then
			echo 'COPYTO Digit0Dotted Digit0'
		else
			echo 'COPYTO Digit0Slashed Digit0'
		fi >> VARIANTS.dat

		if ${_centered_tilde} ; then
			echo 'COPYTO MTilde AccTildeAscii'
		fi >> VARIANTS.dat
	fi

	if [[ -f ${SRCDEST}/TARGETS.dat ]] ; then
		cp "${SRCDEST}/TARGETS.dat" .
	else
		if [[ -n ${_encodings} ]] ; then
			echo "ENCODINGS = ${_encodings}"
		fi >> TARGETS.dat
	fi
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
	rm -f "$pkgdir/usr/share/fonts"/{misc,OTB/uw-ttyp0}/fonts.{scale,dir}

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
