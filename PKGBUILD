# Maintainer: Niklas Krafczyk <krafczyk.n at gmail dot com>
pkgname=klee
pkgver=2.1
pkgrel=6
epoch=
pkgdesc="Symbolic virtual machine built on top of the LLVM compiler infrastructure"
arch=('x86_64')
url="https://klee.github.io/"
license=('custom:UIUC')
groups=()
depends=('gperftools'
         'z3'
         'libcap'
         'python'
         'llvm-libs>=3.8'
         'klee-uclibc'
         'sqlite')
makedepends=('llvm>=3.8'
             'clang'
             'cmake'
             'git')
checkdepends=('python-tabulate')
optdepends=()
provides=('klee=2.1')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
#source=("git+https://github.com/klee/klee.git#tag=v2.1"
source=("git+https://github.com/klee/klee.git#commit=de471397338640df8ff792dab6d04c1a9a798d8c"
        "git+https://github.com/google/googletest.git") #Building from the repo so it's built with the same compiler as klee is
noextract=()
md5sums=('SKIP'
         'SKIP')
validpgpkeys=()

prepare() {
    mkdir -p "$srcdir/build"
    cd "$srcdir/build"
    cmake -DENABLE_TCMALLOC=ON \
          -DENABLE_UNIT_TESTS=ON \
          -DENABLE_SYSTEM_TESTS=ON \
          -DENABLE_POSIX_RUNTIME=ON \
          -DENABLE_KLEE_UCLIBC=ON \
          -DKLEE_UCLIBC_PATH="/usr/share/klee-uclibc/usr" \
          -DENABLE_SOLVER_Z3=ON \
          -DENABLE_SOLVER_STP=OFF \
          -DENABLE_SOLVER_METASMT=OFF \
          -DCMAKE_INSTALL_PREFIX="/usr" \
          -DCMAKE_INSTALL_LIBDIR="/usr/lib" \
          -DCMAKE_BUILD_TYPE=Release \
          -DGTEST_SRC_DIR="$srcdir/googletest/googletest" \
          -DENABLE_UNIT_TESTS=ON \
          -DENABLE_SYSTEM_TESTS=ON \
          "$srcdir/$pkgname"
}

build() {
    cd "$srcdir/build"
    make $MAKEFLAGS
}

package() {
	cd "$srcdir/build"
	make DESTDIR="$pkgdir/" install
    install -Dm644 "$srcdir/$pkgname/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

check() {
    cd "$srcdir/build"
    make systemtests
}
