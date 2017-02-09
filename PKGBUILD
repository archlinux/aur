# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=elemental
pkgver=0.87.7
pkgrel=1
url="https://github.com/elemental/Elemental"
pkgdesc="distributed-memory dense linear algebra"
makedepends=('cmake')
depends=('openblas-lapack' 'parmetis' 'libmpc' 'python2')
arch=('i686' 'x86_64')
license=("custom:BSD")
source=("$pkgname-$pkgver.tar.gz::https://github.com/elemental/Elemental/archive/v$pkgver.tar.gz")
sha512sums=('4e1210a93013759b47e6283042ce434a9fc793a1d23745dcca7705e28e1b29f54d6fe386ece183c0793fc9c713fa7621aa94a3289ee04b23a1ce82ff2abaa350')
options=('!makeflags')

  
build() {
  cd Elemental-$pkgver
  mkdir -p build && pushd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_EL_DISABLE_PARMETIS=ON \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_LIBDIR=/usr/lib
  make
}

package() {
  cd Elemental-$pkgver/build
  make install DESTDIR="$pkgdir"
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  find $pkgdir/usr/python/El/ -type f -exec sed '1s+python+python2+' {} \;
  install -d $pkgdir/usr/lib/python2.7/site-packages
  cp -r $pkgdir/usr/python/El/ $pkgdir/usr/lib/python2.7/site-packages
  rm -rf $pkgdir/usr/python
  install -d $pkgdir/usr/lib/cmake/modules
  cp -r $pkgdir/usr/CMake/elemental/ $pkgdir/usr/lib/cmake/modules
  rm -rf $pkgdir/usr/CMake
  cp -r $pkgdir/usr/conf $pkgdir/etc
  rm -rf $pkgdir/usr/conf 
}
