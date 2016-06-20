# Maintainer: Benedikt Braunger <dev0+aur@domainmess.org>
pkgname="brother-mfc-260c"
pkgver="1.0.1"
pkgrel="1"
pkgdesc="Brother MFC-260C CUPS driver"
url="http://www.brother.com"
license=('GPL')
#install="brother-mfc240c.install"
arch=('i686' 'x86_64')
depends_x86_64=('lib32-glibc') 
sha256sums=('87ffb791ce57bd1d82a6cd6829af151a764ebff658f1ad37184929aae912ee1e'
            'ab5c5457316e02f3eb12741144a9c5cf416b02f0c0d5c796ea43905114a35172'
            '73a2ad91c59275267598755d5b44a72668cefd77a91315aa3f051fc7af4c7d95')

source=(
	"LICENSE"
	"http://download.brother.com/welcome/dlf006075/mfc260clpr-1.0.1-1.i386.rpm"
	"http://download.brother.com/welcome/dlf006077/mfc260ccupswrapper-1.0.1-1.i386.rpm"
)

prepare() {
	# replace '/usr' by '$srcdir/usr' while running this strange scripts
	sed -i "s:/usr:$srcdir/usr:g" $(grep -rl "usr" .)

	# preparing directories
	mkdir -p "$srcdir/usr/share/cups/model/"
	mkdir -p "$srcdir/usr/lib/cups/filter/"
}

build () {
	# running the script which generates our ppd and filter
	"$srcdir/usr/local/Brother/Printer/mfc260c/cupswrapper/cupswrappermfc260c"
	# revert paths to original 
	sed -i "s:$srcdir/usr:/usr:g" $(grep -rl "$srcdir/usr" $srcdir)
	# adjust to archlinux
	sed -i "s:/usr/local/Brother:/usr/share/brother:g" $(grep -rl "usr/local/Brother" $srcdir)
}

package() {
	# preparing directories
	mkdir -p $pkgdir/usr/share/
	# coping files
	cp -r "$srcdir/usr/local/Brother/" "$pkgdir/usr/share/brother"
	cp -r "$srcdir/usr/bin" "$pkgdir/usr/bin"

	install -m 644 -D "$srcdir/usr/share/cups/model/brmfc260c.ppd" "$pkgdir/usr/share/cups/model/brmfc260c.ppd"
	install -m 755 -D "$srcdir/usr/lib/cups/filter/brlpdwrappermfc260c" "$pkgdir/usr/lib/cups/filter/brlpdwrappermfc260c"
	install -D -m644 $startdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}

