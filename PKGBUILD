# Maintainer: Kyle Keen <keenerd@gmail.com>

# missing man page?

pkgname=cryptominisat4
pkgver=4.5.3
pkgrel=1
pkgdesc="A modern, multi-threaded, feature-rich, simplifying SAT solver"
arch=('i686' 'x86_64')
url="http://www.msoos.org/cryptominisat4/"
license=('LGPL')
depends=('zlib' 'gcc-libs' 'boost-libs' 'intel-tbb')
makedepends=('python2' 'boost')
optdepends=('python2: python module')
#source=("http://msoos.org/largefiles/cryptominisat-$pkgver.tar.bz2")
source=("cms4-$pkgver.tgz::https://github.com/msoos/cryptominisat/archive/$pkgver.tar.gz")
md5sums=('7ad723a166409ef567224dd45554c45e')

# many fancy features requiring makedeps
# intel-tbb, python2, m4ri, libmysqlclient, valgrind

prepare() {
  cd cryptominisat-$pkgver
  sed -i 's/python$/python2/' python/Makefile
  sed -i 's/\(CRYPTOMINISAT4_EXECUTABLE\).*/\1 cryptominisat4\)/' *.cmake.in
}

build() {
  cd cryptominisat-$pkgver
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
  cd cryptominisat-$pkgver/build
  make install DESTDIR="$pkgdir"
  #mv "$pkgdir/usr/bin/cryptominisat" "$pkgdir/usr/bin/cryptominisat4"
  # todo, tweak the build tools to respect DESTDIR
  cd py-lib
  python2 setup.py install --record files.txt --root="${pkgdir}"
  #sed -i 's/cryptominisat\b/cryptominisat4/g' "$pkgdir/usr/lib/cmake/cryptominisat4/*.cmake"

  # bloat
  rm -f "$pkgdir/usr/lib/libcryptominisat4.a"
}

