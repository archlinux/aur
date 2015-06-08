# Maintainer: blackleg <blackleg@openmailbox.org>
# Based in linuxtrack-svn
# Creator: Cristóvão Duarte Sousa <crisjss@gmail.com>

pkgname=linuxtrack
pkgver=0.99.12
pkgrel=2
pkgdesc="Software for head motion tracking on linux."
arch=('i686' 'x86_64')
url="http://code.google.com/p/linux-track/"
license=('MIT')
depends=('libusb' 'v4l-utils' 'zlib' 'mxml' 'qt4' 'qtwebkit'  'cwiid' ''opencv)
provides=("linuxtrack" "trackir-udev")

source=(http://linuxtrack.eu/repositories/universal/linuxtrack-${pkgver}.tar.bz2)

md5sums=('eec4eb4849d961edcaa9b12e74d108e1')

install=linuxtrack.install

if [ "$CARCH" = "i686" ]; then
    makedepends=("gcc-objc" "gdb" "xplane-sdk-devel" "bison")
elif [ "$CARCH" = "x86_64" ]; then
    makedepends=("gcc-objc-multilib" "gdb" "xplane-sdk-devel" "bison")
fi

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
  	#export CPPFLAGS=""
	#./configure CPP=/usr/bin/cpp --prefix=/usr
	./configure --prefix=/usr --with-out
	make
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
	
	#Uinput module
	mkdir -p $pkgdir/etc/modules-load.d
	echo uinput >> $pkgdir/etc/modules-load.d/uinput.conf
	#Track-Ir udev
	mkdir -p $pkgdir/usr/lib/udev/rules.d
	cd "$pkgdir/usr/share/linuxtrack"
	install -D -m644  99-TIR.rules $pkgdir/usr/lib/udev/rules.d/99-TIR.rules
	#Uinput udev
	cd "$srcdir/${pkgname}-${pkgver}/src"
	install -D -m644 99-Mickey.rules $pkgdir/usr/lib/udev/rules.d/99-Mickey.rules

	
}
