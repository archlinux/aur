# Michael J. Pento <mjpento@verizon.net>
# Maintainer: Will Price <willprice94+arch@gmail.com>
# Contributor: Andrew67 (.desktop file, icon, 64bit compatibility)

pkgname=energia
pkgver=1.8.10E23
pkgrel=1
pkgdesc="Energia is a Arduino IDE clone for use with the MSP430 launchpad"
arch=('x86_64')
url="http://energia.nu/"
license=('GPL')
depends=('java-environment' 'java-rxtx' 'libusb-compat' 'gcc-libs-multilib')
provides=('energia')
# staticlibs keeps all *.a files which are necessary since we bundle a toolchain
# !strip disable stripping of debug symbols which are useful
options=(!strip staticlibs)
install='energia.install'
source=('energia.desktop'
        '71-ti-permissions.rules'
        "${pkgname}-${pkgver}.tar.xz::http://energia.nu/downloads/downloadv4.php?file=energia-${pkgver}-linux64.tar.xz")
md5sums=('a7ce061d9fc0f9530e058204e532b40b'
         '8633ff7228aed033d9c9befb82581af9'
         'ae84c41c9087a49007ca31842e1638e3')

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
  cp --archive "${srcdir}/${pkgname}-${pkgver}/." \
               "$pkgdir/opt/energia"
}

_patch_package_for_lock_issues() {
  ln -sf /usr/lib/librxtxSerial.so \
         "$pkgdir/opt/energia/lib/librxtxSerial.so"
  ln -sf /usr/share/java/rxtx/RXTXcomm.jar \
         "$pkgdir/opt/energia/lib/RXTXcomm.jar"
  install -m755 "$srcdir/71-ti-permissions.rules" \
                "$pkgdir/etc/udev/rules.d/"
}

_link_binary_to_bin() {
  ln -s /opt/energia/energia \
        "$pkgdir/usr/bin/"
}

_add_menu_entry_and_icon() {
  install -m755 "$srcdir/energia.desktop" \
                "$pkgdir/usr/share/applications/"
  install -m755 "$pkgdir/opt/energia/lib/arduino.png" \
                "$pkgdir/usr/share/pixmaps/energia.png"
}

_support_fhs() {
  # To some extent ;)
  cd "$pkgdir/usr/share/doc"
  ln -s /opt/energia/reference energia
}
