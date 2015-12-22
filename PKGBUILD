# Maintainer: Eduardo Sánchez Muñoz

pkgname=cling-git
pkgver=r2795.7644a68
pkgrel=1
pkgdesc="Interactive C++ interpreter built on the top of LLVM and Clang libraries."
arch=('i686' 'x86_64')
url="https://root.cern.ch/cling"
license=('custom:Cling Release License')
depends=('libffi')
makedepends=('cmake' 'libffi' 'git' 'python2')
options=()
conflicts=()
provides=()
source=("llvm::git+http://root.cern.ch/git/llvm.git#branch=cling-patches"
	"clang::git+http://root.cern.ch/git/clang.git#branch=cling-patches"
	"cling::git+http://root.cern.ch/git/cling.git#branch=master")
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/cling"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
	if [ ! -h "$srcdir/llvm/tools/clang" ]; then
		ln -s "$srcdir/clang" "$srcdir/llvm/tools/clang"
	fi
	
	if [ ! -h "$srcdir/llvm/tools/cling" ]; then
		ln -s "$srcdir/cling" "$srcdir/llvm/tools/cling"
	fi
}

build() {
	mkdir -p "$srcdir/cling-build"
	cd "$srcdir/cling-build"
	
	cmake \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX="/opt/cling" \
		-DLLVM_TARGETS_TO_BUILD="host" \
		-DLLVM_BUILD_LLVM_DYLIB=OFF \
		-DLLVM_ENABLE_RTTI=ON \
		-DLLVM_ENABLE_FFI=ON \
		-DLLVM_BUILD_DOCS=OFF \
		-DLLVM_ENABLE_SPHINX=OFF \
		-DLLVM_ENABLE_DOXYGEN=OFF \
		-DFFI_INCLUDE_DIR=$(pkg-config --cflags-only-I libffi | cut -c3-) \
		-DCMAKE_CXX_FLAGS="-D_GLIBCXX_USE_CXX11_ABI=0" \
		"$srcdir/llvm"
	
	make -C tools/clang
	make -C tools/cling
}

package() {
	cd "$srcdir/cling-build"
	make -C tools/clang DESTDIR="$pkgdir" install
	make -C tools/cling DESTDIR="$pkgdir" install
	
	install -d "$pkgdir/usr/bin"
	ln -s "/opt/cling/bin/cling" "$pkgdir/usr/bin/cling"
	
	install -Dm644 "$srcdir/llvm/tools/cling/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
