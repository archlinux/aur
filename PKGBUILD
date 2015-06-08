# Maintainer: André Silva <emulatorman@parabola.nu>
# Maintainer: Márcio Silva <coadde@parabola.nu>

pkgname=ath9k-htc-firmware
pkgver=1.4.0
pkgrel=1
pkgdesc='Free firmware files for the Qualcomm Atheros AR7010 and AR9271 USB 802.11n NICs'
arch=('any')
url=('http://wireless.kernel.org/en/users/Drivers/ath9k_htc')
license=('BSD3')
makedepends=('cmake' 'xtensa-unknown-elf-binutils' 'xtensa-unknown-elf-gcc')
source=("https://github.com/qca/open-ath9k-htc-firmware/archive/$pkgver.tar.gz"
        'LICENSE')
md5sums=('503f75163649a7e52a64737991a41ca2'
         '5163b2711bc481c77045850610b7dd31')

prepare() {

  cd $srcdir/open-ath9k-htc-firmware-$pkgver/target_firmware
  mkdir -p build/{k2,magpie}

  # fix gcc 4.8 aggressive loop optimizations "-faggressive-loop-optimizations"
  #sed -i '\|mPhyCtrlState.validPhyRateIndex| s|= 0|= 0|' wlan/ratectrl_11n_ln.c
}

build() {

  cd $srcdir/open-ath9k-htc-firmware-$pkgver

  export CTARGET="xtensa-unknown-elf"
  export CC="xtensa-unknown-elf"
  export CFLAGS="-mtext-section-literals -O2 -pipe --param=ssp-buffer-size=4 -fno-aggressive-loop-optimizations"
  export CXXFLAGS="${CFLAGS}"

  cat > target_firmware/build/toolchain.cmake <<EOF
INCLUDE(CMakeForceCompiler)

SET(CMAKE_SYSTEM_PROCESSOR xtensa)
SET(COMPILER_PREFIX "xtensa-unknown-elf")
SET(CMAKE_FIND_ROOT_PATH /usr/xtensa-unknown-elf)

CMAKE_FORCE_C_COMPILER(/usr/bin/xtensa-unknown-elf-gcc GNU)
EOF

  cd $srcdir/open-ath9k-htc-firmware-$pkgver/target_firmware/build/k2

  cmake -DCMAKE_TOOLCHAIN_FILE=$srcdir/open-ath9k-htc-firmware-$pkgver/target_firmware/build/toolchain.cmake "$@" -DTARGET_K2=ON ../..
  cd -

  cd $srcdir/open-ath9k-htc-firmware-$pkgver/target_firmware/build/magpie

  cmake -DCMAKE_TOOLCHAIN_FILE=$srcdir/open-ath9k-htc-firmware-$pkgver/target_firmware/build/toolchain.cmake "$@" -DTARGET_MAGPIE=ON ../..
  cd -

  cd $srcdir/open-ath9k-htc-firmware-$pkgver/target_firmware

  make -C build/k2
  make -C build/magpie

}

package() {

  # create firmware folder to put the free firmware files there
  install -d -m755 $pkgdir/usr/lib/firmware

  cd $srcdir/open-ath9k-htc-firmware-$pkgver/target_firmware

  # move firmware files to firmware folder
  cp build/{k2,magpie}/htc_*.fw $pkgdir/usr/lib/firmware

  # create license folder to put the license file there
  install -d -m755 $pkgdir/usr/share/licenses/$pkgname

  # put LICENSE to license folder
  install -m644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname
  
}
