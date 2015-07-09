# Maintainer: Peter Ivanov <ivanovp@gmail.com>
# Contributor: joat
# Submitter: BxS <bxsbxs at gmail dot com>

pkgname=microchip-mplabx-bin
pkgver=3.05
pkgrel=3
pkgdesc="IDE for Microchip PIC and dsPIC development"
arch=(i686 x86_64)
url=http://www.microchip.com/mplabx
license=(custom)
depends=(gtk2 alsa-lib libxslt libxtst desktop-file-utils jdk7-openjdk)
makedepends=(fakechroot)
depends_x86_64+=(lib32-glibc lib32-fakeroot)
optdepends=('microchip-mplabxc8-bin: C compiler for PIC10 PIC12 PIC16 PIC18 MCUs'
            'microchip-mplabxc16-bin: C compiler for PIC24 MCUs and dsPIC DSCs'
            'microchip-mplabxc32-bin: C Compiler for PIC32 MCUs'
            'microchip-mplabc18_bin: C compiler for PIC18 MCUs'
            'sdcc: C compiler for PIC16/18 MCUs')
provides=(mplab)
conflicts=(mplab)
options=(!strip docs libtool emptydirs !zipman !upx)
PKGEXT='.pkg.tar'
install=$pkgname.install
instdir=/opt/microchip/mplabx
installer_tar=MPLABX-v$pkgver-linux-installer.tar
installer_sh=MPLABX-v$pkgver-linux-installer.sh
installer=MPLABX-v$pkgver-linux-installer.run
installer2=MPLABCOMM-v$pkgver-linux-installer.run
source=(http://ww1.microchip.com/downloads/en/DeviceDoc/$installer_tar
        LICENSE)
source_x86_64+=(fakechroot-i686.pkg.tar.xz::http://www.archlinux.org/packages/extra/i686/fakechroot/download/)

md5sums=('cd9f5108ef6f4fdfbfabd89007748012'
         'a34a85b2600a26f1c558bcd14c2444bd')
md5sums_x86_64+=('92b9a1dc8fa0534048790731a7bf2fc5')

package() {
  cd $srcdir

  mkdir -p $pkgdir/{bin,etc,usr/{bin,lib,local/lib},usr/local/lib,tmp}

  ln -s /bin/bash $pkgdir/bin/
  ln -s /bin/sh $pkgdir/bin/

  echo "root:x:0:0:root:/root:/bin/bash" > $pkgdir/etc/passwd
  echo "root:x:0:root" > $pkgdir/etc/group

  echo Extracting installer from the buggy shell script...
# dd if=$installer_sh of=$installer.tar.gz skip=15067 bs=1 count=1036093 # This is slow because block size is 1 byte
# dd if=$installer_sh of=$installer.tmp skip=1 bs=1M
# cat $installer.tmp >>$installer.tar.gz
# tar xvzf $installer.tar.gz
# rm $installer.tmp $installer.tar.gz
  sh $installer_sh --tar xvf
  cp $srcdir/$installer $pkgdir/
  cp $srcdir/$installer2 $pkgdir/
  chmod 0755 $pkgdir/$installer
  chmod 0755 $pkgdir/$installer2

  echo -e "\n\n\n\n\n\n\n\n\n\ny\n\ny\ny\ny\n\n" > $pkgdir/inst_input
  echo -e "\n\n\n" > $pkgdir/inst_input2

  echo "#!/bin/bash
  LD_LIBRARY_PATH=$srcdir/usr/lib/libfakeroot/fakechroot:\$LD_LIBRARY_PATH
  ./$installer2 --mode text --installdir /opt/microchip/mplabcomm1.0 < inst_input2 &> /dev/null || true
  ./$installer --mode text < inst_input &> /dev/null || true"> $pkgdir/chroot_input.sh
#  ./$installer --mode text < inst_input || true"> $pkgdir/chroot_input.sh
  chmod 0755 $pkgdir/chroot_input.sh

  echo -e "Creating the Package\n  Please wait..."

  export FAKECHROOT_CMD_SUBST=/usr/bin/ldconfig=$srcdir/fake_ldconfig.sh
  fakechroot chroot $pkgdir ./chroot_input.sh

  sed -i 's|#jdkhome="/path/to/jdk"|jdkhome=/usr/lib/jvm/java-7-openjdk/|g' $pkgdir$instdir/v$pkgver/mplab_ide/etc/mplab_ide.conf
  sed -i 's|#jdkhome="/path/to/jdk"|jdkhome=/usr/lib/jvm/java-7-openjdk/|g' $pkgdir$instdir/v$pkgver/mplab_ipe/mplab_ipe
  sed -i 's|\"$jdkhome\"bin/java -jar \"$jdkhome\"/../../../mplab_ipe/ipe.jar|\"$jdkhome\"bin/java -jar /opt/microchip/mplabx/mplab_ipe/ipe.jar|g' $pkgdir$instdir/v$pkgver/mplab_ipe/mplab_ipe

  rm $pkgdir/{chroot_input.sh,inst_input,$installer,etc/{group,passwd}}
  rm -r $pkgdir/{bin,tmp}

  ln -s $instdir/v$pkgver/mplab_ide/bin/mplab_ide $pkgdir/usr/bin/mplab_ide
  ln -s $instdir/v$pkgver/mplab_ipe/mplab_ipe $pkgdir/usr/bin/mplab_ipe
  ln -s $instdir/../mplabcomm1_0_0/libmchpusb-1.0.so.0.0.0 $pkgdir/usr/local/lib/libmchpusb-1.0.so
  ln -s $instdir/../mplabcomm1_0_0/mchplinusbdevice $pkgdir/etc/.mplab_ide
  ln -s $instdir/../mplabcomm1_0_0/libUSBAccessLink.so $pkgdir/usr/lib/libUSBAccessLink.so
  ln -s $instdir/../mplabcomm1_0_0/libSerialAccessLink.so $pkgdir/usr/lib/libSerialAccessLink.so

  rm -f $pkgdir$instdir/Uninstall*

  install -Dm 644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

