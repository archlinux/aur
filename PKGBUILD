# Maintainer: Benjamín Moraga <benjamin.baezam@gmail.com>
pkgname="brother-hl1202"
pkgver="3.0.1_1"
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother HL-1202"
arch=('x86_64')
url="http://solutions.brother.com/linux/en_us/"
license=('custom:brother commercial license')
depends=('cups' 'ghostscript' 'foomatic-db' 'foomatic-db-engine' 'foomatic-db-nonfree')
install="$pkgname.install"
source=(
        "https://download.brother.com/welcome/dlf101870/hl1200cupswrapper-${pkgver//_/-}.i386.rpm"
	"https://download.brother.com/welcome/dlf101869/hl1200lpr-${pkgver//_/-}.i386.rpm"
)
md5sums=(
	'79a5b0119985bc89c6dc16dfee6e9c1b'
	'de895b93a9cdb562c5b8be633ae6c0ad'
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
	mv $srcdir/opt/brother/Printers/HL1200/cupswrapper/*.ppd /$srcdir/usr/share/cups/model
	mv $srcdir/opt/brother/Printers/HL1200/cupswrapper/*lpdwrapper* $srcdir/usr/lib/cups/filter
#  /etc/printcap is managed by cups
	rm `find $srcdir -type f -name 'setupPrintcap*'`
}
package() {
	cp -R $srcdir/usr $pkgdir
	if [ -d $srcdir/opt ]; then cp -R $srcdir/opt $pkgdir; fi
}
