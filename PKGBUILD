# Contributor:  <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=sharpconstruct
pkgver=0.12
pkgrel=8
pkgdesc='Create 3D models by sculpting'
arch=(x86_64)
url='https://sourceforge.net/projects/sharp3d/'
depends=(gtkglextmm libglademm libsigc++)
makedepends=(addinclude)
license=(GPL2)
source=('https://downloads.sourceforge.net/sourceforge/sharp3d/sharpconstruct-0.12-rc3.tar.bz2'
        mainwindow.patch)
b2sums=('8d5d961788afa94c2f2a95d1e4410ce660508e62c6c92b0197f2e48435760547ce67bfbf40946ee1320607b31c8fb0f1c9509eeb076d8bb921a3bcbbd750ee29'
        '555fbd561ba4a3bffc48f748902835d71d9bb19455354ba44c528552a13ce499e8dd7c29e0845d949fbb022e4e923c1111c8bd5f54b66c5772ae8a81ab67b534')

build() {
  cd $pkgname-$pkgver
  patch -p0 -i "$srcdir/mainwindow.patch"
  addinclude include/DataDir.hh malloc
  sed 's|typedef std::vector< Point3D, Align< Point3D > >|typedef std::vector< Point3D >|g' -i include/Point.hh
  export CFLAGS+=' -std=c11 -Wfatal-errors -w'
  export CXXFLAGS+=' -std=c++11 -Wfatal-errors -w'
  ./configure --enable-sse --mandir=/usr/share/man --prefix=/usr
  make -j1
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
