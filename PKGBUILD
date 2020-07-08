# Maintainer: Simon Lackerbauer < mail [at] ciil [dot] io >
# Co-maintainer: Christian Zugno < chriszugno [at] gmail [dot] com >

pkgname="brother-mfc-l2700dn"
pkgver="3.2.0"
_brotherpkgrel=1
pkgrel=4
pkgdesc="LPR and CUPS driver for the Brother MFC-L2700DN printer"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/"
license=('custom: brother commercial license')
depends=('cups' 'perl' 'ghostscript' 'sed' 'grep')
# cups: the printing system
# perl: the language of the wrapper and filter scripts
# ghostscript: called in the filter script
# sed: called in the filter script and used for package preparation
# grep: called in the wrapper/filter scripts

depends_x86_64=('lib32-glibc')

optdepends=('brscan4: scanner support'
	    'brscan-skey: scanner button support'
	    'ttf-dejavu: printing text files from lpr')
	    # https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=670055
	    # Printing a text file fails when Liberation is the only TrueType font available

install="$pkgname.install"

source=(
	"http://download.brother.com/welcome/dlf102083/mfcl2700dnlpr-$pkgver-$_brotherpkgrel.i386.rpm"
	"http://download.brother.com/welcome/dlf102084/mfcl2700dncupswrapper-$pkgver-$_brotherpkgrel.i386.rpm"
	'cupswrapper-license.txt'
	'lpr-license.txt'
)

md5sums=('ca17e1de085202ae4678aeedb6d14941'
         '207f6d06b06b91101d7619539f553bd7'
         '97ad0cffd216059e9d1d3121899d8646'
         '5e87a3dc0f3e3438c088eda0f3565f0d'
)

prepare() {
	# do not install in '/usr/local'
	if [ -d $srcdir/usr/local/Brother ]; then
		install -d $srcdir/usr/share
		mv $srcdir/usr/local/Brother/ $srcdir/usr/share/brother
		rm -rf $srcdir/usr/local
		sed -i 's|/usr/local/Brother|/usr/share/brother|g' `grep -lr '/usr/local/Brother' ./`
	fi

	# setup cups-directories
	install -d $srcdir/usr/share/cups/model
	install -d $srcdir/usr/lib/cups/filter

	# go to the cupswrapper directory and find the source file from wich to generate a ppd- and wrapper-file
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

	# /etc/printcap is managed by cups
	rm `find $srcdir -type f -name 'setupPrintcap*'`
}

package() {
	cp -R $srcdir/usr $pkgdir
	if [ -d $srcdir/opt ]; then cp -R $srcdir/opt $pkgdir; fi

	install -m 644 -D cupswrapper-license.txt $pkgdir/usr/share/licenses/${pkgname}/cupswrapper-licence.txt
	install -m 644 -D lpr-license.txt $pkgdir/usr/share/licenses/${pkgname}/lpr-licence.txt
}
