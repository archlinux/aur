# Maintainer: Libernux <dutchman55@gmx.com>
pkgname="brother-hl1118"
pkgver="3.0.2"
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother HL-1110, HL-1110R, HL-1111, HL-1112, HL-1112R, HL-1118"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/"
license=('custom:brother commercial license')
depends=('cups' 'ghostscript' 'foomatic-db' 'foomatic-db-engine' 'foomatic-db-nonfree')
install="$pkgname.install"
source=(
	"http://www.brother.com/pub/bsc/linux/dlf/hl1110lpr-3.0.1-1.i386.rpm"
	"http://www.brother.com/pub/bsc/linux/dlf/hl1110cupswrapper-3.0.1-1.i386.rpm"
)
md5sums=(
	'0ccaf3d18e75a27b5902682410dfc145'
	'408d8e586432cdc1c3d5e04283c5bef1'
)
if test "$CARCH" == x86_64; then
  depends+=('lib32-glibc')
fi
prepare() {
#  do not install in '/usr/local'
	if [ -d $srcdir/usr/local/Brother ]; then
		install -d $srcdir/usr/share
		mv $srcdir/usr/local/Brother/ $srcdir/usr/share/brother
		rm -rf $srcdir/usr/local
	        sed -i 's|/usr/local/Brother|/usr/share/brother|g' `grep -lr '/usr/local/Brother' ./`
        fi
# setup cups-directories
	install -d $srcdir/usr/share/cups/model
	install -d $srcdir/usr/lib/cups/filter
#  go to the cupswrapper directory and find the source file from wich to generate a ppd- and wrapper-file
	cd `find . -type d -name 'cupswrapper'`
	if [ -f cupswrapper* ]; then
		_wrapper_source=`ls cupswrapper*`
		sed -i '/^\/etc\/init.d\/cups/d' $_wrapper_source
		sed -i '/^sleep/d' $_wrapper_source
		sed -i '/^lpadmin/d' $_wrapper_source
		sed -i 's|/usr|$srcdir/usr|g' $_wrapper_source
		sed -i 's|/opt|$srcdir/opt|g' $_wrapper_source
		sed -i 's|/model/Brother|/model|g' $_wrapper_source
		sed -i 's|lpinfo|echo|g' $_wrapper_source
		export srcdir=$srcdir
		./$_wrapper_source
		sed -i 's|$srcdir||' $srcdir/usr/lib/cups/filter/*lpdwrapper*
		sed -i "s|$srcdir||" $srcdir/usr/lib/cups/filter/*lpdwrapper*
		rm $_wrapper_source
	fi
	mv $srcdir/opt/brother/Printers/HL1110/cupswrapper/*.ppd /$srcdir/usr/share/cups/model
	mv $srcdir/opt/brother/Printers/HL1110/cupswrapper/*lpdwrapper* $srcdir/usr/lib/cups/filter
#  /etc/printcap is managed by cups
	rm `find $srcdir -type f -name 'setupPrintcap*'`
}
package() {
	cp -R $srcdir/usr $pkgdir
	if [ -d $srcdir/opt ]; then cp -R $srcdir/opt $pkgdir; fi
}
