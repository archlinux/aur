# Maintainer: Evgeniy Tsvigun <utgarda@gmail.com>
pkgname=llvm4+clang+wasm
pkgver=4.0.1
pkgrel=1
epoch=
pkgdesc="A collection of modular and reusable compiler and toolchain technologies"
arch=('i686' 'x86_64')
url="http://llvm.org/"
license=('NCSA', 'MIT')
groups=()
depends=('gcc-libs' 'zlib' 'libffi' 'libedit' 'ncurses' 'perl' 'gcc' 'libxml2')
makedepends=('cmake' 'python' 'libffi')
checkdepends=()
optdepends=()
provides=()
conflicts=('llvm' 'llvm39' 'llvm35' 
	   'llvm-libs' 'llvm39-libs' 'llvm35-libs' 
	   'clang' 'clang39' 'clang35')
replaces=()
backup=()
options=('staticlibs')
install=
changelog=
source=(http://releases.llvm.org/$pkgver/llvm-$pkgver.src.tar.xz{,.sig}
	https://releases.llvm.org/$pkgver/cfe-$pkgver.src.tar.xz{,.sig})
noextract=()
md5sums=('a818e70321b91e2bb2d47e60edd5408f' 'SKIP'
	 'a6c7b3e953f8b93e252af5917df7db97' 'SKIP')
#validpgpkeys=('8F0871F202119294')
validpgpkeys=('11E521D646982372EB577A1F8F0871F202119294')

prepare() {
	cd llvm-${pkgver}.src
	mkdir -p build
	mv "$srcdir/cfe-$pkgver.src" tools/clang
}
build() {
	cd llvm-${pkgver}.src/build
	cmake \
	  -DCMAKE_BUILD_TYPE=Release \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DLLVM_BINUTILS_INCDIR=/usr/include \
	  -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=WebAssembly \
	  -DLLVM_BUILD_LLVM_DYLIB=ON \
	  -DLLVM_LINK_LLVM_DYLIB=ON \
	  -DLLVM_INSTALL_UTILS=ON \
	  -DLLVM_ENABLE_RTTI=ON \
	  -DLLVM_ENABLE_FFI=ON \
	  -DLLVM_BUILD_TESTS=OFF \
	  -DLLVM_BUILD_DOCS=OFF \
	  -DLLVM_ENABLE_DOXYGEN=OFF \
	  -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
	  ..
	cmake --build . -- -j3
}

package() {
	cd llvm-${pkgver}.src/build
	make DESTDIR="$pkgdir/" install
	install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
