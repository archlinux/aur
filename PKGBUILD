# Maintainer: nomisge <nomisge@live.com>
pkgname=brother-dcp110c
pkgver=1.0.2
pkgrelbr=1
pkgrel=2
pkgdesc="LPR and CUPS driver for the Brother DCP110C"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/"
license=('custom:brother commercial license')
depends=('cups')
makedepends=('tcsh')
install=$pkgname.install
source=(
	"http://www.brother.com/pub/bsc/linux/dlf/DCP110Clpr-$pkgver-$pkgrelbr.i386.rpm"
	"http://www.brother.com/pub/bsc/linux/dlf/cupswrapperDCP110C-1.0.0-$pkgrelbr.i386.rpm"
	'cupswrapper-license.txt'
	'lpr-license.txt'
        'A4PaperSize.patch'
)
md5sums=('5b51032a121f9c2e8cd2271c517e5eb7'
         'f3b7e05232838ac2eaa008f0a6d74c4f'
         '809c64563dbd89f89ca68f9218c59cf5'
         'bf894a1a51baf6055a6c58ecf43c9782'
         'abaceb022d48e2a86f80b6eeb84cf109'
)
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
    ls -la
    if [ -f cupswrapper* ]; then
	_wrapper_source=`ls cupswrapper*`
    fi
    if [ ! -z $_wrapper_source ]; then
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
# change paper size to A4
    echo "PATCH"
    cd "${srcdir}/usr"
    patch --forward --strip=1 --input="${srcdir}/A4PaperSize.patch"
    sed -i 's|Letter|A4|' "${srcdir}/usr/share/brother/inf/brDCP110Crc"
}
package() {
	cp -R "${srcdir}/usr" "$pkgdir"
	if [ -d "${srcdir}/opt" ]; then cp -R "${srcdir}/opt" "$pkgdir"; fi
	install -m 644 -D cupswrapper-license.txt "$pkgdir/usr/share/licenses/${pkgname}/cupswrapper-licence.txt"
	install -m 644 -D lpr-license.txt "$pkgdir/usr/share/licenses/${pkgname}/lpr-licence.txt"
}

