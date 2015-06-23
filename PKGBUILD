# Maintainer: Peter Ivanov <ivanovp@gmail.com>

pkgname=mspgcc-ti
pkgver=3.02.03.00
pkgrel=3
pkgdesc="GNU toolchain (as, gcc, g++, ld, gdb) for the TI MSP430 processor"
arch=('i686' 'x86_64')
url="http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPGCC/latest/index_FDS.html"
license=('GPL')
depends=('elfutils' 'libmpc' 'zlib')
[ $CARCH = x86_64 ] && depends+=('lib32-gcc-libs' 'lib32-glibc' 'lib32-libstdc++5' 'lib32-zlib')
options=(!strip !emptydirs !libtool staticlibs !upx)
PKGEXT=".pkg.tar"
install=mspgcc-ti.install
_installer=msp430-gcc-full-linux-installer-3.2.3.0.run
source=("http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPGCC/3_02_03_00/exports/$_installer" "${pkgname}.sh")
sha1sums=('9dc0915a2c866871080c2e5134b2e5ab40f152ce'
    'a4a81f1b041bf39c3f9c75d94c22d149d1ceee9e')
_install_dir=/opt/ti/mspgcc

build() {
  chmod +x $_installer
}

package() {
  msg "Running TI's installer..."
  ${srcdir}/$_installer --mode unattended --prefix $pkgdir$_install_dir
  mkdir -p $pkgdir$_install_dir/msp430-elf/lib
  msg "Moving linker scripts to their place..."
  mv $pkgdir$_install_dir/include/*.ld $pkgdir$_install_dir/msp430-elf/lib
  mkdir -p $pkgdir$_install_dir/msp430-elf/include
  msg "Moving header files to their place..."
  mv $pkgdir$_install_dir/include/*.h $pkgdir$_install_dir/msp430-elf/include

  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/etc/profile.d/${pkgname}.sh"
}

# vim:set sts=2 ts=2 sw=2 et:
