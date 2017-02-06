# Maintainer: Peter Ivanov <ivanovp@gmail.com>

pkgname=msp-flasher
pkgver=1.03.11.00
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
_installer=MSPFlasher-1_03_11_00-linux-installer.zip
_installer_run=MSPFlasher-1.3.11-linux-installer.run
source=("http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSP430Flasher/1_03_11_00/exports/$_installer" "${pkgname}.sh")
sha1sums=('60eaf7987e982ec50058bdd79dd3cf0a94990dad'
          '8b01a45ab7ac219ff00824e53c324126b3c39763')
_install_dir=/opt/ti/$pkgname

build() {
  chmod +x $_installer_run
}

package() {
  msg "Running TI's installer..."
  ${srcdir}/$_installer_run --mode unattended --prefix $pkgdir$_install_dir
  msg "Correcting directory permissions..."
  find $pkgdir$_install_dir -type d -print0|xargs -0 chmod 755
  mkdir -p $pkgdir/usr/lib
  ln -s $pkgdir$_install_dir/libmsp430.so $pkgdir/usr/lib

  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/etc/profile.d/${pkgname}.sh"
}

# vim:set sts=2 ts=2 sw=2 et:
