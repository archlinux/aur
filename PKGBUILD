# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=hfpforlinux-svn
pkgver=88  
pkgrel=8
pkgdesc="HFP for Linux is a Bluetooth Hands-Free Profile server"
url="http://nohands.sourceforge.net/"
arch=('i686' 'x86_64')
license=("GPL2")
depends=('bluez-libs')
optdepends=('libtool' 'libsalsa' 'audiofile' 'dbus' 'qt3')
makedepends=('svn' 'speex')
source=('hfpforlinux::svn+https://nohands.svn.sourceforge.net/svnroot/nohands/trunk')
md5sums=('SKIP')

pkgver() {
  cd "$SRCDEST/hfpforlinux"
  svnversion | tr -d [A-z]
}

build () {
	cd $srcdir/hfpforlinux
	./autogen.sh
	./configure
	sed -i '/^CXXFLAGS/s/$/ -fpermissive/' libhfp/Makefile
	sed -i 's/-laudiofile   -lspeexdsp/-laudiofile   -lspeexdsp -lpthread/' test/Makefile
	sed -i 's/-laudiofile   -lspeexdsp/-laudiofile   -lspeexdsp -lpthread/' include/Makefile
	sed -i 's/-laudiofile   -lspeexdsp/-laudiofile   -lspeexdsp -lpthread/' qt/Makefile
	sed -i 's/-laudiofile   -lspeexdsp/-laudiofile   -lspeexdsp -lpthread/' hfpd/Makefile
	sed -i 's/-Wshadow -fno-exceptions/-Wshadow -fno-exceptions -fpermissive/' hfpd/Makefile
	sed -i 's/CXXFLAGS = -march=x86-64/CXXFLAGS = -fstrict-aliasing -fpermissive -march=x86-64/' qt/Makefile
	sed -i '810s/RegisterDirect/this->RegisterDirect/' include/libhfp/events.h
	sed -i '859s/Invoke/BaseT::Invoke/' include/libhfp/events.h
        sed -i 's/^LDFLAGS =/LDFLAGS = -lpthread/' hfpd/Makefile
	sed -i 's/^libhfp_LIBS =/libhfp_LIBS = -lpthread/' test/Makefile
	sed -i '1s/python/python2/' data/hfconsole.in
	make
}
package() {
	cd $srcdir/hfpforlinux
	make DESTDIR="$pkgdir" install
}
