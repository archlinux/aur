# Maintainer: Peter Ivanov <ivanovp@gmail.com>
# Contributor: Dominik Heidler <dheidler@gmail.com>

pkgname=gqrx-git
pkgver=20160423
pkgrel=1
pkgdesc="SDR receiver for Funcube Dongle, RTL-SDR, USRP and OsmoSDR devices."
arch=('i686' 'x86_64')
url="http://www.oz9aec.net/index.php/gnu-radio/gqrx-sdr"
license=('GPL')
depends=('qt5-base' 'boost-libs' 'fftw' 'libusb' 'gsl' 'alsa-lib' 'libpulse' 'libuhd' 'pulseaudio' 'gnuradio' 'python2-cheetah')
optdepends=('gr-osmosdr-git: support of OsmoSDR devices')
makedepends=('make' 'patch' 'boost' 'git')
conflicts=('gqrx')
#_gitroot=https://github.com/phirsch/gqrx
#_gitroot=https://github.com/mathisschmieder/gqrx
_gitroot=git://github.com/csete/gqrx.git
_gitname=gqrx
source=("fcd_in_gnuradio.patch" "21-fcd.rules" "gqrx.png" "gqrx.desktop" "$_gitname::$_gitroot")


pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --format="%cd" --date=short | tr -d '-'
}

build() {
	cd "$srcdir"
#	msg "Applying patch for new funcube lib location"
#	patch -p1 < ../fcd_in_gnuradio.patch
	cd "$_gitname"
	qmake-qt5
    make clean
	make
}

package() {
	install -m755 -d $pkgdir/etc/udev/rules.d
	install -m755 -d $pkgdir/usr/{bin,share/applications,share/pixmaps}

	cd $srcdir
	
	install -D -m644 21-fcd.rules $pkgdir/etc/udev/rules.d
	install -D -m644 gqrx.desktop $pkgdir/usr/share/applications
	install -D -m644 gqrx.png $pkgdir/usr/share/pixmaps

	cd "gqrx"

	install -D -m755 gqrx $pkgdir/usr/bin
}

md5sums=('95292c41a5d521c023a26d615a5e2478'
         '2be3bf7cba02e90cbbb9d5f6cfdaf68b'
         'f7032a8883c89bd80e0d0fd36f861c59'
         '810f89195231c18f32af92522aade721'
         'SKIP')

# Install order: rtl-sdr-git, libuhd, gnuradio-git, gr-osmosdr-git, gqrx-git
