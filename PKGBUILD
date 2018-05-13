# Maintainer: Fabrice aneche <akh at nobugware dot com>

pkgname=s2geometry-git
pkgver=r233
pkgrel=1
pkgdesc="Computational geometry and spatial indexing on the sphere"
arch=('i686' 'x86_64')
url="https://s2geometry.io/"
license=('APACHE2')
depends=('openssl' 'python' 'gtest')
makedepends=('git' 'cmake')
source=("git+https://github.com/google/s2geometry.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/s2geometry"
  printf "r%s" "$(git rev-list --count HEAD)"
}

build() {
  cd "$srcdir/s2geometry"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr  ..
  make
}

package() {
  cd "$srcdir/s2geometry/build"
  make DESTDIR="$pkgdir/" install
  SITE_PACKAGE=`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`
  mkdir -p "$pkgdir/$SITE_PACKAGE"
  install -m 644 python/pywraps2.py "$pkgdir/$SITE_PACKAGE/pywraps2.py"
  install -m 644 python/_pywraps2.so "$pkgdir/$SITE_PACKAGE/_pywraps2.so"
  rm $pkgdir/usr/share/python/pywraps2.py
  rm $pkgdir/usr/share/python/_pywraps2.so
  rmdir $pkgdir/usr/share/python
  rmdir $pkgdir/usr/share 
}

