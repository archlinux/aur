# Maintainer: Ingo Sieverdingbeck <aur@sieverdingbeck.com>
pkgname="brother-dcp7065dn"
pkgver="3.1.0"
_pkgver="$pkgver-1"
pkgrel=3
pkgdesc="LPR and CUPS driver for the Brother DCP7065DN"
arch=('i686' 'x86_64')
url="https://support.brother.com/g/b/downloadlist.aspx?c=de&lang=de&prod=dcp7065dn_all&os=128&flang=English"
license=('custom:brother commercial license')

depends=('cups')
install="$pkgname.install"
source=(
	"https://download.brother.com/welcome/dlf101125/brgenml1cupswrapper-$_pkgver.i386.deb"
	"https://download.brother.com/welcome/dlf101123/brgenml1lpr-$_pkgver.i386.deb"
	'cupswrapper-license.txt'
	'lpr-license.txt'
)
md5sums=(
	'9d31b628b552959419f2f6c05e16b84a'
	'dea333f953fcce13c1239bf991524885'
	'97ad0cffd216059e9d1d3121899d8646'
	'5e87a3dc0f3e3438c088eda0f3565f0d'
)

sha256sums=(
	'd9e8a164b36bd1bc74cb7a90111ae1f0d2569a1d3a221db69b2064acb850a24d'
	'2e01bfadc82b0416f05c18ba1d3d23999672bb8db48832815a3afd2cb395bb7d'
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
        #link LPD wrapper to cups/filter
        ln -s /opt/brother/Printers/BrGenML1/cupswrapper/brother_lpdwrapper_BrGenML1 $srcdir/usr/lib/cups/filter
        #link PPD file to cups/model
        ln -s /opt/brother/Printers/BrGenML1/cupswrapper/brother-BrGenML1-cups-en.ppd $srcdir/usr/share/cups/model
}
package() {
	cp -R $srcdir/usr $pkgdir
	cp -R $srcdir/opt $pkgdir
	install -m 644 -D cupswrapper-license.txt $pkgdir/usr/share/licenses/${pkgname}/cupswrapper-licence.txt
	install -m 644 -D lpr-license.txt $pkgdir/usr/share/licenses/${pkgname}/lpr-licence.txt
}
