# Maintainer: Christoph Brill <egore911@gmail.com>
# Contributor: Libernux <dutchman55@gmx.com>
pkgname="brother-hl3142cw"
pkgver="1.1.3"
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother DCP585CW"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/"
license=('custom:brother commercial license')
depends=('cups')
install="$pkgname.install"
source=(
	"http://download.brother.com/welcome/dlf101630/hl3142cwlpr-$pkgver-0.i386.rpm"
	"http://download.brother.com/welcome/dlf101631/hl3142cwcupswrapper-1.1.4-0.i386.rpm"
	'cupswrapper-license.txt'
	'lpr-license.txt'
)
sha256sums=('74bbd0006e44f75fd12362279e6a71c4e3f27f5441ab14d9511a887affd0dbf0'
            '440e16b3a43015b84cd212517b74dc54a8878c92a193a88dc4fbce2ad0e7f3e0'
            '353433180a29a5dd67b94cbe626362d5a152b85f40b2b920696389e2e100c06c'
            '9e71d8f28a8d9e2cde6b329ac56eac8ef23b53e36531f1b83d7ef4d94b303bf4')
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
	fi
	if [ ! -z $_wrapper_source ];then
		sed -i '/^\/etc\/init.d\/cups/d' $_wrapper_source
		sed -i '/^sleep/d' $_wrapper_source
		sed -i '/^lpadmin/d' $_wrapper_source
		sed -i 's|/usr|$srcdir/usr|g' $_wrapper_source
		sed -i 's|/opt|$srcdir/opt|g' $_wrapper_source		
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
	if [ -d $srcdir/opt ]; then cp -R $srcdir/opt $pkgdir; fi
	install -m 644 -D cupswrapper-license.txt $pkgdir/usr/share/licenses/${pkgname}/cupswrapper-licence.txt
	install -m 644 -D lpr-license.txt $pkgdir/usr/share/licenses/${pkgname}/lpr-licence.txt
}
