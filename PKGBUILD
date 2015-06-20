# Maintainer: Peter Ivanov <ivanovp@gmail.com>
# Contributor: titron <titron at titron dot ru>
# Contributor: David Manouchehri <david@davidmanouchehri.com>
# Submitter: BxS <bxsbxs at gmail dot com>

pkgname=microchip-mplabxc8-bin
pkgver=1.34
pkgrel=2
pkgdesc="C compiler for PIC10 PIC12 PIC16 PIC18 MCUs"
arch=(i686 x86_64)
url=http://www.microchip.com/xc8
license=(custom)
makedepends=(xclm-dirs)
[ $CARCH = x86_64 ] && depends+=(lib32-gcc-libs lib32-expat)
[ $CARCH = x86_64 ] && makedepends=(lib32-fakeroot)
provides=(mplabxc8)
conflicts=(mplabxc8)
options=(!strip docs libtool emptydirs !zipman staticlibs !upx)
PKGEXT='.pkg.tar'
install=$pkgname.install
instdir=/opt/microchip/xc8/v$pkgver
installer=xc8-v$pkgver-full-install-linux-installer.run
source=(http://ww1.microchip.com/downloads/en/DeviceDoc/xc8-v$pkgver-full-install-linux-installer.run)
md5sums=('443c0b7045bf414aaccb64b91036aac8')

package() {
  if [ ! -d $instdir/etc ]; then
    error "You have to create directory $instdir/etc before building this package!"
    exit 1
  fi
  echo -e "Creating the Package\n  Please wait..."

  cd $pkgdir

  mkdir -p $pkgdir$instdir

  chmod 0755 $srcdir/$installer
  echo -e "i\ni\ni\ni\ni\ni\ni\ni\ni\ni\ni\ni\n\n\n\n\n\n\n\n\n\n\ny\n\n\n\n\n\n\n\n\n\n\n" > inst_input
  $srcdir/$installer --mode text --prefix $pkgdir$instdir < inst_input &> /dev/null || true
  rm inst_input

  rm -r $pkgdir$instdir/rollbackBackupDirectory || true

  mkdir -p $pkgdir$instdir/bin
  echo -e "#!/bin/sh" > $pkgdir$instdir/bin/xclm
  chmod 0755 $pkgdir$instdir/bin/xclm

  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  ln -s $instdir/docs/license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
