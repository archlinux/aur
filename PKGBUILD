# Maintainer: Thomas Baag <t.baag@keh-berlin.de>

pkgname=hauppauge-usb-git
pkgver=16.9.26
pkgrel=1
pkgdesc="A wrapper around the Hauppauge HDPVR2/Colossus2 Linux driver"
arch=('x86_64')
makedepends=('boost' 'git' 'xxd')
depends=('boost-libs')
source=(
 'https://s3.amazonaws.com/hauppauge/linux/hauppauge_hdpvr2_157321_patched_2016-09-26.tar.gz'
 'git+https://github.com/jpoet/HauppaugeUSB.git'
)
md5sums=(
 '2e071cc1f471e2ca29fa63cc4e0c7245'
 'SKIP'
)

prepare() {
 cd "$srcdir/HauppaugeUSB"
 ln -s ../hauppauge_hdpvr2_157321_patched_2016-09-26 Hauppauge
 cd Hauppauge
 # Patch the Hauppauge source to get it working
 for patchfilename in \
  01-NewLine.patch \
  02-string.patch \
  03-EnableRegisteredParameters.patch \
  04-SplitLoggingLevels.patch \
  05-FirmwareLocation.patch \
  06-AVOutputCallback.patch \
  07-ThreadName.patch
 do
  patch -p1 < "$srcdir/HauppaugeUSB/Patches/$patchfilename"
 done
 # Rename Common/Rx/ADV7842/Wrapper.c to Wrapper.cpp so it can include c++ headers
 mv Common/Rx/ADV7842/Wrapper.c Common/Rx/ADV7842/Wrapper.cpp
}

build() {
 cd "$srcdir/HauppaugeUSB"
 make
}

package() {
 cd "$srcdir/HauppaugeUSB"
 install -D --target-directory "$pkgdir/opt/Hauppauge/bin" hauppauge2
 install -D --target-directory "$pkgdir/opt/Hauppauge/firmware" Hauppauge/Common/EncoderDev/HAPIHost/bin/llama_usb_vx_host_slave_t22_24.bin
 install -D --target-directory "$pkgdir/opt/Hauppauge/firmware" Hauppauge/Common/EncoderDev/HAPIHost/bin/mips_vx_host_slave.bin
 mkdir -p "$pkgdir/etc/udev/rules.d"
 echo 'SUBSYSTEMS=="usb",ATTRS{idVendor}=="2040",ATTR{idProduct}=="e585",MODE="0660",GROUP="video",SYMLINK+="colossus2-1",TAG+="systemd",RUN="/bin/sh -c '\''echo -1 > /sys$devpath/power/autosuspend'\''"' > "$pkgdir/etc/udev/rules.d/99-Hauppauge.rules"

}

