# Maintainer: Peter Ivanov <ivanovp@gmail.com>

pkgname=pblazasm
pkgver=1.2
pkgrel=2
pkgdesc="Command line tool to assemble Picoblaze code in Xilinx, pBlazIDE or extended syntax"
arch=("i686" "x86_64")
url="http://code.google.com/p/pblazasm/"
license=("GPL3")
depends=()
makedepends=(svn)
options=('!strip')
source=(pblazasm.patch)
md5sums=(d1238c80c6dc408a839f460b48e84ba0)

_svnroot=http://pblazasm.googlecode.com/svn/trunk
#_svnname=pblazasm-read-only

build() {
  msg "Connecting to SVN server..."
  if [[ -d $srcdir/$pkgname-$pkgver ]]; then
    cd $srcdir/$pkgname-$pkgver && svn update || return 1
  else
    svn co $_svnroot $srcdir/$pkgname-$pkgver || return 1
    cd $srcdir/$pkgname-$pkgver
  fi

  msg "SVN checkout done or server timeout"
  cd "$srcdir/$pkgname-$pkgver/pBlazASM"
  if [ ! -f pblazasm.patched ]; then
      patch -p0 < ../../pblazasm.patch
      touch pblazasm.patched
  fi
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/pBlazASM"
  install -d ${pkgdir}/usr/bin
  install -Dm755 pBlazASM ${pkgdir}/usr/bin/pblazasm
}
