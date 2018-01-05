# Maintainer: Simon Bachmann <simonbachmann at bluewin dot ch>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Libernux <dutchman55@gmx.com>
# Contributor: Roland Singer <roland@manjaro.org>
pkgname=brother-dcp7045n
pkgver=2.0.2
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother DCP7045N"
arch=('i686' 'x86_64')
url=http://solutions.brother.com/linux/en_us/
license=('custom:brother commercial license')
depends=('cups')
install="$pkgname.install"
#http://download.brother.com/welcome/dlf005623/brdcp7045nlpr-2.0.2-1.i386.rpm
source=(
	"http://www.brother.com/pub/bsc/linux/dlf/brdcp7045nlpr-$pkgver-1.i386.rpm"
	"http://www.brother.com/pub/bsc/linux/dlf/cupswrapperDCP7045N-$pkgver-1.i386.rpm"
	'cupswrapper-license.txt'
	'lpr-license.txt'
)

md5sums=('327cab9fb283ca6035d47ed97206b621'
         'a229936de021790162bd27008b5a9971'
         '97ad0cffd216059e9d1d3121899d8646'
         '5e87a3dc0f3e3438c088eda0f3565f0d')

if test "$CARCH" == x86_64; then
  depends+=('lib32-glibc')
fi
prepare() {
#  do not install in '/usr/local'
	if [ -d $srcdir/usr/local/Brother ]; then
	        install -d $srcdir/usr/share
                rm -rf $srcdir/usr/share/brother &> /dev/null
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
	if [ -d $srcdir/opt ]; then cp -R $srcdir/opt $pkgdir; fi
	install -m 644 -D cupswrapper-license.txt $pkgdir/usr/share/licenses/${pkgname}/cupswrapper-licence.txt
	install -m 644 -D lpr-license.txt $pkgdir/usr/share/licenses/${pkgname}/lpr-licence.txt
    #
    #Applying commands from archasaurusrex comment 
    #
    chown daemon:lp $pkgdir/usr/share/brother/inf/brDCP7045Nrc
}


