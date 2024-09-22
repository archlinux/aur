# Maintainer: Peter blackman <peter at pblackman dot plus dot com>
# 22-Sep-2024
#

pkgname=cevomapgen
pkgver=35
pkgrel=1
pkgdesc="External Random Map Generator for C-evo"
arch=('x86_64' 'aarch64')
url="https://git.code.sf.net/p/$pkgname/code"
license=('GPL-3.0-or-later')
depends=('qt6pas' 'glibc' 'libx11' 'hicolor-icon-theme')
makedepends=('git' 'fpc' 'lazarus-qt6')
source=("$pkgname-$pkgver"::git+$url#tag=$pkgver)
#source=('cevomapgen_35.orig.tar.xz')
sha256sums=('5862e15153a09b0a04cf227280eb398490359d21fb5c9531b259b3e9a1c9ab76')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  # currently cannot build with -pie as fpc's RTL is not built with pie
  # Supress lacks GNU_PROPERTY_X86_FEATURE_1_SHSTK warning
  sed -i 's/pie/zshstk/' fpc.cfg
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  lazbuild --ws=qt6 -B --lazarusdir=/usr/lib/lazarus CevoMapGen.lpi
  fpc -ocevomapcheck CevoMapCheck
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" prefix=/usr install
}
