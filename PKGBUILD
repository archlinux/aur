# Maintainer: Ronald Gil <me@ronaldgil.com>
# Copied from the MFC-J5910DW package created by Libernux <dutchman55@gmx.com>
pkgname="brother-mfc-j460dw"
pkgver="1.0.0"
pkgrel=0
pkgdesc="LPR and CUPS driver for the Brother MFC-J460DW"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/"
license=('custom:brother commercial license')
depends=('cups')
optdepends=('brscan4' 'brscan-skey')
install="$pkgname.install"
source=(
  "http://download.brother.com/welcome/dlf102538/mfcj460dwlpr-$pkgver-$pkgrel.i386.rpm"
  "http://download.brother.com/welcome/dlf102539/mfcj460dwcupswrapper-$pkgver-$pkgrel.i386.rpm"
	'cupswrapper-license.txt'
	'lpr-license.txt'
)
md5sums=('9d14b32b44551df81c2cf1f1d0ec7dc9'
         '6ab0a419ac295472a09318b9537253ae'
         '97ad0cffd216059e9d1d3121899d8646'
         '8fd9dfb02716f9334bf07a119fa2e486')

if test "$CARCH" == x86_64; then
  depends+=('lib32-glibc')
fi

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

  # go to the cupswrapper directory and find the source file from which to generate a ppd- and wrapper-file
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
