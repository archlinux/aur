# Maintainer: Corey Mwamba <contact.me@coreymwamba.co.uk>
pkgname=qm-vamp-plugins
pkgver=1.7.1
pkgrel=1
pkgdesc="A set of Vamp audio analysis plugins developed at the Centre for Digital Music at Queen Mary, University of London"
arch=('i686' 'x86_64')
url="https://code.soundsoftware.ac.uk/projects/qm-vamp-plugins"
license=('GPL')
groups=(multimedia)
depends=('vamp-plugin-sdk')
source=("https://code.soundsoftware.ac.uk/attachments/download/1604/$pkgname-$pkgver.tar.gz")
md5sums=('6274bc8bff6f2363404a9f945613bf51')

prepare() {
        cd "$srcdir/$pkgname-$pkgver"
        sed -e "s|CXXFLAGS += |CXXFLAGS += -I/usr/include/vamp-sdk |" -i build/linux/Makefile.linux{64,32}
	sed -e "s|-lvamp-sdk||" -i build/linux/Makefile.linux{64,32}
	sed -e "s|-lpthread|-lpthread -lvamp-sdk|" -i build/linux/Makefile.linux{64,32}
}
build() {
	cd "$srcdir/$pkgname-$pkgver"
	if test "$CARCH" == x86_64; then
		make -f build/linux/Makefile.linux64 
	else
		make -f build/linux/Makefile.linux32 
	fi
}


package() {
	mkdir -p $pkgdir/usr/lib/vamp
	cp $srcdir/$pkgname-$pkgver/qm-vamp-plugins.{so,cat,n3} $pkgdir/usr/lib/vamp		
}
