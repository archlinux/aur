# Maintainer: Stefano <stefanomilani92@gmail.com>
pkgname="brother-mfc-l2700dw"
pkgver="3.2.0"
pkgrel=2
pkgdesc="LPR and CUPS driver for the Brother MFC-L2700DW"
arch=('i686' 'x86_64')
url="https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=mfcl2700dw_us_eu_as"
license=('custom:brother commercial license')
depends=('cups')
depends_x86_64=('lib32-glibc')
install="$pkgname.install"
source=(
	"http://download.brother.com/welcome/dlf101789/mfcl2700dwlpr-$pkgver-$pkgrel.i386.rpm"
	"http://download.brother.com/welcome/dlf101790/mfcl2700dwcupswrapper-$pkgver-$pkgrel.i386.rpm"
	'cupswrapper-license.txt'
	'lpr-license.txt'
)
sha256sums=(
'de599f5d4b97750984befd2f9731ca73b4dbccbee442107259b1c5c0c48c1a8d'                 '552ba52371cdd47a4e47ab2e5e564ac58e1fbe1bcd530c3d388bc1464bdb9c07'
'2c6aa6a641332e5c87e971ac2a8beae13b059747bdba331bbd515914770d72d9'
'9d85a8aafdaac8fac80e04234ad2acf5642bbf0b91ee582d2a89519a55f6dd67'
)
prepare() {
#  do not install in '/usr/local'
	if [ -d $srcdir/usr/local/Brother ]; then
		install -dm755 "$srcdir/usr/share"
		mv "$srcdir/usr/local/Brother/" "$srcdir/usr/share/brother"
		rm -rf "$srcdir/usr/local"
	        sed -i 's|/usr/local/Brother|/usr/share/brother|g' `grep -lr '/usr/local/Brother' ./`
        fi
# setup cups-directories
	install -dm755 "$srcdir/usr/share/cups/model"
	install -dm755 "$srcdir/usr/lib/cups/filter"
# copy ppd and filter file to their destination dirs
        cd `find . -type d -name 'cupswrapper'`
        cp *lpdwrapper* "$srcdir/usr/lib/cups/filter/"
        cp *.ppd "$srcdir/usr/share/cups/model/"
# set the basedir to an absolute path in the perl-lpdwrapper-script
# the relative path,generated on the basis of the caller, does not work in this case
        cd "$srcdir"
# get absolute printer path
        _baseDir="\"/$(find opt -maxdepth 3 -depth -print -quit -type d)\""
# replace the dynamic basedir var with the absolute path
        sed -i "s|\`readlink\ \$0\`|$_baseDir|" $srcdir/usr/lib/cups/filter/*lpdwrapper*
# /etc/printcap is managed by cups
        rm "$(find $srcdir -type f -name 'setupPrintcap*')"
}
package() {
    cp -R "$srcdir/usr" "$pkgdir"
    cp -R "$srcdir/opt" "$pkgdir"
    install -m 644 -D cupswrapper-license.txt $pkgdir/usr/share/licenses/${pkgname}/cupswrapper-licence.txt
    install -m 644 -D lpr-license.txt $pkgdir/usr/share/licenses/${pkgname}/lpr-licence.txt
}

