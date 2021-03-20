# Maintainer: Peter Ivanov <ivanovp@gmail.com>

pkgname=msp-flasher
pkgver=1.03.20.00
pkgrel=2
pkgdesc="Flasher for TI MSP430 processor"
arch=('i686' 'x86_64')
url="http://www.ti.com/tool/msp430-flasher"
license=('GPL')
depends=('elfutils' 'libmpc' 'zlib' 'gcc-libs' 'glibc')
options=(!strip !emptydirs !libtool staticlibs)
PKGEXT=".pkg.tar"
if [ $CARCH = i686 ]; then
    _installer_arch_infix=linux
elif [ $CARCH = x86_64 ]; then
    _installer_arch_infix=linux-x64
fi
_installer=MSPFlasher-1_03_20_00-$_installer_arch_infix-installer.zip
_installer_run=MSPFlasher-1.3.20-$_installer_arch_infix-installer.run
source_i686=("http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSP430Flasher/1_03_20_00/exports/$_installer")
source_x86_64=("http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSP430Flasher/1_03_20_00/exports/$_installer")
source=("61-msp430uif.rules")
_install_dir=/opt/ti/$pkgname

sha1sums=('c746439f29904c9bb47eecabd12b31abdfc8934d')
sha1sums_i686=('792f88f92bcf8386865367ea5c8f12d177eb3d28')
sha1sums_x86_64=('792f88f92bcf8386865367ea5c8f12d177eb3d28')

build() {
  chmod +x $_installer_run
}

package() {
  msg "Running TI's installer..."
  ${srcdir}/$_installer_run --mode unattended --prefix $pkgdir$_install_dir
  msg "Correcting directory permissions..."
  find $pkgdir$_install_dir -type d -print0|xargs -0 chmod 755

  mkdir -p $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/bin
  ln -s ../../opt/ti/msp-flasher/libmsp430.so $pkgdir/usr/lib/
  ln -s ../../opt/ti/msp-flasher/MSP430Flasher $pkgdir/usr/bin/

  mkdir -p $pkgdir/etc/udev/rules.d
  cp ${srcdir}/61-msp430uif.rules $pkgdir/etc/udev/rules.d/
}

# vim:set sts=2 ts=2 sw=2 et:
