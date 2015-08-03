# Maintainer: Will Price <willprice94+arch@gmail.com>
# Contributor: Andrew67 (.desktop file, icon, 64bit compatibility)

pkgname=energia
pkgver=0015
pkgrel=8
pkgdesc="Energia is a Arduino IDE clone for use with the MSP430 launchpad"
arch=('i686' 'x86_64')
url="http://energia.nu/"
license=('GPL')
depends=(java-environment java-rxtx)
provides=('energia')
# staticlibs keeps all *.a files which are necessary since we bundle a toolchain
# !strip disable stripping of debug symbols which are useful 
options=(!strip staticlibs)
install='energia.install'
source=('energia.desktop'
        '10-msp430-launchpad.rules')
md5sums=('a7ce061d9fc0f9530e058204e532b40b'
         'dcdf66ac4ae446dcfadbcd6a2dbb6f31')
if [[ $CARCH == "x86_64" ]]; then
 source+=("$pkgname-$pkgver-$CARCH.tgz::http://energia.nu/downloads/downloadv3.php?file=energia-0101E$pkgver-linux64.tgz")
 md5sums+=('b754fbbc535fda18bd586e479f177928')
elif [[ $CARCH == "i686" ]]; then
 source+=("$pkgname-$pkgver-$CARCH.tgz::http://energia.nu/downloads/downloadv3.php?file=energia-0101E$pkgver-linux.tgz")
 md5sums+=('fd30043f453cfb41b7c75f6a4efe683c')
fi

# Don't compress, takes too long
PKGEXT='.pkg.tar'

package() {
  _copy_src
  _link_binary_to_bin
  _patch_package_for_lock_issues
  _add_menu_entry_and_icon
  (_support_fhs)
}


_copy_src() {
  mkdir -p "$pkgdir"{/etc/{tmpfiles.d,udev/rules.d},/opt/energia,/usr/{bin,share/{applications,pixmaps,doc}}}

  # --archive copies recursively, preserves permissions and links
  cp --archive "$srcdir/$pkgname-0101E$pkgver/." "$pkgdir/opt/energia"
}

_patch_package_for_lock_issues() {
  ln -sf /usr/lib/librxtxSerial.so "$pkgdir/opt/energia/lib/librxtxSerial64.so"
  ln -sf /usr/lib/librxtxSerial.so "$pkgdir/opt/energia/lib/librxtxSerial32.so"
  ln -sf /usr/share/java/rxtx/RXTXcomm.jar "$pkgdir/opt/energia/lib/RXTXcomm.jar"
  install -m755 "$srcdir/10-msp430-launchpad.rules" "$pkgdir/etc/udev/rules.d/"
}

_link_binary_to_bin() {
  ln -s /opt/energia/energia "$pkgdir/usr/bin/"
}

_add_menu_entry_and_icon() {
  install -m755 "$srcdir/energia.desktop" "$pkgdir/usr/share/applications/"
  for size in 16 24 32 48; do
    install -m755 "$pkgdir/opt/energia/lib/energia_$size.png" "$pkgdir/usr/share/pixmaps/"
  done
}

_support_fhs() {
  # To some extent ;)
  cd "$pkgdir/usr/share/doc"
  ln -s /opt/energia/reference energia
}
