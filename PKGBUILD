# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

_dotted_zero=false
_centered_tilde=true
_encodings='uni i15'

pkgname=uw-ttyp0-font
pkgdesc='Bitmap monospaced font with unicode support and Powerline symbols'
pkgver=2.1
pkgrel=1
arch=(any)
url=http://people.mpi-inf.mpg.de/~uwe/misc/uw-ttyp0
source=("${url}/uw-ttyp0-${pkgver}.tar.gz")
license=(custom)
conflicts=(uw-ttyp0-otb otb-uw_ttyp0)
makedepends=(xorg-bdftopcf xorg-mkfontscale perl xorg-fonttosfnt)
sha512sums=('18cb64afd73f64ccfaad5b6b01eef4e50c7d13165a20a14e47e2d66523f80941e3fdf01aeb3c0061ba197d0664123824647e250253f0bf2049055846c5d5d98c')

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
