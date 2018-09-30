# Maintainer: FFY00 <filipe.lains@gmail.com>

pkgname=limesuite-git
pkgver=18.06.0.r45.02cabfd
pkgrel=1
pkgdesc='Driver and GUI for LMS7002M-based SDR platforms (LimeSDR, Novena RF7, etc.)'
arch=('x86_64')
url='https://github.com/myriadrf/LimeSuite'
license=('Apache')
depends=('sqlite3' 'wxgtk2' 'freeglut' 'libusb>=1.0' 'soapysdr' 'wget' 'gnuplot' 'glew' 'fltk')
makedepends=('git' 'cmake' 'doxygen' 'octave')
optdepends=('octave: Octave plugin')
provides=('limesuite' 'soapylms7')
conflicts=('limesuite' 'soapylms7')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd LimeSuite

  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g;s/\.rc./rc/g'
}

prepare() {
  cd LimeSuite

  # Change mode to 666 and ommit plugdev group
  sed -i 's|MODE="660", GROUP="plugdev"|MODE="666"|g' udev-rules/64-limesuite.rules

#  # Octave plugin
#  sed -i 's|/usr/local|/usr|g' octave/Makefile # Fix install directory
#  cp src/lime/* octave/ # Fix headers
}

build() {
  mkdir -p LimeSuite/build
  cd LimeSuite/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_UTILITIES=True \
    -DENABLE_LIME_UTIL=True \
    -DENABLE_DESKTOP=True \
    -DENABLE_SOAPY_LMS7=True \
    -DENABLE_EVB7COM=True \
    -DENABLE_PCIE_XILLYBUS=True \
    -DENABLE_REMOTE=True \
    -DENABLE_QUICKTEST=True \
    -DENABLE_MCU_TESTBENCH=True \
    -DENABLE_FTDI=True \
    -DENABLE_FX3=True \
    -DENABLE_STREAM_UNITE=True \
    -DENABLE_EXAMPLES=True \
    -DENABLE_HEADERS=True \
    -DENABLE_GUI=True \
    -DENABLE_API_DOXYGEN=True \
    -DLIME_SUITE_EXTVER=$pkgver

#    -DENABLE_TESTS=True \
#    -DENABLE_NOVENARF7=True \

  make

#  # Octave plugin
#  cd ../octave
#
#  make
}

#check() {
#  # Octave plugin
#  cd LimeSuite/octave
#
#  make test
#}

package() {
  cd LimeSuite/build

  make DESTDIR="$pkgdir" install

  # Install udev rules, changing mode to 666 and ommitting plugdev group
  install -Dm 644 ../udev-rules/64-limesuite.rules "$pkgdir"/etc/udev/rules.d/64-limesuite.rules

  # Install icons and .desktop file
  install -Dm 644 ../Desktop/lime-suite-128.png "$pkgdir"/usr/share/pixmaps/lime-suite.png
  install -Dm 755 ../Desktop/lime-suite.desktop "$pkgdir"/usr/share/applications/lime-suite.desktop

  # Install documentation
  install -dm 755 "$pkgdir"/usr/share/doc/$pkgname
  cp -r --no-preserve=ownership ../docs/LMS_API_Documentation/* "$pkgdir"/usr/share/doc/$pkgname
}

