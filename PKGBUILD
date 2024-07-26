# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
pkgname=terra
pkgver=1.2.0
pkgrel=1
pkgdesc="Low-level system programming language"
arch=('x86_64')
url="https://terralang.org/"
license=('MIT')
makedepends=('ninja' 'cmake' 'python')
_git='https://github.com/terralang/terra'
_llvm='https://github.com/llvm/llvm-project'
_llvm_ver=18.1.8
source=("$pkgname-$pkgver.tar.gz::$_git/archive/refs/tags/release-$pkgver.tar.gz"
				"$pkgname-llvm-$_llvm_ver.tar.xz::$_llvm/releases/download/llvmorg-$_llvm_ver/llvm-project-$_llvm_ver.src.tar.xz")
b2sums=('a2921f7ab0bf85181cdb2a8a2c8eaa50bcf93853eeb0c485e9cfeb5fd456afa99950c4a338b67f4b56531c62f8ebafd75f6cc859b887b4a02bf55aa3943c6f29'
        'a950492f1dbfb874dff63b1ffef86468169ba2f211a9733ec2d4cf30040f7f277ef00f048bb44dee9f97d7d762f0f241f19e5a2a7b0b49217d3821ddfc8c354f')
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
