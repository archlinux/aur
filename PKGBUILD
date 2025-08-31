# Maintainer: yuioto <yuiotochan@outlook.com>

pkgname=wiliwili-git
_pkg=wiliwili
pkgver=v1.5.2.r0.g6ec18248
pkgrel=1
pkgdesc='A 3rd party bilibili client'
url="https://github.com/xfangfang/wiliwili"
license=('GPL-3.0-only')
# Some arches are not tested and may not work properly.
# they are untested and may not compile.
arch=('x86_64' 'i386' 'aarch64' 'armv7h' 'riscv64' 'loong64')
# This program should run on any platform that supports C++17, OpenGL(ES)2.0+, ffmpeg platform.
# arch=('any')
provides=("$_pkg")
conflicts=("$_pkg" "$_pkg-bin")
# 'pacman' is core package 'base' depends.
# 'curl' is depends, but package 'pacman' depends include it.
# 'zlib' is depends, but package 'mpv' depends include it.
# 'libwebp' is show webp extra.
depends=('mpv' 'libwebp')
makedepends=('git' 'cmake' 'gcc' 'libxinerama' 'libxi')

# options("name")

source=("${_pkg}::git+$url.git"
	"linux-auto-dark.patch")
sha256sums=('SKIP'
            '632deaddab2ebceee82cb1c7a3cd22d0924cd187fb6a66f8b9556a9a01c7a3ea')

pkgver() {
	cd "$_pkg"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "$_pkg"
	git submodule update --init --recursive

	cd "$srcdir/wiliwili/library/borealis"
	patch -p1 < "$srcdir/linux-auto-dark.patch"
}

build() {
	# If you want to use Debug mode, deleate -DCMAKE_BUILD_TYPE=Releas
	# If you don't want to use system library, deleate -USE-SHARED-LIB=ON
	# and -D USE_SYSTEM_CURL=ON -D USE_SYSTEM_OPENCC=ON -D USE_SYSTEM_PYSTRING=ON
	cmake \
		-B build \
		-S "$_pkg" \
		-D CMAKE_INSTALL_PREFIX:PATH='/usr' \
		-D PLATFORM_DESKTOP=ON \
		-D INSTALL=ON \
		-D CMAKE_BUILD_TYPE=Release \
		-D USE_SYSTEM_CURL=ON \
		-D GLFW_BUILD_WAYLAND=ON \
		-D GLFW_BUILD_X11=ON \
		-Wno-dev
	cmake --build build --parallel $(nproc)
}

package() {
	# main
	DESTDIR="${pkgdir}" cmake --install "build"
}

