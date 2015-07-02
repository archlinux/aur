# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=bt747
_pkgname=BT747
pkgver=2.1.3
pkgrel=2
pkgdesc="The swiss army knife for MTK loggers"
arch=('any')
url="http://bt747.org/"
license=('GPL')
depends=('java-rxtx')
makedepends=('imagemagick')
source=(http://downloads.sourceforge.net/$pkgname/${_pkgname}_${pkgver}_full.zip
        http://www.bt747.org/icon/${pkgname}_128x128.gif
        $pkgname.desktop)
md5sums=('7c78102f060933b041f102b98290b39b'
         '01a6c5989735d18d57756f51c41305ba'
         '8d0c25cbbfca16dfd102f2d43d54bd85')

prepare() {
  cd "$srcdir"
  sed -i 's|^ROOT_DIR=.*|ROOT_DIR=/usr/share/java/bt747|
          s|"$JAVA" -jar "${ROOT_DIR}/dist/BT747_j2se.jar" arch|uname -m|
          s|amd64|x86_64|
          s|/usr/share/java/RXTXcomm.jar|/usr/share/java/rxtx/RXTXcomm.jar|
          s|bt747.j2se_view.BT747Main $\* &|-Dbt747_settings="`echo ~`/.config/bt747/bt747settings.pdb" bt747.j2se_view.BT747Main $\*|' ./run_j2se.sh
}

build() {
  cd "$srcdir"
  convert "${pkgname}_128x128.gif" "${pkgname}_128x128.png"
}

package() {
  cd "$srcdir"
  _installdir="$pkgdir"/usr/share/java/$pkgname
  install -D -m644 lib/jchart2d-3.1.0.jar "$_installdir"/lib/jchart2d-3.1.0.jar
  install -D -m644 lib/jopt-simple-2.4.1.jar "$_installdir"/lib/jopt-simple-2.4.1.jar
  install -D -m644 lib/jcalendar-1.3.2.jar "$_installdir"/lib/jcalendar-1.3.2.jar
  install -D -m644 lib/swing-layout-1.0.3.jar "$_installdir"/lib/swing-layout-1.0.3.jar
  install -D -m644 lib/swingx.jar "$_installdir"/lib/swingx.jar
  install -D -m644 lib/swingx-ws.jar "$_installdir"/lib/swingx-ws.jar
  install -D -m644 dist/libBT747.jar "$_installdir"/dist/libBT747.jar
  install -D -m644 dist/BT747_j2se.jar "$_installdir"/dist/BT747_j2se.jar
  install -D -m755 ./run_j2se.sh "$pkgdir"/usr/bin/$pkgname
  install -D -m644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -D -m644 ${pkgname}_128x128.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
}
