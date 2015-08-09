# Maintainer: Ingo Sieverdingbeck <aur@sieverdingbeck.com>
pkgname="brother-dcp7065dn"
pkgver="2.0.4"
pkgrel=2
pkgdesc="LPR and CUPS driver for the Brother DCP7065DN"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/"
license=('custom:brother commercial license')
backup=(
	'usr/share/brother/Printer/DCP7065DN/inf/brDCP7065DNfunc'
	'usr/share/brother/Printer/DCP7065DN/inf/brDCP7065DNrc'
)

depends=('cups')
install="$pkgname.install"
source=(
	"http://www.brother.com/pub/bsc/linux/dlf/dcp7065dnlpr-2.1.0-1.i386.deb"
	"http://www.brother.com/pub/bsc/linux/dlf/cupswrapperDCP7065DN-$pkgver-$pkgrel.i386.deb"
	'cupswrapper-license.txt'
	'lpr-license.txt'
)
md5sums=(
	'505edb3ad16df7b00513a6a66ed4b320'
	'e136add1e00e990796f2b954406da9f7'
	'97ad0cffd216059e9d1d3121899d8646'
	'5e87a3dc0f3e3438c088eda0f3565f0d'
)

sha256sums=(
	'aeb6b0243b1be22aba99e162eea8abed63b146b8fd55c0dd63c6eada0c148834'
	'b7c703cbc7829b850e5a90b30d78e52dfca8bf5b08aa00b280b67f7e07ccb759'
	'2c6aa6a641332e5c87e971ac2a8beae13b059747bdba331bbd515914770d72d9'
	'9d85a8aafdaac8fac80e04234ad2acf5642bbf0b91ee582d2a89519a55f6dd67'
)

if test "$CARCH" == x86_64; then
  depends+=('lib32-glibc')
fi
prepare() {

	mkdir -p $srcdir/unpack || return 1
	for i in $srcdir/*.deb; do
		cd $srcdir/unpack
		ar -x $i || return 1
		cd $srcdir
		bsdtar -pxf $srcdir/unpack/data.tar.gz || return 1
	done
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
	if [ -d $srcdir/opt ]; then cp -R $srcdir/opt $pkgdir; fi
	install -m 644 -D cupswrapper-license.txt $pkgdir/usr/share/licenses/${pkgname}/cupswrapper-licence.txt
	install -m 644 -D lpr-license.txt $pkgdir/usr/share/licenses/${pkgname}/lpr-licence.txt
}
