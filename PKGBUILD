# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=vigra-git
pkgver=3863.e360aa3
pkgrel=1
pkgdesc="Computer vision library"
arch=('i686' 'x86_64')
url="http://hci.iwr.uni-heidelberg.de/vigra/"
license=('custom:MIT')
depends=('libpng' 'libtiff' 'openexr' 'hdf5')
optdepends=('python2: vigra-config'
            'boost-libs: python interface' 'python2: python interface' 'fftw: python interface')
# add doxygen to makedepends to build documentation
makedepends=('git' 'cmake' 'fftw' 'python2-numpy' 'boost')
checkdepends=('python2-nose')
provides=('vigra' 'vigra-hg')
conflicts=('vigra' 'vigra-hg')
replaces=('vigra-hg')
source=('git+git://github.com/ukoethe/vigra.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/vigra"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/vigra"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DWITH_OPENEXR=true \
        -DDOCINSTALL=share/doc \
        -DCMAKE_SHARED_LINKER_FLAGS="-lpthread" \
        .
  make
}

check() {
  cd "$srcdir/vigra"
  make -k check
}

package() {
  cd "$srcdir/vigra"
  make DESTDIR="$pkgdir/" install

  # fix for python2
  sed -i 's|python$|python2|' "$pkgdir/usr/bin/vigra-config"

  # license
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 
