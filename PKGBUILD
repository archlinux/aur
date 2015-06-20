# Maintainer: Peter Ivanov <ivanovp@gmail.com>
# Contributor: joat
# Submitter: BxS <bxsbxs at gmail dot com>

pkgname=microchip-mplabxc16-bin
pkgver=1.24
pkgrel=3
pkgdesc="C compiler for PIC24 MCUs and dsPIC DSCs"
arch=(i686 x86_64)
url=http://www.microchip.com/xc16
license=(custom)
makedepends=(xclm-dirs)
[ $CARCH = x86_64 ] && depends=(lib32-gcc-libs)
provides=(mplabxc16)
conflicts=(mplabxc16)
options=(!strip docs libtool emptydirs !zipman staticlibs !upx)
PKGEXT='.pkg.tar'
install=$pkgname.install
instdir=/opt/microchip/xc16/v$pkgver
installer=xc16-v$pkgver-full-install-linux-installer.run
source=(http://ww1.microchip.com/downloads/en/DeviceDoc/$installer)
[ $CARCH = x86_64 ] && source+=(fakeroot-i686.pkg.tar.xz::http://www.archlinux.org/packages/core/i686/fakeroot/download/)
md5sums=('6c9c843c8233a450535bdb66f13644fe')
[ $CARCH = x86_64 ] && md5sums+=('32eac8a541e28049f0306cf7f4ec7044')

package() {
  echo -e "Creating the Package\n  Please wait..."

  mkdir -p $pkgdir$instdir
  chmod 0755 $srcdir/$installer
  echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\ny\n\n\n$pkgdir$instdir\n\n\ni\ni\nn\nn\nn\n\n" >inst_input

  ORIGINAL_LD=$LD_LIBRARY_PATH
  [ $CARCH = x86_64 ] && LD_LIBRARY_PATH=$srcdir/usr/lib/libfakeroot:\$LD_LIBRARY_PATH
  $srcdir/$installer --mode text <inst_input &>/dev/null || true
  LD_LIBRARY_PATH=$ORIGINAL_LD

  rm -r inst_input $pkgdir$instdir/{Uninstall*,bin/{roam.lic,xclm},etc,rollbackBackupDirectory} || true

  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  ln -s $instdir/MPLAB_XC16_Compiler_License.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
