# Maintainer: Stick <stick at stma dot is>
# Contributor: Eric Lehmann <katyl@katyl.info>
# Contributor: Peter Vasil <mail@petervasil.net>
# shellcheck disable=SC2034,SC2148,SC2154

_printer="MFC-J480DW"
pkgname="brother-${_printer,,}"
pkgver="1.0.0"
pkgrel=0
pkgdesc="CUPS and LPR drivers for the Brother $_printer printer"
url="https://support.brother.com/g/b/downloadlist.aspx?c=us&lang=en&prod=mfcj480dw_us_eu_as&os=127"
arch=('i686' 'x86_64')
license=('custom:brother commercial license')
depends=('cups' 'ghostscript' 'a2ps')
optdepends=('brscan4: Scanner support')

if test "$CARCH" == x86_64; then
	depends+=('lib32-glibc')
fi

install="brother-${_printer,,}.install"

source=(
	"http://download.brother.com/welcome/dlf102092/mfcj480dwcupswrapper-$pkgver-$pkgrel.i386.rpm"
	"http://download.brother.com/welcome/dlf102091/mfcj480dwlpr-$pkgver-$pkgrel.i386.rpm"
	'cupswrapper-license.txt'
	'lpr-license.txt'
)
sha256sums=(
	'2a18c4943adc92a2e97f674a638dbdfb87656137a97073577f716ace6a196854'
	'2a1e03b59d6af9dc8d67a9799f06ab439e67565410373081f2f8be65eb697a64'
	'2c6aa6a641332e5c87e971ac2a8beae13b059747bdba331bbd515914770d72d9'
	'9d85a8aafdaac8fac80e04234ad2acf5642bbf0b91ee582d2a89519a55f6dd67'
)


prepare() {
	# do not install in '/usr/local'
	if [ -d "$srcdir/usr/local/Brother" ]; then
		install -d "$srcdir/usr/share"
		mv "$srcdir/usr/local/Brother/" "$srcdir/usr/share/brother"
		rm -rf "${srcdir:?}/usr/local"
		sed -i 's|/usr/local/Brother|/usr/share/brother|g' "$(grep -lr '/usr/local/Brother' ./)"
	fi
	# set up cups-directories
	install -d "$srcdir/usr/share/cups/model"
	install -d "$srcdir/usr/lib/cups/filter"
	# find source file in cupswrapper directory
	cd "$(find . -type d -name 'cupswrapper')" || exit
	_wrapper_source="$(find . -name "cupswrapper*")"
	# generate ppd- and wrapper- files
	sed -i '/^\/etc\/init.d\/cups/d' "$_wrapper_source"
	sed -i '/^sleep/d' "$_wrapper_source"
	sed -i '/^lpadmin/d' "$_wrapper_source"
	# shellcheck disable=2016
	sed -i 's|/usr|$srcdir/usr|g' "$_wrapper_source"
	# shellcheck disable=2016
	sed -i 's|/opt|$srcdir/opt|g' "$_wrapper_source"
	sed -i 's|/model/Brother|/model|g' "$_wrapper_source"
	sed -i 's|lpinfo|echo|g' "$_wrapper_source"
	export srcdir="$srcdir"
	./"$_wrapper_source"
	# shellcheck disable=2016
	sed -i 's|$srcdir||' "$srcdir"/usr/lib/cups/filter/*lpdwrapper*
	sed -i "s|$srcdir||" "$srcdir"/usr/lib/cups/filter/*lpdwrapper*
	rm "$_wrapper_source"
	#  /etc/printcap is managed by cups
	rm "$(find "$srcdir" -type f -name 'setupPrintcap*')"
}
package() {
	cp -R "$srcdir/usr" "$pkgdir"
	[ -d "$srcdir/opt" ] && cp -R "$srcdir/opt" "$pkgdir"
	install -m 644 -D cupswrapper-license.txt "$pkgdir/usr/share/licenses/${pkgname}/cupswrapper-licence.txt"
	install -m 644 -D lpr-license.txt "$pkgdir/usr/share/licenses/${pkgname}/lpr-licence.txt"
}
