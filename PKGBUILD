# Contributor: Sascha Biermmanns <saschakb at gmail dot com>
# Contributed by: Jens Staal <staal1978@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=heirloom-ex-vi-cvs
pkgver=2011.06.22
pkgrel=1
pkgdesc="The Traditional Vi"
arch=('i686' 'x86_64')
url="http://ex-vi.sourceforge.net/"
license=('Custom:BSD')
provides=('vi')
depends=('heirloom-cvs')
makedepends=('cvs')
source=('Makefile.patch')
md5sums=('9464be14a42fbf6f9f0a60a8be93db1e')
sha1sums=('a378477207165ef1bcbd640edb874224d9111f7b')
sha256sums=('c028c899b1045d488e67af2be834bf5f615e6f0e8a6240992f76bc79398aa744')

prepare() {
cd $srcdir
  cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/ex-vi login
  cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/ex-vi co ex-vi
  cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom/ login #getting some missing headers
  cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom/ co heirloom/libcommon
  rm -rf $srcdir/build
  cp -ar $srcdir/ex-vi $srcdir/build
  cd $srcdir/build
  patch -p0 $srcdir/build/Makefile -i $srcdir/Makefile.patch
}

build() {
  cd $srcdir/build
  export CC="gcc -I $srcdir/heirloom/libcommon" make
}

package() {
  cd $srcdir/build
  make DESTDIR="$pkgdir" install
  install -Dm644 $srcdir/ex-vi/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

