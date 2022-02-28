# Maintainer: CoconutMacaroon <arch-aur@blastoffnetwork.org>
pkgname=clang-git
pkgver=r416361.fdfe26ddbeb1
pkgrel=1
pkgdesc="C language family frontend for LLVM"
arch=('x86_64')
url="https://clang.llvm.org/get_started.html"
license=('custom:Apache 2.0 with LLVM Exception')
depends=('libxml2' 'libedit' 'perl' 'python')
# Python would be required to run tests, but we aren't doing that here
makedepends=('git' 'cmake' 'zlib' 'ccache')
optdepends=('openmp: OpenMP support in clang with -fopenmp'
            'python: for scan-view and git-clang-format'
            'llvm: referenced by some clang headers')
provides=("clang-analyzer=$pkgver" "clang-tools-extra=$pkgver" 'clang')
conflicts=('clang-analyzer' 'clang-tools-extra' 'clang')
replaces=('clang-analyzer' 'clang-tools-extra')
source=(
    'llvm-project::git+https://github.com/llvm/llvm-project#branch=main'
)

md5sums=('SKIP')
pkgver() {
	cd "$srcdir/llvm-project"
    # Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/llvm-project"
	# if the build directory doesn't exist, create it
	[ -d build ] || mkdir build
	cd build
	#cmake -DLLVM_ENABLE_PROJECTS='clang;clang-tools-extra' -DLLVM_TARGETS_TO_BUILD=X86 -DCMAKE_BUILD_TYPE=Release -G "Unix Makefiles" ../llvm
	cmake -DCMAKE_INSTALL_PREFIX='/usr'\
	      -DLLVM_ENABLE_PROJECTS='clang;clang-tools-extra'\
	      -DLLVM_CCACHE_BUILD=ON\
	      -DLLVM_TARGETS_TO_BUILD=X86\
	      -DCMAKE_BUILD_TYPE=Release\
	      -DCMAKE_C_FLAGS_RELEASE="${CFLAGS} ${CPPFLAGS}"\
	      -DCMAKE_CXX_FLAGS_RELEASE="${CXXFLAGS} ${CPPFLAGS}"\
	      -G "Unix Makefiles"\
	      ../llvm
	make clang
}

package() {
    cd "$srcdir/llvm-project"
	install -Dm644 ./clang/LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	cd "$srcdir/llvm-project/build"
	make DESTDIR="$pkgdir/" install
    # Move analyzer scripts out of /usr/libexec
    mv "$pkgdir"/usr/libexec/* "$pkgdir/usr/lib/clang/"
    rmdir "$pkgdir/usr/libexec"
    sed -i 's|libexec|lib/clang|' \
        "$pkgdir/usr/bin/scan-build"
}
