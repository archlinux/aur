# Contributor: Adrian Petrescu <apetresc@gmail.com>
# Maintainer: Adrian Petrescu <apetresc@gmail.com>

pkgname=benzene-wolve
pkgver=1.0.1
pkgrel=3
pkgdesc='Computer Hex engine by UAlberta. Winner of 2008 ICGA Olympiad.'
arch=('i686' 'x86_64')
url='http://benzene.sourceforge.net'
license=('GPL3')
depends=('boost-libs' 'db')
makedepends=('boost')
source=("https://github.com/apetresc/benzene/archive/v$pkgver.tar.gz"
        'https://github.com/apetresc/fuego/archive/v1.1.tar.gz'
        'wolve-paths.patch')
md5sums=('517c202987706c6f3dd70dbf57fe67fa'
         '90a3e6c46f5a418f9fe5bdab46ca6b90'
         '2df4524f07d9a53cf65ffa81533b2ae8')


prepare() {
  cd $srcdir/benzene-$pkgver/
  patch -p1 -i $srcdir/wolve-paths.patch
  mv share/ice-patterns.txt share/wolve-ice-patterns.txt
  mv share/vc-captured-set.txt share/wolve-vc-captured-set.txt
}

build() {
  cd $srcdir/fuego-1.1/
  autoreconf -i
  ./configure
  make

  cd $srcdir/benzene-$pkgver/
  autoreconf -i
  ./configure --with-fuego-root=$(pwd)/../fuego-1.1/ --enable-upto19x19
  make
}

check() {
  cd $srcdir/benzene-$pkgver
  make check
}

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/local/share/benzene

  cp $srcdir/benzene-$pkgver/src/wolve/wolve $pkgdir/usr/bin/wolve
  cp $srcdir/benzene-$pkgver/share/wolve-ice-patterns.txt $pkgdir/usr/local/share/benzene/
  cp $srcdir/benzene-$pkgver/share/wolve-vc-captured-set.txt $pkgdir/usr/local/share/benzene/
  cp $srcdir/benzene-$pkgver/share/wolve-cache-book.txt $pkgdir/usr/local/share/benzene/wolve-cache-book.txt
}

