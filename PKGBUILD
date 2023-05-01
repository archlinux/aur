# Maintainer: Stefan Biereigel <stefan@biereigel.de>

pkgname=libbladerf-git
pkgver=2023.02.r33.g2b90ed39
pkgrel=1
pkgdesc="Driver and userspace for the bladeRF SDR."
url="https://github.com/Nuand/bladeRF"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL2')
depends=('libusb')
provides=('bladerf')
conflicts=('bladerf')
makedepends=('cmake' 'help2man' 'doxygen')

source=("git+https://github.com/Nuand/bladeRF"
		"https://www.nuand.com/fpga/hostedxA4-latest.rbf"
		"https://www.nuand.com/fpga/hostedxA9-latest.rbf"
		"https://www.nuand.com/fpga/hostedx40-latest.rbf"
		"https://www.nuand.com/fpga/hostedx115-latest.rbf"
		"https://www.nuand.com/fx3/bladeRF_fw_latest.img")
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

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
    -DCMAKE_INSTALL_PREFIX=/usr ../ \
    -DUDEV_RULES_PATH=/usr/lib/udev/rules.d
  make
  # ENABLE_FX3_BUILD needs cypress toolchain
  # really really wants to put files in /usr/lib64
}

package() {
  cd "$srcdir/bladeRF/build"
  make DESTDIR="${pkgdir}" install

  cd "$srcdir"
  install -Dm644 bladeRF_fw_latest.img "$pkgdir/usr/share/Nuand/bladeRF/firmware/bladeRF_fw_latest.img"
  install -Dm644 hostedxA4-latest.rbf  "$pkgdir/usr/share/Nuand/bladeRF/hostedxA4.rbf"
  install -Dm644 hostedxA9-latest.rbf  "$pkgdir/usr/share/Nuand/bladeRF/hostedxA9.rbf"
  install -Dm644 hostedx40-latest.rbf  "$pkgdir/usr/share/Nuand/bladeRF/hostedx40.rbf"
  install -Dm644 hostedx115-latest.rbf "$pkgdir/usr/share/Nuand/bladeRF/hostedx115.rbf"

  # FS#54105
  cd "$pkgdir/usr/lib/udev/rules.d/"
  mv 88-nuand-bladerf1.rules   70-nuand-bladerf1.rules
  mv 88-nuand-bladerf2.rules   70-nuand-bladerf2.rules
  mv 88-nuand-bootloader.rules 70-nuand-bootloader.rules
}
