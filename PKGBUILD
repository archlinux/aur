# Maintainer: Eduardo Sánchez Muñoz

pkgname=(cling-git cling-jupyter-git)
pkgver=r2889.bb7b609
pkgrel=1
pkgdesc="Interactive C++ interpreter built on the top of LLVM and Clang libraries."
arch=('i686' 'x86_64')
url="https://root.cern.ch/cling"
license=('custom:Cling Release License')
makedepends=('cmake' 'libffi' 'git' 'python' 'python2' 'jupyter')
source=("llvm::git+http://root.cern.ch/git/llvm.git#branch=cling-patches"
	"clang::git+http://root.cern.ch/git/clang.git#branch=cling-patches"
	"cling::git+http://root.cern.ch/git/cling.git#branch=master"
	"cling-jupyter-path.diff")
sha256sums=('SKIP'
	    'SKIP'
	    'SKIP'
	    '9569ca1bfc0b675c86f51904de96ed47254490f7f9ba6bc8540210f9269898a9')

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
	
	cd "$srcdir/cling"
	git apply "$srcdir/cling-jupyter-path.diff"
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

package_cling-git() {
	depends=('libffi')
	
	cd "$srcdir/cling-build"
	make -C tools/clang DESTDIR="$pkgdir" install
	make -C tools/cling DESTDIR="$pkgdir" install
	
	install -d "$pkgdir/usr/bin"
	ln -s "/opt/cling/bin/cling" "$pkgdir/usr/bin/cling"
	
	install -Dm644 "$srcdir/llvm/tools/cling/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_cling-jupyter-git() {
	depends=('cling-git' 'jupyter')
	
	cd "$srcdir/cling/tools/Jupyter/kernel"
	python3 setup.py install --prefix=/usr --root="$pkgdir"
	jupyter-kernelspec install --prefix="$pkgdir/usr" cling
}
