# Maintainer: Peter blackman <peter at pblackman dot plus dot com>
# 01-Jun-2024
#

pkgname=cevomapgen
pkgver=34
pkgrel=1
pkgdesc="External Random Map Generator for C-evo"
arch=('x86_64' 'aarch64')
url="https://git.code.sf.net/p/$pkgname/code"
license=('GPL-3.0-or-later')
depends=('qt6pas' 'glibc' 'libx11' 'hicolor-icon-theme')
makedepends=('git' 'fpc' 'lazarus-qt6')
source=("$pkgname-$pkgver"::git+$url#tag=$pkgver)
sha256sums=('efcacb0239a7c6f8adf5988eb92f7c46f9e127dc837b5e1f24924a5e2f708195')

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
  make DESTDIR="$pkgdir/" prefix=/usr install
}
