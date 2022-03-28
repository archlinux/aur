# Maintainer: monkeynaleo <monkeynaleo@gmail.com>
pkgname="brother-mfc-l5900dw"
pkgver="3.5.1"
pkgrel=1
epoch=2
pkgdesc="LPR and CUPS driver for the Brother MFC-L5900DW"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/"
license=('custom:brother commercial license')
depends=('cups')
depends_x86_64=('lib32-glibc')
install="$pkgname.install"
source=(
	"http://download.brother.com/welcome/dlf102627/mfcl5900dwlpr-$pkgver-$pkgrel.i386.rpm"
	"http://download.brother.com/welcome/dlf102628/mfcl5900dwcupswrapper-$pkgver-$pkgrel.i386.rpm"
	'cupswrapper-license.txt'
	'lpr-license.txt'
)
md5sums=('c4417c15e50947000c776892c18f0f1c'
         'affa5932b0a60abb6b3db60e18f9b440'
         '97ad0cffd216059e9d1d3121899d8646'
         '5e87a3dc0f3e3438c088eda0f3565f0d')
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
        cp "$srcdir/usr/lib/cups/filter/lpdwrapper" "$srcdir/usr/lib/cups/filter/brother_lpdwrapper_MFCL5900DW"
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
  cd "$srcdir/opt"
}
package() {
    cp -R "$srcdir/usr" "$pkgdir"
    cp -R "$srcdir/opt" "$pkgdir"
    install -m 644 -D cupswrapper-license.txt $pkgdir/usr/share/licenses/${pkgname}/cupswrapper-licence.txt
    install -m 644 -D lpr-license.txt $pkgdir/usr/share/licenses/${pkgname}/lpr-licence.txt
}

