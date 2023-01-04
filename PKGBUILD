# Maintainer: Mikesco3 <mikesco3@gmail.com>
# Based on package from David Pflug <david@pflug.email>
# Based on package from Phil Martella <philmartella@live.com>
# Based on brother-hl3150cdw by MCMic <come.bernigaud@laposte.net>
pkgname="brother-hl4570cdw-git"
pkgver=1.1.4
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother HL-4570CDW"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/"
license=('custom:brother commercial license')
depends=('cups')
install='brother-hl4570cdw-git.install'
source=(
	"https://download.brother.com/welcome/dlf005943/hl4570cdwlpr-1.1.1-5.i386.rpm"
	"https://download.brother.com/welcome/dlf005945/hl4570cdwcupswrapper-1.1.1-5.i386.rpm"
	'cupswrapper-license.txt'
	'lpr-license.txt'
)
sha512sums=('7a46a6ce98d1f053ff72c5aa689a557ffa966672557c04132a078637b1a6486581794d1828a0fc8e8d9c37e97a541649d7a97e4424ff35e1c6da3c01c998578e'
            'dc9447cce7b70899fa77d4d6ba5f5a41d4709ed60d408efe98e6cb03a6740278b556ae065c66b4aee3f644bbd0cbc563ca7fa953c1559d3573872314ccbb6a08'	
            'bd035acc69734d954c132df67e80476094044d2c929e97bd6e0467aacfeefa9883da7474af8d8ff7fa65c3043ec6e1d8e0386e032c3f2121c36b0f6bfd079c86'
            'bf555e3622b68cc8a4d89f9fbb26ca09f29acf66c07d517be8aa7b58d985e1408d0d1bde408ba3b0e0aa842a69d6ebf0b4a1d194673203f42a3cbcecdcfaca06')
if test "$CARCH" == x86_64; then
	depends+=('lib32-glibc')
fi
prepare() {
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
