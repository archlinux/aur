# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=idba
pkgver=1.1.3
pkgrel=1
pkgdesc="iterative de Bruijn graph assembler"
arch=('i686' 'x86_64')
url="http://i.cs.hku.hk/~alse/hkubrg/projects/idba_ud/"
license=('GPL2')
depends=('gcc-libs')
checkdepends=('python2')
source=("https://github.com/loneknightpy/idba/releases/download/$pkgver/idba-$pkgver.tar.gz")
sha256sums=('030e24463c6d725c1c202baabf773b605b51e310844fd0f27f4688ecfbae26d0')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  sed -e 's|#! /usr/bin/python|#!/usr/bin/env python2|' \
      -i script/run-unittest.py \
         script/scan.py
}

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr

  make
}

check() {
  cd $srcdir/$pkgname-$pkgver

  make unittest
}

package() {
  cd $srcdir/$pkgname-$pkgver

  for i in $(find bin -type f | xargs file | awk -F: '/ELF/ { print $1 }' | grep -vE '\.o$') ; do
    install -Dm755 $i $pkgdir/usr/bin/$(basename $i)
  done

  mv $pkgdir/usr/bin/{,idba_}test
}
