# Maintainer: Niklas Krafczyk <krafczyk.n at gmail dot com>
# Contributor: r7v
pkgname=klee
pkgver=2.2
pkgrel=10
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
makedepends=('gperftools'
             'z3'
             'llvm>=3.8'
             'clang'
             'cmake'
             'git')
checkdepends=('python-tabulate')
optdepends=()
provides=('klee=2.2')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
#source=("git+https://github.com/klee/klee.git#tag=v2.2"
source=("git+https://github.com/klee/klee.git#commit=5719d2803e93252e5d4613f43afc7db0d72332f1"
        "git+https://github.com/google/googletest.git#tag=release-1.10.0") #Building from the repo so it's built with the same compiler as klee is
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
