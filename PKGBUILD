# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Dominik Heidler <dheidler@gmail.com>

# it looks like the release model has gotten better
# keeping it more modular for now though

pkgname=bladerf-git
_libver=git
_CLIver=1.5.1
_FPGAver=0.10.2
_firmver=2.3.2
pkgver=2018.12.rc2.r36.g896d2431
pkgver() {
  cd "bladeRF"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc="Driver, userspace, fpga & firmware for the bladeRF SDR."
url="https://github.com/Nuand/bladeRF"
# https://github.com/Nuand/bladeRF/tags
arch=('x86_64')
license=('GPL2')
depends=('libusb')
makedepends=('cmake' 'help2man' 'doxygen')
#replaces=('bladerf')
conflicts=('bladerf')
provides=('bladerf')
backup=("etc/bladerf.cfg")

source=(
    "bladeRF::git+https://github.com/Nuand/bladeRF.git"
    "https://www.nuand.com/fpga/v$_FPGAver/hostedxA4.rbf"
    "https://nuand.com/fpga/v$_FPGAver/hostedx40.rbf"
    "https://nuand.com/fpga/v$_FPGAver/hostedx115.rbf"
    "https://www.nuand.com/fx3/bladeRF_fw_v$_firmver.img")

md5sums=('SKIP'
         'b3f8b37fccee3eacb85aeb4f9fe89b2b'
         '4aabf1617901423569f425db93598884'
         '33641f8a126bef1c0b7e6ba8bedda93f'
         'c823ea5aa2c25c26bbaf4ab395ac559d')

# bladeRF-cli is bundled with libbladeRF
# bladeRF-cli can use libtecla (aur)?

prepare() {
  cd "$srcdir/bladeRF"
  git submodule update --init --recursive
  
  # FS#47168
  #sed -i 's|MODE.*$|TAG+="uaccess"|' host/misc/udev/*.in

  # todo, report warning
  #sed -i '94i add_definitions(-Wno-error=format-truncation)' host/CMakeLists.txt

  # FS#55326
  #sed -i '44s/^else/#&/' host/misc/udev/CMakeLists.txt
}

build() {
  cd "$srcdir/bladeRF"
  mkdir -p build
  cd build
  CFLAGS+=" -Wno-error=stringop-truncation" cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DINSTALL_UDEV_RULES=ON \
    -DBLADERF_GROUP=wheel \
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
  cd "$srcdir"
  install -Dm644 "bladeRF_fw_v$_firmver.img" "$pkgdir/usr/share/bladerf/firmware/bladeRF_fw_v$_firmver.img"
  install -Dm644 hostedx40.rbf "$pkgdir/usr/share/bladerf/fpga/hostedx40.rbf"
  install -Dm644 hostedx115.rbf "$pkgdir/usr/share/bladerf/fpga/hostedx115.rbf"
  install -Dm644 hostedxA4.rbf "$pkgdir/usr/share/bladerf/fpga/hostedxA4.rbf"
  # FS#54105
  cd "$pkgdir/etc/udev/rules.d/"
  mv 88-nuand-bladerf1.rules 70-nuand-bladerf1.rules
  mv 88-nuand-bladerf2.rules 70-nuand-bladerf2.rules
  mv 88-nuand-bootloader.rules 70-nuand-bootloader.rules
}
