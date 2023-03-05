# Maintainer: pkfbcedkrz <pkfbcedkrz@gmail.com>
# Contributor: Alan Strauhs <scarydoorsyeah@gmail.com>

_dotted_zero=false
_centered_tilde=true
_encodings='uni i15'

pkgname='uw-ttyp0-otb'
pkgver=1.3
pkgrel=2
pkgdesc='Monospaced bitmap font with unicode support and powerline symbols (OTB version)'
arch=('any')
url='http://people.mpi-inf.mpg.de/~uwe/misc/uw-ttyp0'
license=('custom:TTYP0')
makedepends=('fonttosfnt-git' 'perl')
source=("${url}/uw-ttyp0-${pkgver}.tar.gz")
md5sums=("SKIP")

prepare() {
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

build() {
    cd "uw-ttyp0-${pkgver}"
	./configure
	make bdf
	
	mkdir -p otb
	for f in genbdf/*.bdf ; do
		if grep -Fq 'FAMILY_NAME "' "$f" 2>/dev/null; then
        	family_name="$(grep -F 'FAMILY_NAME "' "$f")"
        	family_name="${family_name%\"}"
        	family_name_otb="$family_name (OTB)"
        	sed -i "s/$family_name/$family_name_otb/" "$f"
        fi
	    f=${f##*/}
	    fonttosfnt -b -c -g 2 -m 2 -o "otb/uw-ttyp0-${pkgver}-${f/bdf/otb}" "genbdf/${f}"
	done
}

package() {
	cd "uw-ttyp0-${pkgver}"

	install -d "$pkgdir/usr/share/fonts/misc"

	install -m644 otb/*.otb "${pkgdir}/usr/share/fonts/misc/"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
