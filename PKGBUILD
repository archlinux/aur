# Maintainer: Peter blackman <peter at pblackman dot plus dot com>
#

pkgname=cevomapgen
pkgver=31
pkgrel=2
pkgdesc="External Random Map Generator for C-evo"
arch=('x86_64' 'aarch64')
url="https://sourceforge.net/projects/$pkgname"
license=('GPL')
depends=('qt6pas' 'glibc' 'libx11' 'hicolor-icon-theme')
makedepends=('fpc' 'lazarus-qt6')
source=("$url/files/Source/${pkgname}_${pkgver}.orig.tar.xz"
       "$url/files/Source/${pkgname}_${pkgver}.orig.tar.xz.asc")
sha256sums=('ecb5c479a2951703f95e58924f4bad44faaf1961e5e17910f4596755baf01320'
            'SKIP')
validpgpkeys=(14638444C9858E2A09B0259C211BCF562939AB8F)


prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # currently cannot build with -pie as the RTL is not built with pie
  sed -i '/-k-pie/d' fpc.cfg
  
  # Switch to using qt6
  sed -i 's/qt5/qt6/g' Makefile
}


build() {
  cd "$srcdir/$pkgname-$pkgver"

  export LAZDIR="--lazarusdir=/usr/lib/lazarus"
  make -B lazarusdir=/usr/lib/lazarus
}


package() {
  cd "$pkgname-$pkgver"

  install -p -Dm 755 "$pkgname"                 -t "$pkgdir/usr/bin"
  install -p -Dm 644 "Desktop/cevomapgen.svg"   -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -p -Dm 644 "Desktop/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
  install -p -Dm 644 Templates/*.INI            -t "$pkgdir/usr/share/$pkgname/Templates"
  install -p -Dm 644 Docs/*.html                -t "$pkgdir/usr/share/doc/$pkgname"
}
