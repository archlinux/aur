# Maintainer: Niklas Krafczyk <krafczyk.n at gmail dot com>
# Contributor: r7v
# Contributor: gilcu3
# Contributor: nickolai
pkgname=klee
pkgver=3.1
pkgrel=17
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
         'llvm16-libs'
         'klee-uclibc'
         'sqlite')
makedepends=('gperftools'
             'z3'
             'llvm16'
             'clang16'
             'cmake'
             'git')
checkdepends=('python-tabulate')
optdepends=()
provides=('klee=3.1')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/klee/klee.git#tag=v3.1"
        "git+https://github.com/google/googletest.git#tag=release-1.11.0") #Building from the repo so it's built with the same compiler as klee is
noextract=()
md5sums=('SKIP'
         'SKIP')
validpgpkeys=()

prepare() {
    cd "$srcdir/klee"
    mkdir -p "$srcdir/build"
    cd "$srcdir/build"
    cmake -DENABLE_TCMALLOC=ON \
          -DENABLE_UNIT_TESTS=ON \
          -DENABLE_SYSTEM_TESTS=ON \
          -DENABLE_POSIX_RUNTIME=ON \
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
          -DENABLE_UNIT_TESTS=ON \
          -DLLVM_DIR=/usr/lib/llvm16/lib/cmake/llvm \
          -DGOOGLETEST_VERSION=1.11.0 \
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
    make check
}
