# Maintainer: Peter Ivanov <ivanovp@gmail.com>
# Contributor: Dominik Heidler <dheidler@gmail.com>

pkgname=gqrx-portaudio-git
pkgver=v2.14.4.r4.g07722f2
pkgrel=1
pkgdesc="SDR receiver for Funcube Dongle, RTL-SDR, USRP and OsmoSDR devices."
arch=('i686' 'x86_64')
url="http://gqrx.dk/"
license=('GPL')
depends=('qt5-base' 'qt5-svg' 'boost-libs' 'fftw' 'libusb' 'gsl' 'portaudio' 'libuhd' 'gnuradio' 'gnuradio-osmosdr')
optdepends=('gr-osmosdr-git: support of OsmoSDR devices')
makedepends=('make' 'patch' 'boost' 'git' 'cmake')
conflicts=('gqrx')
#_gitroot=https://github.com/phirsch/gqrx
#_gitroot=https://github.com/mathisschmieder/gqrx
_gitroot=git://github.com/csete/gqrx.git
_gitname=gqrx
source=("21-fcd.rules" "gqrx.png" "gqrx.desktop" "$_gitname::$_gitroot")
md5sums=('2be3bf7cba02e90cbbb9d5f6cfdaf68b'
         'f7032a8883c89bd80e0d0fd36f861c59'
         '810f89195231c18f32af92522aade721'
         'SKIP')
sha256sums=('490fdc3e16c8d6ae38894896f622531e2bf617963165ce2430a3c132d91ba5e5'
            'abb0c2598830c9fe728d8cd0d2f187d10331f7cb607520ff3664afd67a3a279d'
            'c67ff791ff9e1380e207ea9af32a0273f738a6b19d3b11251a94b931d6c00434'
            'SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir"
	cd "$_gitname"
	cmake -DLINUX_AUDIO_BACKEND:STRING=Portaudio .
	make
}

package() {
	install -m755 -d $pkgdir/etc/udev/rules.d
	install -m755 -d $pkgdir/usr/{bin,share/applications,share/pixmaps}

	cd $srcdir
	
	install -D -m644 21-fcd.rules $pkgdir/etc/udev/rules.d
	install -D -m644 gqrx.desktop $pkgdir/usr/share/applications
	install -D -m644 gqrx.png $pkgdir/usr/share/pixmaps

	cd "$_gitname"/src

	install -D -m755 gqrx $pkgdir/usr/bin
}

# Install order: rtl-sdr-git, libuhd, gnuradio-git, gr-osmosdr-git, gqrx-git
