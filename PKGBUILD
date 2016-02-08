# Maintainer: Jnogueira <jnogueira at yandex dot com>
# Based on the DCP-J552DW PKGBUILD -> Marius Rejdak <mariuswol at gmail dot com>
_Bmodel=mfc
_Bversion=j6920dw
pkgver=3.0.0
pkgrel=1
_pkgname=${_Bmodel}${_Bversion}
pkgname=brother-${_Bmodel}-${_Bversion}
pkgdesc="Driver for the Brother ${_Bmodel^^}-${_Bversion^^} printer"
url="http://solutions.brother.com/linux/en_us/index.html"
license=('custom:brother')
depends=('a2ps' 'cups')
makedepends=('rpmextract')
arch=('i686' 'x86_64')

md5sums=('6bc2cce4909849fe1f248a3a511421a6'
         '1820c6bbec17476a6c03699eeaf3e85a')

source=(
    "http://www.brother.com/pub/bsc/linux/dlf/${_pkgname}lpr-${pkgver}-${pkgrel}.i386.rpm" \
    "http://www.brother.com/pub/bsc/linux/dlf/${_pkgname}cupswrapper-${pkgver}-${pkgrel}.i386.rpm"
)

cat <<EOF > "${startdir}/${pkgname}.install"
post_install() {
	# lpr
	/opt/brother/Printers/${_pkgname}/inf/setupPrintcapij ${_pkgname} -i
	
	# cupswrapper
	/opt/brother/Printers/${_pkgname}/cupswrapper/cupswrapper${_pkgname}
	
	systemctl restart org.cups.cupsd
}

post_upgrade() {
	/bin/true
}

pre_remove() {
	# lpr
	/opt/brother/Printers/${_pkgname}/inf/setupPrintcapij ${_pkgname} -e
	
	# cupswrapper
	/opt/brother/Printers/${_pkgname}/cupswrapper/cupswrapper${_pkgname} -e
}

op=\$1
shift

\$op "\$@"
EOF

install="${pkgname}.install"

build() {
    sed -i -e 's:chown lp $SPOOLER_NAME:chown root $SPOOLER_NAME:g' $srcdir/opt/brother/Printers/${_pkgname}/inf/setupPrintcapij
}

package() {
    install -d "$pkgdir"/usr/bin
    install -d "$pkgdir"/var/spool/lpd
    install -Dm755 "$srcdir"/usr/bin/brprintconf_${_pkgname} "$pkgdir"/usr/bin/
    cp -R "$srcdir"/opt "$pkgdir"/opt
}
