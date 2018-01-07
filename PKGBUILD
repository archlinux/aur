# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

pkgname=gpsman
pkgver=6.4.4.2
pkgrel=1
pkgdesc="Graphical GPS data manager for preparing, inspecting and editing GPS data"
arch=('any')
url="http://gpsman.sourceforge.net/"
license=('GPL')
depends=('tcl' 'tk')
makedepends=('gendesk')
optdepends=('gpsmanshp: shapefile support')
install=gpsman.install
source=(http://sourceforge.net/projects/gpsman/files/distrib/gpsman-$pkgver.tgz)
md5sums=('0f3819caf6479d5cd529bf6dc8e04de3')

package() {
  cd "$srcdir"
  gendesk $startdir/PKGBUILD

  cd "${pkgname}-${pkgver}"
  mkdir -p "$pkgdir"/usr/{bin,share/${pkgname}}

  # set path to program files
  sed -i "s|set SRCDIR gmsrc|set SRCDIR /usr/share/gpsman|g" ./gpsman.tcl
  install -m755 gpsman.tcl "$pkgdir"/usr/bin/gpsman.tcl

  # install a gpsman launcher
  install -m755 util/gpsman.sh "$pkgdir"/usr/bin/gpsman

  #install program files
  cp -r gmsrc/* "$pkgdir"/usr/share/gpsman/
  chmod 755 "$pkgdir"/usr/share/gpsman/*.tcl
  chmod -R 755 "$pkgdir"/usr/share/gpsman/gmicons

  # install some freedesktop.org compatibility
  install -Dm644 "$srcdir"/${pkgname}.desktop \
      "$pkgdir"/usr/share/applications/${pkgname}.desktop
  install -Dm644 "$srcdir"/${pkgname}.png \
      "$pkgdir"/usr/share/pixmaps/${pkgname}.png
}
