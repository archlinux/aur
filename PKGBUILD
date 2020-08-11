# Maintainer: Michael Riegert <michael at eowyn net>

pkgname=openfpgaloader-git
pkgver=0.1.r.12.gdcf4468
pkgrel=2
pkgdesc="Universal utility for programming FPGA"
arch=('i686' 'x86_64')
url="http://lightspark.sourceforge.net"
license=('AGPL3')
depends=('libftdi')
optdepends=('libudev.so: (e)udev support (used to open a device via /dev/[device node])')
makedepends=('git' 'cmake')
provides=('openfpgaloader')
conflicts=('openfpgaloader')
source=("$pkgname::git+https://github.com/trabucayre/openFPGALoader")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed -r 's/.//;s/([^-]*-g)/r.\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  mkdir -p build && cd build
  if pacman -Qi libudev.so;
  then
    cmake ../
  else
    echo 'Disabling udev support...'
    cmake ../ -DENABLE_UDEV=OFF
  fi
  cmake --build .
}

package() {
  cd "$pkgname"
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/openFPGALoader/
  cp build/openFPGALoader $pkgdir/usr/bin/openfpgaloader
  cp test_sfl.svf $pkgdir/usr/share/openFPGALoader/test_sfl.svf
  cp spiOverJtag/spiOverJtag_xc7a35.bit $pkgdir/usr/share/openFPGALoader/spiOverJtag_xc7a35.bit
  if pacman -Qi libudev.so;
  then
    install -Dm664 '99-openfpgaloader.rules' '${pkgdir}/usr/lib/udev/rules.d/99-openfpgaloader.rules'
  fi
}
