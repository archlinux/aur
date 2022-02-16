# Based in linuxtrack-svn
# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Cristóvão Duarte Sousa <crisjss@gmail.com>

pkgname=linuxtrack
pkgver=0.99.19
pkgrel=3
pkgdesc="Software for head motion tracking on linux."
arch=('i686' 'x86_64')
url="https://github.com/uglyDwarf/linuxtrack"
license=('MIT')
depends=('libusb' 'v4l-utils' 'zlib' 'mxml' 'qt4' 'qtwebkit'  'cwiid' 'opencv')
provides=("linuxtrack" "trackir-udev")

source=(https://github.com/uglyDwarf/linuxtrack/archive/${pkgver}.tar.gz)
sha256sums=('4d768d63225f9801abcb36d06b5e6d444dd7189cb01b17bc95cd81b5b4a5f73a')

install=linuxtrack.install

if [ "$CARCH" = "i686" ]; then
    makedepends=("gcc-objc" "gdb" "xplane-sdk-devel" "bison")
elif [ "$CARCH" = "x86_64" ]; then
    makedepends=("gcc-objc-multilib" "gdb" "xplane-sdk-devel" "bison")
fi

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  sed -i 's/opencv >= 2\.0/opencv4/g' configure
  sed -i 's/opencv2\/core\/core\.hpp/opencv2\/core\/core_c\.h/g' src/facetrack.cpp
  sed -i 's/#include <opencv2/#include <opencv4\/opencv2/g' src/facetrack.cpp
  ./configure --prefix=/usr --with-out
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install

  # Uinput module
  mkdir -p $pkgdir/etc/modules-load.d
  echo uinput >> $pkgdir/etc/modules-load.d/uinput.conf
  # Track-Ir udev
  mkdir -p $pkgdir/usr/lib/udev/rules.d
  cd "$pkgdir/usr/share/linuxtrack"
  install -D -m644  99-TIR.rules $pkgdir/usr/lib/udev/rules.d/99-TIR.rules
  # Uinput udev
  cd "$srcdir/${pkgname}-${pkgver}/src"
  install -D -m644 99-Mickey.rules $pkgdir/usr/lib/udev/rules.d/99-Mickey.rules

  # Flightgear
  cd "$srcdir/linuxtrack-${pkgver}/doc/fgfs"
  mkdir -p "$pkgdir/usr/share/flightgear/data"
  cp -r {Input,Nasal,Protocol} "$pkgdir/usr/share/flightgear/data/"
}
