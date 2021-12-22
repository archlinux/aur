# Contributor: maltzer
model="l8850cdw"
pkgname="brother-mfc-${model}"
pkgver="1.1.3"
pkgrel=1
_revision=1
pkgdesc="LPR and CUPS driver for the Brother MFC-L8850CDW"
url="https://support.brother.com/g/b/downloadtop.aspx?c=us&lang=en&prod=mfcl8850cdw_us_eu_as"
arch=('i686' 'x86_64')
license=('custom:brother')
install="brother-mfc-${model}.install"
depends=('a2ps' 'cups' 'lib32-libcups')
optdepends=('brscan4: scanning support' 'brscan-skey: scanner button support')
source=("https://download.brother.com/welcome/dlf101092/mfc${model}lpr-1.1.2-1.i386.deb"
        "https://download.brother.com/welcome/dlf101093/mfc${model}cupswrapper-1.1.3-1.i386.deb")
sha256sums=('7e681eb44a81e018706319f2f99ef1372ff75488c83573b94cfd1bcc1522ae0c'
            '5c469daaf22c6d59d7290c1b3265567a512f2f67697725c85fe66aeb39d23990')

package() {
	cd ${srcdir} || return 1
	mkdir lpr cups
	ar x mfcl8850cdwlpr-1.1.2-1.i386.deb --output=lpr >/dev/null || return 1
	ar x mfcl8850cdwcupswrapper-1.1.3-1.i386.deb --output=cups >/dev/null || return 1
	rm -f *.deb || return 1
	rm -f lpr/control.tar.gz lpr/debian-binary cups/control.tar.gz cups/debian-binary || return 1
	tar xzf lpr/data.tar.gz -C ${srcdir}
	tar xzf cups/data.tar.gz -C ${srcdir}
	rm -rf lpr cups
	cd ${srcdir}/opt/brother/Printers/mfc${model} || return 1
	sed -i 's#/etc/init\.d#/etc/rc\.d#g' ./cupswrapper/cupswrappermfc${model} || return 1
	sed -i 's#printcap\.local#printcap#g' ./inf/setupPrintcapij || return 1
	cp -rf ${srcdir}/usr/ ${pkgdir}/ || return 1
	cp -rf ${srcdir}/opt/ ${pkgdir}/ || return 1
}
