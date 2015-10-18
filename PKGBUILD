# Maintainer: Peter Ivanov <ivanovp@gmail.com>

pkgname=msp-flasher
pkgver=1.03.07.00
pkgrel=1
pkgdesc="Flasher for TI MSP430 processor"
arch=('i686' 'x86_64')
url="http://www.ti.com/tool/msp430-flasher"
license=('GPL')
depends=('elfutils' 'libmpc' 'zlib')
[ $CARCH = x86_64 ] && depends+=('lib32-gcc-libs' 'lib32-glibc' 'lib32-libstdc++5' 'lib32-zlib')
options=(!strip !emptydirs !libtool staticlibs !upx)
PKGEXT=".pkg.tar"
install=msp-flasher.install
_installer=MSP430Flasher-1_03_07_00-linux-installer.run
#http://downloads.ti.com/downloads/msp430/msp430_public_sw/mcu/msp430/MSPGCC/latest/msp430-gcc-full-linux-installer-3.5.0.0.run?__gda__=1445541569_e2a9880f9e7e8d5ce333484d874e915e
#source=(" http://downloads.ti.com/downloads/msp430/msp430_public_sw/mcu/msp430/MSP430Flasher/latest/MSP430Flasher-1_03_07_00-linux-installer.run?__gda__=1445541273_f087c60a06efc87433dfea0ac54a50c4")
# http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSP430Flasher/latest/index_FDS.html
source=("http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSP430Flasher/1_03_07_00/exports/$_installer" "${pkgname}.sh")
#source=("https://www.ti.com/general/docs/licreg/anonymousproddownload.tsp?downloadPage=true&location=http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSP430Flasher/1_03_07_00/exports/$_installer" "${pkgname}.sh")
sha1sums=('3701260054be1208716f32f13bae94ef81424396'
          '8b01a45ab7ac219ff00824e53c324126b3c39763')
_install_dir=/opt/ti/$pkgname

build() {
  chmod +x $_installer
}

package() {
  msg "Running TI's installer..."
  ${srcdir}/$_installer --mode unattended --prefix $pkgdir$_install_dir
  msg "Correcting directory permissions..."
  find $pkgdir$_install_dir -type d -print0|xargs -0 chmod 755
  mkdir -p $pkgdir/usr/lib
  ln -s $pkgdir$_install_dir/libmsp430.so $pkgdir/usr/lib

  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/etc/profile.d/${pkgname}.sh"
}

# vim:set sts=2 ts=2 sw=2 et:
