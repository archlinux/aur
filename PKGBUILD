# Maintainer:  Malstrond <malstrond@gmail.com>
# Contributor: Jose Riha <jose1711 gmail com>
# Contributor: Bazon <bazonbloch@arcor.de> 
# Contributor: Christian Bühler <christian@cbuehler.de>
# Contributor: Zsolt Udvari <udvzsolt@gmail.com>

pkgname=activdriver
pkgver=5.18.12
pkgrel=1
pkgdesc="Drivers for Promethean hardware"
arch=('x86_64')
url="https://support.prometheanworld.com/product/activdriver"
license=('unknown')
makedepends=('linux-headers>=5.0.1.arch1-1')
optdepends=('activinspire: Prometheans presentation software'
            'activtools: Tools for Promethean hardware, e.g. calibration or systray monitor')
install=$pkgname.install
source_x86_64=("http://activsoftware.co.uk/linux/repos/driver/ubuntu/pool/oss/a/$pkgname/${pkgname}_$pkgver-0~Ubuntu~1804_amd64.deb"
               "activdriver.install")
md5sums_x86_64=('d09c1be7e554f6682b1ad574ceb81ae8'
                '8a8a6ddd6741a80a5839593ed385cd9a')
                
prepare() {
  # Extract the source
  bsdtar -xf data.tar.xz
 
  # Patch the makefile of activlc so it doesn't try to get its includes from an absoulte path outside the build chroot
  sed -i "s%KERN_INC = /usr/src/promethean%KERN_INC = ..%" usr/src/promethean/activlc/Makefile
  
  # Patch promethean.sh to not use absolute paths to /usr/local, which isn't used in Arch
  sed -i s%/usr/local/bin/%%g usr/bin/promethean.sh
  
  # Patch usbpromethean.c to be compatible with this kernel change: https://lkml.org/lkml/2019/1/4/418
  # If are building on kernel versions <=4.19, remove these 2 lines
  sed -i  s%VERIFY_WRITE,%%g usr/src/promethean/kernel/usbpromethean.c
  sed -i  s%VERIFY_READ,%%g usr/src/promethean/kernel/usbpromethean.c
  
   # Remove files relating to HAL, which was deprecated by Arch almost a decade ago
  rm -r usr/share/hal
  
  # The driver includes two duplicate X configuration files and this path isn't used in Arch
  rm -r usr/lib/X11/xorg.conf.d
}


build() {
  echo " "
  echo "Attention!"
  echo "This build will fail if run in a directory with space(s) in its path due to an error in the upstream makefile."
  echo " "
  make -C /lib/modules/$(uname -r)/build SUBDIRS="$srcdir"/usr/src/promethean/kernel modules
  BUILD=release make -C usr/src/promethean/activlc
}

package() {
  mkdir -p "$pkgdir"/usr 
  cp -r etc lib "$pkgdir"
  cp -r usr/bin usr/lib usr/share "$pkgdir"/usr
  install -D usr/src/promethean/activlc/release/activlc "$pkgdir"/usr/bin/activlc
  
  # Set the module directory and install module
  _moddir="/usr/lib/modules/$(</usr/src/linux/version)/extramodules/kernel/drivers/input/tablet"
  install -m644 -D usr/src/promethean/kernel/promethean.ko "$pkgdir${_moddir}"/promethean.ko
  find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;

  # Use /usr/lib instead of /lib to match Arch packaging standards
  mv "${pkgdir}"/lib/* "${pkgdir}"/usr/lib/ 
  rmdir "${pkgdir}"/lib

  # Load module on boot. 
  # If you don't want this, delete the following 2 lines.
  mkdir -p "$pkgdir"/etc/modules-load.d
  echo "promethean" > "$pkgdir"/etc/modules-load.d/promethean.conf
}
