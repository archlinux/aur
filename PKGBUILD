pkgname=cryptominisat4-git
pkgver=4.5.2.r17.ge365c73
pkgrel=1
pkgdesc="A modern, multi-threaded, feature-rich, simplifying SAT solver"
arch=('i686' 'x86_64')
url="http://www.msoos.org/cryptominisat4/"
license=('LGPL')
depends=('zlib' 'gcc-libs' 'boost-libs' 'intel-tbb')
makedepends=('python2' 'boost' 'xxd')
optdepends=('python2: python module')
conflicts=('cryptominisat4')
source=("$pkgname::git+https://github.com/msoos/cryptominisat.git")
md5sums=('SKIP')

# many fancy features requiring makedeps
# intel-tbb, python2, m4ri, libmysqlclient, valgrind

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    sed -i 's/python$/python2/' python/Makefile

    mkdir build
    cd build
    # options to play with:
    # -DUSE_TBB -DUSE_ZLIB -DUSE_MYSQL
    # NOMYSQL NOSTATS NOM4RI ENABLE_TESTING
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DNOM4RI=on -DALSO_BUILD_STATIC_LIB=False ../
    make
}

package() {
    cd "$srcdir/$pkgname"

    cd build
    make install DESTDIR="$pkgdir"

    # Rename cryptominisat to cryptominisat4
    mv "$pkgdir/usr/bin/cryptominisat" "$pkgdir/usr/bin/cryptominisat4"
    find "$pkgdir/usr/lib/cmake" -name "*.cmake" -exec sed -i 's/cryptominisat\b/cryptominisat4/g' "{}" \;

    # Remove references to the static library
    cmakedir="$pkgdir/usr/lib/cmake/cryptominisat4"
    sed -i "$cmakedir/cryptominisat4Targets-relwithdebinfo.cmake" \
        -e '/^list.*libcryptominisat4_static/d' \
        -e '/Import target "libcryptominisat4_static"/,/^$/d'
    sed -i "$cmakedir/cryptominisat4Targets.cmake" \
        -e '/Create imported target libcryptominisat4_static/,/^$/d' \
        -e 's/libcryptominisat4_static//g'
    sed -i "$cmakedir/cryptominisat4Config.cmake" \
        -e '/STATIC/d'

    # todo, tweak the build tools to respect DESTDIR
    cd py-lib
    python2 setup.py install --record files.txt --root="$pkgdir"
}
