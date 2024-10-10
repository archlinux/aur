# Maintainer: Peter blackman <peter at pblackman dot plus dot com>
# 10-Oct-2024
#

pkgname=cevomapgen
pkgver=37
pkgrel=1
pkgdesc="External Random Map Generator for C-evo"
arch=('x86_64' 'aarch64')
url="https://git.code.sf.net/p/$pkgname/code"
license=('GPL-3.0-or-later')
depends=('qt5pas' 'glibc' 'libx11' 'hicolor-icon-theme')
makedepends=('git' 'fpc' 'lazarus-qt5')
source=("$pkgname-$pkgver"::git+$url#tag=$pkgver)
sha256sums=('40e85905982e5c60a4a44914fd4cc8f115ea3e90c94bf80c14f5a071fdeaa9a8')

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
