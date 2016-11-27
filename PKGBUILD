# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=elemental
pkgver=0.87.3
pkgrel=1
url="https://github.com/elemental/Elemental"
pkgdesc="distributed-memory dense linear algebra"
makedepends=('cmake')
depends=('openblas-lapack' 'parmetis' 'libmpc' 'python2')
arch=('i686' 'x86_64')
license=("custom:BSD")
source=("https://github.com/elemental/Elemental/archive/v0.87.3.tar.gz")
md5sums=('690bb9be7388017c2e475b36182671e4')
options=('!makeflags')

  
build() {
  cd "${srcdir}/Elemental-${pkgver}"
  mkdir -p build && pushd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_EL_DISABLE_PARMETIS=ON \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_LIBDIR=/usr/lib
  make
}

package() {
  cd "${srcdir}/Elemental-${pkgver}"/build
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
