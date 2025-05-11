# Maintainer: Peter blackman <peter at pblackman dot plus dot com>
# 11-May-2025
#

pkgname=cevomapgen
pkgver=38.1
pkgrel=1
pkgdesc="External Random Map Generator for C-evo"
arch=('x86_64' 'aarch64')
url="https://git.code.sf.net/p/$pkgname/code"
license=('GPL-3.0-or-later')
depends=('qt5pas' 'glibc' 'libx11' 'hicolor-icon-theme')
makedepends=('git' 'fpc' 'lazarus-qt5')
source=("$pkgname-$pkgver"::git+$url#tag=$pkgver)
sha256sums=('6d417abd37e3b668e02248d94354e9cbd373d258c9b3c97c4a368a335022c5a6')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  # currently cannot build with -pie as fpc's RTL is not built with pie
  # Supress lacks GNU_PROPERTY_X86_FEATURE_1_SHSTK warning
  sed -i 's/pie/zshstk/' fpc.cfg
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make LAZDIR=--lazarusdir=/usr/lib/lazarus all
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" prefix=/usr install
}
