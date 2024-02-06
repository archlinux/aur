# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=cwdaemon
_author=acerion
pkgver=0.12.0.r146.gac773e4
#.r146.gac773e4
#.r4.g44f36eb
pkgrel=1
pkgdesc="Ham Radio Morse Code transmitter - text input is sent via udp port 6789."
arch=('i686' 'x86_64')
url="http://cwdaemon.sourceforge.net"
license=('GPL')
#depends=('unixcw>=3.3.1' 'netcat')
depends=('unixcw' 'netcat')
source=("$pkgname::git+https://github.com/$_author/$pkgname#branch=master"
#http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz
	diff.Makefile.am
	diff.Makefile.am.example)

pkgver() {
	cd $srcdir/$pkgname

	git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
#	git describe --long | sed -r 's/-([0-9,a-g,A-G].*)//'
##	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

}

prepare () {
	cd $srcdir/$pkgname

	patch -p0 < ../diff.Makefile.am
	sed -i s:sbin:bin: src/Makefile.am
	patch -p0 < ../diff.Makefile.am.example
}

build() {
	cd $srcdir/$pkgname

	aclocal --force
	libtoolize --force
	autoheader -f
	automake -a -c -f 
	autoconf -f
			 
	./configure --prefix=/usr
	make
}

package() {
	cd $srcdir/$pkgname

	make prefix=$pkgdir/usr install

	cd $pkgdir/usr/bin
	mv example cwdaemon-example
}                                                  
md5sums=('SKIP'
         '9afaea52e53c3140388633ed608bf0ed'
         '263d67197bf711907f76ed079169b04c')
sha256sums=('SKIP'
            'af0343ee5691c256ccb206284d683f88b551132446cd9ecd1dc3cc87af72e833'
            '0b2257673431170c39b3b6ff45e7cd2ee3208e423233da15fb789d9adf70d944')
