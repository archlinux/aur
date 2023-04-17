# Maintainer: Peter blackman <peter at pblackman dot plus dot com>
# 

pkgname=cevomapgen
pkgver=25
pkgrel=1
pkgdesc="External Random Map Generator for C-evo"
arch=('x86_64' 'aarch64')
url="https://sourceforge.net/projects/$pkgname"
license=('GPL')
depends=('qt5pas' 'glibc' 'libx11' 'hicolor-icon-theme')
makedepends=('fpc' 'lazarus-qt5')

source=("$url/files/Source/${pkgname}_${pkgver}.orig.tar.xz"
        "$url/files/Source/${pkgname}_${pkgver}.orig.tar.xz.asc")
sha256sums=('8a3fa6edd8f8042560dfad070353c8707b7362e9793c55f5079135cda8957159'
            'SKIP')
validpgpkeys=(14638444C9858E2A09B0259C211BCF562939AB8F)


prepare() {
  cd "$srcdir/$pkgname-$pkgver"
	
  # Set temporary folder for lazarus primary config
  rm -fr "$srcdir/config"
  mkdir  "$srcdir/config"

  # Don't need Windows docs on Arch
  rm -f "Docs/ReadmeWindows.html"
  
  # Move desktop files  
  rm -fr Desktop
  mkdir  Desktop
  mv "Docs/cevomapgen.svg"   Desktop
  mv "Docs/$pkgname.desktop" Desktop

  # currently cannot build with -pie as the RTL is not built with pie
  sed -i '/-k-pie/d' fpc.cfg
}


build() {
  cd "$srcdir/$pkgname-$pkgver"
 
  # clean
  rm -fr lib
  rm -f *.res

  lazbuild -v
  lazbuild --ws=qt5 -B --lazarusdir=/usr/lib/lazarus --pcp="$srcdir/config" CevoMapGen.lpi
}


package() {
  cd "$pkgname-$pkgver"

  install -p -Dm 755 "$pkgname"                 -t "$pkgdir/usr/bin"
  install -p -Dm 644 "Desktop/cevomapgen.svg"   -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -p -Dm 644 "Desktop/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
  install -p -Dm 644 Templates/*.INI            -t "$pkgdir/usr/share/$pkgname/Templates" 
  install -p -Dm 644 Docs/*.html                -t "$pkgdir/usr/share/doc/$pkgname" 
}
