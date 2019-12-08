# Maintainer: Niklas Krafczyk <krafczyk.n at gmail dot com>
pkgname=klee
pkgver=2.1_pre
pkgrel=3
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
         'llvm-libs>=3.4'
         'klee-uclibc'
         'python-tabulate'
         'sqlite')
makedepends=('llvm>=3.4'
             'clang'
             'cmake'
             'git')
checkdepends=()
optdepends=()
provides=('klee=2.0')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
#source=("git+https://github.com/klee/klee.git#tag=v2.0"
source=("git+https://github.com/klee/klee.git#commit=0de67b9f0c3f7f331f873f19561aef311d2bed4a"
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
    make -j$(nproc)
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
