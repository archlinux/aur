# Maintainer: Peter blackman <peter at pblackman dot plus dot com>
# 22-Apr-2024
#

_tag=33
pkgname=cevomapgen
pkgver=$_tag
pkgrel=1
pkgdesc="External Random Map Generator for C-evo"
arch=('x86_64' 'aarch64')
url="https://git.code.sf.net/p/$pkgname/code"
license=('GPL-3.0-or-later')
depends=('qt6pas' 'glibc' 'libx11' 'hicolor-icon-theme')
makedepends=('git' 'fpc' 'lazarus-qt6')
source=("$pkgname-$pkgver"::git+$url#tag=$_tag)
sha256sums=('def344d7670c2afa6fbbbf0d9884c09f5b31b2700edd0f11ef500e28e7c48fa8')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # currently cannot build with -pie as fpc's RTL is not built with pie
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
