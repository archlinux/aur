# Maintainer: Sterophonick
pkgname=gba-auto-batteryless-patcher
_pkgname='gba-auto-batteryless-patcher'
pkgver=0.4.1
pkgrel=2
pkgdesc='Tool for Linux that patches GBA games for saving without an EEPROM for bootleg carts'
url='https://github.com/metroid-maniac/gba-auto-batteryless-patcher'
arch=(x86_64 i686 aarch64)
makedepends=(base-devel)
source=( git+https://github.com/metroid-maniac/gba-auto-batteryless-patcher.git
         git+https://github.com/metroid-maniac/gba-flash-patcher.git )
md5sums=('SKIP' 'SKIP')
license=('None')

prepare() {
  if [ ! -d "/opt/devkitpro/devkitARM/" ]; then
    echo "devkitARM not installed! gba-auto-batteryless-patcher requires devkitARM to be installed on your system!"
    echo 'https://devkitpro.org/wiki/Getting_Started'
    exit 1
  fi
}

package() {
  mkdir -p $pkgdir/usr/bin
  cd gba-auto-batteryless-patcher

  /opt/devkitpro/devkitARM/bin/arm-none-eabi-gcc -mcpu=arm7tdmi -nostartfiles -nodefaultlibs -mthumb -fPIE -Os -fno-toplevel-reorder payload.c -T payload.ld -o payload.elf
  /opt/devkitpro/devkitARM/bin/arm-none-eabi-objcopy -O binary payload.elf payload.bin
  xxd -i payload.bin > payload_bin.c
  gcc -g patcher.c payload_bin.c

  mv ./a.out $pkgdir/usr/bin/gba_auto_batteryless

  cd ../gba-flash-patcher

  /opt/devkitpro/devkitARM/bin/arm-none-eabi-gcc -mcpu=arm7tdmi -nostartfiles -nodefaultlibs -mthumb -fPIE -Os -fno-toplevel-reorder payload.c -T payload.ld -o payload.elf
  /opt/devkitpro/devkitARM/bin/arm-none-eabi-objcopy -O binary payload.elf payload.bin
  xxd -i payload.bin > payload_bin.c
  gcc -g patcher.c payload_bin.c

  mv ./a.out $pkgdir/usr/bin/gba_flash
}
