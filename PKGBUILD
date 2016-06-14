# Maintainer: Peter Ivanov <ivanovp@gmail.com>

pkgname=mspgcc-ti
pkgver=4.00.01.00
pkgrel=2
pkgdesc="GNU toolchain (as, gcc, g++, ld, gdb) for the TI MSP430 processor"
arch=('i686' 'x86_64')
url="http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPGCC/latest/index_FDS.html"
license=('GPL')
depends_i686=('elfutils' 'libmpc' 'zlib')
depends_x86_64=('elfutils' 'libmpc' 'zlib' 'lib32-gcc-libs' 'lib32-glibc' 'lib32-libstdc++5' 'lib32-zlib' 'lib32-fakeroot')
options=(!strip !emptydirs !libtool staticlibs !upx)
PKGEXT=".pkg.tar"
install=mspgcc-ti.install
_installer=msp430-gcc-full-linux-installer-4.0.1.0.run
source=("http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPGCC/4_00_01_00/exports/$_installer" "${pkgname}.sh")
sha1sums=('04f8b95f3908978b9f048f7ef2d05d410ba59774'
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
