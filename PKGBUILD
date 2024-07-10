# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_commit=a3ee183cd3a5d65d3780eefbe75df4f98bca08c6

pkgname=lisaem
pkgver=RC5_2024.01.01
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="Apple Lisa computer emulator"
arch=('x86_64')
url="https://github.com/arcanebyte/lisaem"
license=('GPL-2.0-or-later')
depends=('wxwidgets-gtk3')
makedepends=('git')
source=("$pkgname-$_pkgver.tar.gz::$url/archive/refs/tags/$_pkgver.tar.gz")
b2sums=('016dbfcb6e62d8eb5e474ff3e12f0a0ca5607de12bedb49bb2dddad07fe66bc4d982605414aa1677323c8d5b6d0d43c6076a6236ab34cefd2cbdf57d9a1800ff')

prepare() {
  cd $pkgname-$_pkgver
  sed -i "s|usr/local|usr|g" bashbuild/Linux.sys resources/lisaem.desktop
  sed -i "s/egrep/grep -E/g" build.sh bashbuild/src.build bashbuild/compilequeue.fn bashbuild/pre-atexit.fn
}

build() {
  cd $pkgname-$_pkgver
  ./build.sh clean build
}

package() {
  cd $pkgname-$_pkgver
  sed -i "s|\"/usr|\"$pkgdir/usr|g" bashbuild/Linux.sys
  ./build.sh install

  install -Dm644 "$srcdir/$pkgname-$_pkgver/LICENSE.txt" \
                 "$pkgdir/usr/share/doc/$pkgname/LICENSE.txt"
}
