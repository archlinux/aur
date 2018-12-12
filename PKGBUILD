# Maintainer: Stefan Biereigel <stefan@biereigel.de>

pkgname=libbladerf-git
pkgver=2018.10.rc1.r102.gb2f30720
pkgrel=1
pkgdesc="Driver and userspace for the bladeRF SDR."
url="https://github.com/Nuand/bladeRF"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('libusb')
provides=('bladerf')
conflicts=('bladerf')
makedepends=('cmake' 'help2man' 'doxygen')

source=(git+https://github.com/Nuand/bladeRF)
md5sums=('SKIP')

prepare() {
  cd "$srcdir/bladeRF"
  sed -i 's|MODE.*$|TAG+="uaccess"|' host/misc/udev/88-nuand-bladerf1.rules.in
  sed -i 's|MODE.*$|TAG+="uaccess"|' host/misc/udev/88-nuand-bladerf2.rules.in
  sed -i 's|MODE.*$|TAG+="uaccess"|' host/misc/udev/88-nuand-bootloader.rules.in
}

pkgver() {
  cd "$srcdir/bladeRF"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/bladeRF"
  mkdir -p build
  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DINSTALL_UDEV_RULES=ON \
    -DBUILD_DOCUMENTATION=ON \
    -DCMAKE_INSTALL_LIBDIR:PATH=lib \
    -Dusb_LIBRARY:FILEPATH=/usr/lib/libusb-1.0.so \
    -DCMAKE_INSTALL_PREFIX=/usr ../
  make
  # ENABLE_FX3_BUILD needs cypress toolchain
  # really really wants to put files in /usr/lib64
}

package() {
  cd "$srcdir/bladeRF/build"
  make DESTDIR="${pkgdir}" install
}
