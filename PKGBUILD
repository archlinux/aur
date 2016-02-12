# Maintainer: Jnogueira <jnogueira at yandex dot com>
# Based on the DCP-J552DW PKGBUILD -> Marius Rejdak <mariuswol at gmail dot com>
_Btype=mfc
_Bmodel=j6920dw
pkgver=3.0.0
pkgrel=1
_pkgname=${_Btype}${_Bmodel}
pkgname=brother-${_Btype}-${_Bmodel}
pkgdesc="Driver for the Brother ${_Btype^^}-${_Bmodel^^} printer"
url="http://solutions.brother.com/linux/en_us/index.html"
license=('custom:brother')
depends=('a2ps' 'cups')
makedepends=('rpmextract')
arch=('i686' 'x86_64')

md5sums=(
	'6bc2cce4909849fe1f248a3a511421a6'
	'1820c6bbec17476a6c03699eeaf3e85a'
)

source=(
	"http://www.brother.com/pub/bsc/linux/dlf/${_pkgname}lpr-${pkgver}-${pkgrel}.i386.rpm"
	"http://www.brother.com/pub/bsc/linux/dlf/${_pkgname}cupswrapper-${pkgver}-${pkgrel}.i386.rpm"
)

cat <<EOF > "${startdir}/${pkgname}.install"
post_install() {
	/opt/brother/Printers/${_pkgname}/inf/setupPrintcapij ${_pkgname} -i
	/opt/brother/Printers/${_pkgname}/cupswrapper/cupswrapper${_pkgname}
}

post_upgrade() {
	/bin/true
}

pre_remove() {
	/opt/brother/Printers/${_pkgname}/inf/setupPrintcapij ${_pkgname} -e
	/opt/brother/Printers/${_pkgname}/cupswrapper/cupswrapper${_pkgname} -e
}
EOF

install="${pkgname}.install"

build() {
	sed -i -r -e 's@(/etc/init\.d/lprng stop\s*)$@\1\nfi\nif [ -e /usr/lib/systemd/system/org.cups.cups-lpd.socket ]; then\n\tsystemctl stop org.cups.cups-lpd.socket@gi' \
		-e 's@(/etc/init\.d/cupsys restart\s*)$@\1\nelif [ -e /usr/lib/systemd/system/org.cups.cupsd.service ]; then\n\tsystemctl restart org.cups.cupsd@gi' \
		$srcdir/opt/brother/Printers/${_pkgname}/cupswrapper/cupswrapper${_pkgname}

	if [[ ! $LANG =~ [a-z]{2}_(US|CA) ]]; then
		sed -i -r -e 's@(PaperType\s*=\s*\{?)Letter(\}?\s*)$@\1A4\2@gi' $srcdir/opt/brother/Printers/${_pkgname}/inf/br${_pkgname}{func,rc}
		sed -i -r -e 's@(\*Default[a-z]+:\s+)Letter\s*$@\1A4@gi' $srcdir/opt/brother/Printers/${_pkgname}/cupswrapper/brother_${_pkgname}_printer_en.ppd
	fi

	sed -i -e 's@chown lp $SPOOLER_NAME@chown root $SPOOLER_NAME@g' $srcdir/opt/brother/Printers/${_pkgname}/inf/setupPrintcapij
}

package() {
	install -d "$pkgdir"/usr/bin
	install -d "$pkgdir"/var/spool/lpd
	install -Dm755 "$srcdir"/usr/bin/brprintconf_${_pkgname} "$pkgdir"/usr/bin/
	cp -R "$srcdir"/opt "$pkgdir"/opt
}
