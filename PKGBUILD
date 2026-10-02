# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
pkgname=terra
pkgver=1.2.2
pkgrel=1
pkgdesc="Low-level system programming language"
arch=('x86_64')
url="https://terralang.org/"
license=('MIT')
makedepends=('ninja' 'cmake' 'python')
_git='https://github.com/terralang/terra'
_llvm='https://github.com/llvm/llvm-project'
_llvm_ver=22.1.8
source=("$pkgname-$pkgver.tar.gz::$_git/archive/refs/tags/release-$pkgver.tar.gz"
				"$pkgname-llvm-$_llvm_ver.tar.xz::$_llvm/releases/download/llvmorg-$_llvm_ver/llvm-project-$_llvm_ver.src.tar.xz")
b2sums=('2cd6c103da0986b5536c6be74a6fe2fdc3cc4026d6e539887fe9d5c4acf33f424a0a1e2b30a93a66b0c651cdfe9d5f1853ef2ac6d72a50fb3e0d8680f8756a6e'
        '092204f62e0f0364a041c737eb2c25fd073cb5689663d6ccd5a9e4e1743d6d80822360d59b64bff7b4d7872a68a79e899bf2f75f384e55c7d313a79243576f03')
# Arch's default build flags cause terra to crash. Remove them until we find a fix.
options=(!lto !buildflags)

build() {
	local llvm_args=(
		-Wno-dev
		-G Ninja
		-B llvm-build
		-S "llvm-project-$_llvm_ver.src/llvm"
		-D CMAKE_INSTALL_PREFIX=/usr
		-D CMAKE_BUILD_TYPE=Release
		-D LLVM_ENABLE_PROJECTS=clang
		-D LLVM_ENABLE_TERMINFO=OFF
		-D LLVM_ENABLE_LIBEDIT=OFF
		-D LLVM_ENABLE_ZLIB=OFF
		-D LLVM_ENABLE_ZSTD=OFF
		-D LLVM_ENABLE_LIBXML2=OFF
		-D LLVM_ENABLE_ASSERTIONS=OFF
	)
	# Minimal debug info
	CFLAGS+=" -g1"
	CXXFLAGS+=" -g1"
	cmake "${llvm_args[@]}"
	ninja -C llvm-build
	DESTDIR="$srcdir/deps" ninja -C llvm-build install
	
	local cmake_args=(
		-Wno-dev
		-G Ninja
		-B build
		-S "$pkgname-release-$pkgver"
		-D CMAKE_PREFIX_PATH="$srcdir/deps/usr/lib/cmake"
		-D CMAKE_INSTALL_PREFIX=/usr
		-D TERRA_STATIC_LINK_LLVM=ON
		-D TERRA_SLIB_INCLUDE_LLVM=OFF
		-D TERRA_STATIC_LINK_LUAJIT=ON
		-D TERRA_SLIB_INCLUDE_LUAJIT=ON
	)
	cmake "${cmake_args[@]}"
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
	install -Dm644 "$pkgname-release-$pkgver"/release/share/terra/README.md "$pkgdir"/usr/share/licenses/$pkgname/README
}
