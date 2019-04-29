# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=cryptominisat5-git
pkgver=5.6.8.r171.gc1b9ed65
pkgrel=1
pkgdesc="A modern multi-threaded SAT solver.  With experimental features enabled."
arch=('x86_64')
url="https://github.com/msoos/cryptominisat/"
license=('MIT')
provides=('cryptominisat5')
conflicts=('cryptominisat5')
depends=('zlib' 'gcc-libs' 'boost-libs' 'intel-tbb')
makedepends=('git' 'python2' 'python' 'boost' 'cmake' 'vim' 'help2man')
# vim for xxd
optdepends=('python2: python2 module'
            'python: python module')
source=("git+https://github.com/msoos/cryptominisat/")
md5sums=('SKIP')

# many fancy features requiring makedeps
# intel-tbb, python2, python3, m4ri, libmysqlclient, valgrind

pkgver() {
    cd cryptominisat
    git describe --long --tags --match '*.*.*' | sed 's|^releases/||;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd cryptominisat
  sed -i 's/python$/python2/' python/Makefile
  sed -i 's/\(CRYPTOMINISAT4_EXECUTABLE\).*/\1 cryptominisat5\)/' *.cmake.in
}

build() {
  cd cryptominisat
  mkdir -p build
  cd build
  # options to play with:
  # -DUSE_TBB -DUSE_ZLIB -DUSE_MYSQL
  # NOMYSQL NOSTATS NOM4RI ENABLE_TESTING
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DNOM4RI=on -DNOMYSQL=on \
    -DLARGEMEM=on -DUSE_GAUSS=on ../
  make

  # no way to build both the py2 and py3 modules
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DNOM4RI=on -DNOMYSQL=on \
    -DFORCE_PYTHON2=on -DLARGEMEM=on -DUSE_GAUSS=on ../
  make

  cd pycryptosat
  python2 setup.py build
  python3 setup.py build
}

check() {
  cd "$srcdir/cryptominisat/build/pycryptosat"
  _TESTPATH="$PYTHONPATH:$PWD"

  # smoke test
  ln -sf pycryptosat.so libcryptominisat5.so.5.6
  PYTHONPATH=$_TESTPATH python2 -c "from pycryptosat import Solver"
  PYTHONPATH=$_TESTPATH python3 -c "from pycryptosat import Solver"

  # skip all the cmake stuff
  PYTHONPATH=$_TESTPATH python2 tests/test_pycryptosat.py
  PYTHONPATH=$_TESTPATH python3 tests/test_pycryptosat.py
}

package() {
  cd cryptominisat
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd build
  make install DESTDIR="$pkgdir"
  # todo, tweak the build tools to respect DESTDIR
  cd pycryptosat
  python2 setup.py install --record files.txt --root="${pkgdir}"
  python3 setup.py install --record files.txt --root="${pkgdir}"
}

