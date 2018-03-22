# Maintainer: Niklas Krafczyk <krafczyk.n at gmail dot com>
pkgname=klee
pkgver=1.4.0
pkgrel=4
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
         'llvm-libs>=5.0')
makedepends=('llvm>=5.0.1-2'
             'clang'
             'cmake'
             'git')
checkdepends=()
optdepends=()
provides=('klee=1.4.0-1'
          'klee-uclibc')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/jirislaby/klee.git#branch=llvm_50"
        "git+https://github.com/klee/klee-uclibc.git"
        "llvm_6.0.patch")
noextract=()
md5sums=('SKIP'
         'SKIP'
         '45bbe884565b7cede2a84f8e8d9edcde')
validpgpkeys=()

prepare() {
    mkdir -p "build"
    cd "$srcdir/klee"
    patch -p1 -i "$srcdir/llvm_6.0.patch"
}

build() {
	cd "$srcdir/klee-uclibc"
    ./configure --make-llvm-lib
	make -j$(nproc)
    cd "$srcdir/build"
    cmake -DENABLE_TCMALLOC=ON \
          -DENABLE_UNIT_TESTS=OFF \
          -DENABLE_SYSTEM_TESTS=OFF \
          -DENABLE_POSIX_RUNTIME=ON \
          -DENABLE_KLEE_UCLIBC=ON \
          -DKLEE_UCLIBC_PATH="$srcdir/klee-uclibc" \
          -DENABLE_SOLVER_Z3=ON \
          -DENABLE_SOLVER_STP=OFF \
          -DCMAKE_INSTALL_PREFIX="/usr" \
          -DCMAKE_INSTALL_LIBDIR="/usr/lib" \
          "$srcdir/$pkgname"
    make -j$(nproc)
}

package() {
	cd "$srcdir/build"
	make DESTDIR="$pkgdir/" install
    install -Dm644 "$srcdir/$pkgname/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
