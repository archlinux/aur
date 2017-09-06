# Contributor: Adrian Petrescu <apetresc@gmail.com>
# Maintainer: Adrian Petrescu <apetresc@gmail.com>

pkgname=benzene-mohex
pkgver=1.0.1
pkgrel=3
pkgdesc='Computer Hex engine by UAlberta. Winner of 2015 ICGA Olympiad.'
arch=('i686' 'x86_64')
url='http://benzene.sourceforge.net'
license=('GPL3')
depends=('boost-libs' 'db')
makedepends=('boost')
source=("https://github.com/apetresc/benzene/archive/v$pkgver.tar.gz"
        'https://github.com/apetresc/fuego/archive/v1.1.tar.gz'
        'mohex-paths.patch')
md5sums=('517c202987706c6f3dd70dbf57fe67fa'
         '90a3e6c46f5a418f9fe5bdab46ca6b90'
         'e4862df92f36e9f404617678cc2131c5')

prepare() {
  cd $srcdir/benzene-$pkgver/
  patch -p1 -i $srcdir/mohex-paths.patch
  mv share/ice-patterns.txt share/mohex-ice-patterns.txt
  mv share/vc-captured-set.txt share/mohex-vc-captured-set.txt
}

build() {
  cd fuego-1.1/
  autoreconf -i
  ./configure
  make

  cd ../benzene-$pkgver/
  autoreconf -i
  ./configure --with-fuego-root=$(pwd)/../fuego-1.1/ --enable-upto19x19
  make
}

check() {
  cd benzene-$pkgver
  make check
}

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/local/share/benzene

  cp $srcdir/benzene-$pkgver/src/mohex/mohex $pkgdir/usr/bin/mohex
  cp $srcdir/benzene-$pkgver/share/mohex-ice-patterns.txt $pkgdir/usr/local/share/benzene/
  cp $srcdir/benzene-$pkgver/share/mohex-vc-captured-set.txt $pkgdir/usr/local/share/benzene/
  cp $srcdir/benzene-$pkgver/share/mohex-patterns.txt $pkgdir/usr/local/share/benzene/
}

