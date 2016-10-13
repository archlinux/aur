# Maintainer: Eisfreak7 <eisfreak7@gmail.com>
# Original AUR3 package by: Libernux <dutchman55@gmx.com>
pkgname="brother-dcp150c"
pkgver="1.0.1"
pkgrel=2
_brotherrel=1 # pkgrel for the download url
pkgdesc="LPR and CUPS driver for the Brother DCP150C"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/"
license=('custom:brother commercial license')
depends=('cups')
install="$pkgname.install"
source=(
	"http://www.brother.com/pub/bsc/linux/dlf/dcp150clpr-$pkgver-${_brotherrel}.i386.rpm"
	"http://www.brother.com/pub/bsc/linux/dlf/dcp150ccupswrapper-$pkgver-${_brotherrel}.i386.rpm"
	'cupswrapper-license.txt'
	'lpr-license.txt'
)
md5sums=('f2b4c293af050f76d47f0c480d166bc3'
         '0b0b0e740cb2c30d8709ac564efedf3a'
         '97ad0cffd216059e9d1d3121899d8646'
         '5e87a3dc0f3e3438c088eda0f3565f0d')
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

	# !!!ATTENTION!!!
	# This setting might not be right for you if you print on letter-sized (US) paper.
	# Printing on A4 wasn't centered for me, and manually tweaking the printable area didn't have
	# any effect (I did select A4 paper size in the printing dialog).
	# The only fix I could find is changing the PaperType like below. I don't have a `letter`
	# paper, so I don't know how this affects those who do.
	# If this breaks something for you or you have a better solution, please leave a comment.
	sed -i "s/PaperType=Letter/PaperType=A4/" "${srcdir}/usr/share/brother/Printer/dcp150c/inf/brdcp150crc"
}
package() {
	cp -R "${srcdir}/usr" "$pkgdir"
	if [ -d "${srcdir}/opt" ]; then cp -R "${srcdir}/opt" "$pkgdir"; fi
	install -m 644 -D cupswrapper-license.txt "$pkgdir/usr/share/licenses/${pkgname}/cupswrapper-licence.txt"
	install -m 644 -D lpr-license.txt "$pkgdir/usr/share/licenses/${pkgname}/lpr-licence.txt"
}
