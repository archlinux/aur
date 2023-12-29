# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
pkgname=terra
pkgver=1.1.1
pkgrel=2
pkgdesc="Low-level system programming language"
arch=('x86_64')
url="https://terralang.org/"
license=('MIT')
makedepends=('ninja' 'cmake' 'python')
_git='https://github.com/terralang/terra'
_llvm='https://github.com/llvm/llvm-project'
_llvm_ver=16.0.6
source=("$pkgname-$pkgver.tar.gz::$_git/archive/refs/tags/release-$pkgver.tar.gz"
				"$pkgname-llvm-$_llvm_ver.tar.xz::$_llvm/releases/download/llvmorg-$_llvm_ver/llvm-project-$_llvm_ver.src.tar.xz")
b2sums=('70d6b3c83c5b3999a690d96f606331e8aa90da61ef4f263fc7fbc6e007ed190feedb8a59e7ecf968ae0edb872d11788ed05438f18ab6a2dece2900462bfd9b1c'
        '95192d39cbd2914e5609db365965f1c00bfea6c2d653b3996bd2acef8a2b37e37f6fc8a9d2b65711ad72657e0ef52c42f733053cf65051e7822f27396c30406d')
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
		-D TERRA_SLIB_INCLUDE_LLVM=ON
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
