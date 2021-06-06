# Maintainer: Corey Mwamba <contact.me@coreymwamba.co.uk>
DLAGENTS=("https::/usr/bin/curl -k -o %o %u")
pkgname=qm-vamp-plugins
pkgver=1.8.0
pkgrel=1
pkgdesc="A set of Vamp audio analysis plugins developed at the Centre for Digital Music at Queen Mary, University of London"
arch=('i686' 'x86_64')
url="https://code.soundsoftware.ac.uk/projects/qm-vamp-plugins"
license=('GPL')
groups=(multimedia)
depends=('vamp-plugin-sdk')
source=("https://code.soundsoftware.ac.uk/attachments/download/2624/$pkgname-$pkgver.tar.gz")
md5sums=('0bcb502c5b0199cd6359df54ae7b61d4')

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
