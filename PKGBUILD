# Maintainer: Mark Mykkanen <quickcougar at gmail dot com>
# Contributor: Mark Mykkanen <quickcougar at gmail dot com>
pkgname="brother-hl2170w"
pkgver="2.0.2_1"
pkgrel=2
pkgdesc="LPR and CUPS driver for the Brother HL2170W"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/"
license=('custom:brother commercial license')
depends=('cups')
install='brother-hl2170w.install'
source=(
	"https://download.brother.com/welcome/dlf005864/brhl2170wlpr-${pkgver//_/-}.i386.rpm"
	"https://download.brother.com/welcome/dlf005866/cupswrapperHL2170W-${pkgver//_/-}.i386.rpm"
	'cupswrapper-license.txt'
	'lpr-license.txt'
)
sha256sums=('93fef4c4b316f92364367a092266cd4fe7022312e2f7c83638124212e1a21b30'
            'd9c75a2598723bfc4e7754425f46eccef82e3f0205ef6e3cc37645470d1197f8'
            '2c6aa6a641332e5c87e971ac2a8beae13b059747bdba331bbd515914770d72d9'
            '9d85a8aafdaac8fac80e04234ad2acf5642bbf0b91ee582d2a89519a55f6dd67')
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
# go to the cupswrapper directory and find the source file from wich to generate a ppd and
# wrapper-file
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
		chmod +x ./$_wrapper_source
		./$_wrapper_source
		sed -i 's|$srcdir||' $srcdir/usr/lib/cups/filter/*lpdwrapper*
		sed -i "s|$srcdir||" $srcdir/usr/lib/cups/filter/*lpdwrapper*
		rm $_wrapper_source
	fi
#  /etc/printcap is managed by cups
	rm `find $srcdir -type f -name 'setupPrintcap*'`
  chmod 755 $srcdir/usr/lib/cups/filter/brlpdwrapperHL2170W
}
package() {
	cp -R $srcdir/usr $pkgdir
	if [ -d $srcdir/opt ]; then cp -R $srcdir/opt $pkgdir; fi
	install -m 644 -D cupswrapper-license.txt \
    $pkgdir/usr/share/licenses/${pkgname}/cupswrapper-licence.txt
	install -m 644 -D lpr-license.txt $pkgdir/usr/share/licenses/${pkgname}/lpr-licence.txt
}
