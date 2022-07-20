# Maintainer: Devord <devord at tuta dot io>
# Contributor: Sebastian Lau <lauseb644@gmail.com>
# Contributor: imbaer <imbaer at cryptolab dot net>
# Contributor: Libernux <dutchman55@gmx.com>
# This package is an adaptation of https://aur.archlinux.org/packages/brother-hl3040cn
pkgname="brother-hl3070cw"
pkgver="1.1.2"
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother HL3070CW"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/"
license=('custom:brother commercial license')
depends=('cups')
install='brother-hl3070cw.install'
source=(
	"http://www.brother.com/pub/bsc/linux/dlf/hl3070cwlpr-$pkgver-1.i386.rpm"
	"http://www.brother.com/pub/bsc/linux/dlf/hl3070cwcupswrapper-$pkgver-2.i386.rpm"
	'cupswrapper-license.txt'
	'lpr-license.txt'
)
md5sums=('1e9f14e0065f67d1385bc8c5ab123684'
         'ea3fbd2f8211f00a0e1e8da0125b96e9'
         '9181a7fe7ef4b57d92ac04800c4f5b64'
         'd319bab2a7842f20fd03fe87bedf4eed')
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
#  /etc/printcap is managed by cups
	rm `find $srcdir -type f -name 'setupPrintcap*'`
}
package() {
	cp -R $srcdir/usr $pkgdir
	if [ -d $srcdir/opt ]; then
	   	cp -R $srcdir/opt $pkgdir
		chown root:lp $srcdir/opt/brother/Printers/hl3070cw/inf/
		chmod g+w $srcdir/opt/brother/Printers/hl3070cw/inf/
	fi
	install -m 644 -D cupswrapper-license.txt  $pkgdir/usr/share/licenses/${pkgname}/cupswrapper-licence.txt
	install -m 644 -D lpr-license.txt $pkgdir/usr/share/licenses/${pkgname}/lpr-licence.txt
}

