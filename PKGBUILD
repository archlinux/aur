# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=cryptominisat4
pkgver=4.2.0
pkgrel=1
pkgdesc="A modern, multi-threaded, feature-rich, simplifying SAT solver"
arch=('i686' 'x86_64')
url="http://www.msoos.org/cryptominisat4/"
license=('LGPL')
depends=('zlib' 'gcc-libs' 'boost-libs' 'intel-tbb')
makedepends=('python2' 'boost')
optdepends=('python2: python module')
source=("http://msoos.org/largefiles/cryptominisat-$pkgver.tar.bz2")
md5sums=('d12ed2839160ad946a3925c8eec94a39')

# many fancy features requiring makedeps
# intel-tbb, python2, m4ri, libmysqlclient, valgrind

build() {
  cd cryptominisat4-$pkgver
  sed -i 's/python$/python2/' python/Makefile
  mkdir -p build
  cd build
  # options to play with:
  # -DUSE_TBB -DUSE_ZLIB -DUSE_MYSQL
  # NOMYSQL NOSTATS NOM4RI ENABLE_TESTING
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr \
      -DNOM4RI=on -DNOMYSQL=on ../
  make
}

package() {
  cd cryptominisat4-$pkgver/build
  make install DESTDIR="$pkgdir"
  mv "$pkgdir/usr/bin/cryptominisat" "$pkgdir/usr/bin/cryptominisat4"
  # todo, tweak the build tools to respect DESTDIR
  cd py-lib
  python2 setup.py install --record files.txt --root="${pkgdir}"
}

