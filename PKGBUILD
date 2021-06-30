#!/usr/bin/bash
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=brother-mfc-j805dw
pkgver=1.0.5
pkgrel=3
pkgdesc="CUPS and LPR driver for Brother mfc-JX05DW(XL) printer"
arch=("i686" "x86_64")
depends_x86_64=('lib32-gcc-libs')
depends=('perl' 'bash')
optdepends=('brscan4')
url="https://support.brother.com/g/b/faqtop.aspx?c=us&lang=en&prod=mfcj805dw_us"
license=("EULA")
source=("https://download.brother.com/welcome/dlf104569/mfcj805dwpdrv-1.0.5-0.i386.deb")
sha256sums=('f299b9674d5edb9c16b5fdbfd39d9ed6b6618f2a30ad942181180e59d3e7a68d')

prepare() {
	tar -xf data.tar.gz -C "$srcdir"
  install -d $srcdir/usr/share/cups/model
	install -d $srcdir/usr/lib/cups/filter

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


}
package() {
       cp -R $srcdir/usr "$pkgdir"

			 if [ -d $srcdir/opt ]; then cp -R $srcdir/opt $pkgdir; fi

       install -D "$pkgdir"/opt/brother/Printers/mfcj805dw/LICENSE_ENG.txt "$pkgdir/usr/share/licenses/$pkgname"
}


