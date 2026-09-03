# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>

pkgname=brother-hl3140cw
pkgver=1.1.4
pkgrel=1
_lprver=1.1.2-1 # LPR driver release
_cwver=1.1.4-0  # CUPS wrapper release
pkgdesc="LPR and CUPS driver for the Brother HL-3140CW colour LED printer"
arch=('x86_64')
url="https://support.brother.com/g/b/downloadlist.aspx?c=us&lang=en&prod=hl3140cw_us_eu&os=127"
license=('LicenseRef-Brother' 'GPL-2.0-or-later')
depends=('cups' 'ghostscript' 'lib32-glibc')
optdepends=('a2ps: print plain text files')
source=("https://download.brother.com/welcome/dlf007067/hl3140cwlpr-${_lprver}.i386.rpm"
        "https://download.brother.com/welcome/dlf007069/hl3140cwcupswrapper-${_cwver}.i386.rpm"
        'lpr-license.txt'
        'cupswrapper-license.txt')
sha256sums=('60f262ce506ad3ccabf119465d714b15bb67ab7ea3dbacb3b2f03528aa7be5e7'
            'baadb99787d28f7ad9f8e3fe06f0fa451b8945abdea4794e305e0e6470df0aaa'
            '9e71d8f28a8d9e2cde6b329ac56eac8ef23b53e36531f1b83d7ef4d94b303bf4'
            '353433180a29a5dd67b94cbe626362d5a152b85f40b2b920696389e2e100c06c')

prepare() {
	local wrapper=opt/brother/Printers/hl3140cw/cupswrapper/cupswrapperhl3140cw

	# Brother's cupswrapper script generates the PPD and the CUPS filter, then
	# registers the printer on the live system. Point every absolute path at
	# $srcdir and drop the live-system steps so it only produces the files.
	install -d usr/share/cups/model usr/lib/cups/filter
	sed -i -e '/lpadmin/d' -e '/^sleep/d' -e '/^uris=/d' \
	       -e "s|/usr/|$srcdir/usr/|g" -e "s|/opt/|$srcdir/opt/|g" -e "s|/var/tmp/|$srcdir/|g" \
	       "$wrapper"
	sh "$wrapper"
	sed -i "s|$srcdir||g" usr/lib/cups/filter/brother_lpdwrapper_hl3140cw
	rm "$wrapper"

	# /etc/printcap is managed by CUPS
	rm opt/brother/Printers/hl3140cw/inf/setupPrintcapij
	chmod 644 opt/brother/Printers/hl3140cw/cupswrapper/brother_hl3140cw_printer_en.ppd
}

package() {
	cp -a usr opt "$pkgdir"/
	install -Dm644 lpr-license.txt cupswrapper-license.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
