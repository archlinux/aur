# Maintainer: Alexander Stephan <xan at discolovers dot de>
pkgname="brother-hl2135w"
pkgver="3.1.0_1"
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother HL2135W"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us"
license=('custom:brother commercial license')
depends=('cups'
	 'ghostscript'
	 )
install='brother-hl2135w.install'
source=(
	"http://download.brother.com/welcome/dlf101124/brgenml1lpr-${pkgver//_/-}.i386.rpm"
	"http://download.brother.com/welcome/dlf101126/brgenml1cupswrapper-${pkgver//_/-}.i386.rpm"
	'cupswrapper-license.txt'
	'lpr-license.txt'
)
md5sums=('9ab1b4096a3258ef3498377ce0a76d82'
	 'cdba9c13be7a39ad75daa575f7cdf76e'
	 '809c64563dbd89f89ca68f9218c59cf5'
	 '2441487090df6c4dc1defd2f7d015bec')
if test "$CARCH" == x86_64; then
  depends+=('lib32-glibc')
fi
prepare() {
#  Do not install in '/usr/local'https://download.brother.com/welcome/dlf101124/brgenml1lpr-3.1.0-1.i386.rpm
	if [ -d $srcdir/usr/local/Brother ]; then
		install -d $srcdir/usr/share
		mv $srcdir/usr/local/Brother/ $srcdir/usr/share/brother
		rm -rf $srcdir/usr/local
	        sed -i 's|/usr/local/Brother|/usr/share/brother|g' `grep -lr '/usr/local/Brother' ./`
        fi
# Setup cups-directories
	install -d $srcdir/usr/share/cups/model
	install -d $srcdir/usr/lib/cups/filter
#  Go to the cupswrapper directory and find the source file from wich to generate a ppd- and wrapper-file
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
	if [ -d $srcdir/opt ]; then cp -R $srcdir/opt $pkgdir; fi
	install -m 644 -D cupswrapper-license.txt $pkgdir/usr/share/licenses/${pkgname}/cupswrapper-licence.txt
	install -m 644 -D lpr-license.txt $pkgdir/usr/share/licenses/${pkgname}/lpr-licence.txt
}
