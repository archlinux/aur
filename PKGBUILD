# Maintainer: Kyle Keen <keenerd@gmail.com>

# missing man page?

pkgname=cryptominisat5
pkgver=5.0.1
pkgrel=1
pkgdesc="A modern, multi-threaded, feature-rich, simplifying SAT solver"
arch=('i686' 'x86_64')
url="https://www.msoos.org/2016/07/cryptominisat-5-0-0-released/"
license=('MIT')
depends=('zlib' 'gcc-libs' 'boost-libs' 'intel-tbb')
makedepends=('python2' 'boost')
optdepends=('python2: python module')
source=("cms-$pkgver.tgz::https://github.com/msoos/cryptominisat/archive/$pkgver.tar.gz")
md5sums=('45203be947368de75b44cf734cbac1d7')

# many fancy features requiring makedeps
# intel-tbb, python2, m4ri, libmysqlclient, valgrind

prepare() {
  cd cryptominisat-$pkgver
  sed -i 's/python$/python2/' python/Makefile
  sed -i 's/\(CRYPTOMINISAT4_EXECUTABLE\).*/\1 cryptominisat5\)/' *.cmake.in
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
  cd cryptominisat-$pkgver
  install -Dm644 LICENSE-SCALMC "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd build
  make install DESTDIR="$pkgdir"
  #mv "$pkgdir/usr/bin/cryptominisat" "$pkgdir/usr/bin/cryptominisat5"
  # todo, tweak the build tools to respect DESTDIR
  cd pycryptosat
  python2 setup.py install --record files.txt --root="${pkgdir}"
  #sed -i 's/cryptominisat\b/cryptominisat4/g' "$pkgdir/usr/lib/cmake/cryptominisat4/*.cmake"

  # fix collision with cms4
  cd "$pkgdir/usr/lib/python2.7/site-packages/"
  mv pycryptosat.so pycryptosat5.so
  mv "pycryptosat-$pkgver-py2.7.egg-info" "pycryptosat5-$pkgver-py2.7.egg-info"
}

