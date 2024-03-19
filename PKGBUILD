# Maintainer: Peter blackman <peter at pblackman dot plus dot com>
#

pkgname=cevomapgen
pkgver=32
pkgrel=1
pkgdesc="External Random Map Generator for C-evo"
arch=('x86_64' 'aarch64')
url="https://sourceforge.net/projects/$pkgname"
license=('GPL-3.0-or-later')
depends=('qt6pas' 'glibc' 'libx11' 'hicolor-icon-theme')
makedepends=('fpc' 'lazarus-qt6')
source=("$url/files/Source/${pkgname}_${pkgver}.orig.tar.xz"
       "$url/files/Source/${pkgname}_${pkgver}.orig.tar.xz.asc")
sha256sums=('220f58e5dbc7cc5832f9d80fb74164d0923ae2b49feacd64957b25947d58ed41'
            'SKIP')
validpgpkeys=(14638444C9858E2A09B0259C211BCF562939AB8F)


prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # currently cannot build with -pie as the RTL is not built with pie
  sed -i '/-k-pie/d' fpc.cfg
}


build() {
  cd "$srcdir/$pkgname-$pkgver"

  lazbuild --ws=qt6 -B --lazarusdir=/usr/lib/lazarus CevoMapGen.lpi
  fpc -ocevomapcheck CevoMapCheck
}


package() {
  cd "$pkgname-$pkgver"

  install -p -Dm 755 "$pkgname"                 -t "$pkgdir/usr/bin"
  install -p -Dm 755 cevomapcheck               -t "$pkgdir/usr/bin"
  install -p -Dm 644 "Desktop/cevomapgen.svg"   -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -p -Dm 644 "Desktop/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
  install -p -Dm 644 Templates/*.INI            -t "$pkgdir/usr/share/$pkgname/Templates"
  install -p -Dm 644 Docs/*.html                -t "$pkgdir/usr/share/doc/$pkgname"
  install -p -Dm 644 ManPages/*.6               -t "$pkgdir/usr/share/man/man6"
}
