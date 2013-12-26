# Maintainer: Markus Heidelberg <markus dot heidelberg at web dot de>

# Note for x86_64 users:
# The fakechroot-i686.pkg.tar.xz md5sum differs if a newer version has been
# released and has to be adapted in this PKGBUILD then.

pkgname=microchip-libraries-for-applications
pkgver=v2013_06_15
pkgrel=1
pkgdesc="Microchip Libraries for Applications"
arch=('i686' 'x86_64')
url="http://www.microchip.com/MLA"
license=('custom')
makedepends=('fakechroot')
[ $CARCH = x86_64 ] && depends+=('lib32-glibc' 'lib32-fakeroot')
options=(!strip libtool staticlibs emptydirs !zipman)
install=$pkgname.install
_instdir=/opt/microchip_solutions
_installer=$pkgname-${pkgver//_/-}-linux-installer.run
source=(http://ww1.microchip.com/downloads/en/softwarelibrary/$_installer
        LICENSE)
[ $CARCH = x86_64 ] && source+=(fakechroot-i686.pkg.tar.xz::http://www.archlinux.org/packages/extra/i686/fakechroot/download/)

md5sums=('2b4d56053e22b47196ff370267f3505e'
         'dd2eec20ed33d2924fa301cea78467fa')
[ $CARCH = x86_64 ] && md5sums+=('92b9a1dc8fa0534048790731a7bf2fc5')

package() {
  cd $srcdir

  mkdir -p $pkgdir/{bin,etc,usr/{bin,lib,local/lib},tmp}

  ln -s /bin/bash $pkgdir/bin/

  echo "root:x:0:0:root:/root:/bin/bash" > $pkgdir/etc/passwd
  echo "root:x:0:root" > $pkgdir/etc/group

  cp $srcdir/$_installer $pkgdir/
  chmod 0755 $pkgdir/$_installer

  # 10x enter: read license
  # 1x y + enter: accept license [y/n]
  # 1x enter: accept installation directory
  # 13x enter: select components [Y/n]
  # 1x enter: confirm selection [Y/n]
  # 1x enter: start installation [Y/n]
  # 1x enter: continue
  # 1x n + enter: download JRE [Y/n]
  # 1x n + enter: open ReadMe [Y/n]
  echo -e "\n\n\n\n\n\n\n\n\n\ny\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nn\nn" > $pkgdir/inst_input

  # do not use $pkgdir$_instdir as installation directory because of the fakechroot environment
  echo "#!/bin/bash
  LD_LIBRARY_PATH=$srcdir/usr/lib/libfakeroot/fakechroot:\$LD_LIBRARY_PATH
  ./$_installer --prefix "$_instdir" --mode text < inst_input &> /dev/null || true"> $pkgdir/chroot_input.sh
  chmod 0755 $pkgdir/chroot_input.sh

  echo -e "Creating the Package\n  Please wait..."

  fakechroot chroot $pkgdir ./chroot_input.sh

  rm $pkgdir/{chroot_input.sh,inst_input,$_installer,etc/{group,passwd}}
  rm -r $pkgdir/{bin,tmp}

  # remove unwanted files created by the installer, already available in package "microchip-mplabx-bin"
  rm -r $pkgdir/{etc,usr/{bin,lib,local}}
  rm $pkgdir$_instdir/Uninstall*

  # fix totally messed up file permissions
  find $pkgdir$_instdir -type d -exec chmod 0755 '{}' \; -exec chmod ug-s '{}' \;
  find $pkgdir$_instdir -type f -exec chmod 0644 '{}' \;

  # TODO: create start scripts for Java tools

  install -Dm 644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
