# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=wasm-micro-runtime-git
_pkg="${pkgname%-git}"
pkgver=1.1.2.r32.gcadf9d0a
pkgrel=1
pkgdesc="Standalone WebAssembly (WASM) runtime with small footprint"
arch=('x86_64')
url="https://github.com/bytecodealliance/wasm-micro-runtime"
license=('Apache')
depends=('glibc')
makedepends=('cmake' 'git')
provides=('libiwasm.so' "$_pkg")
conflicts=("$_pkg")
source=("$_pkg::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/^WAMR-//;s/-/.r/;s/-/./'
}

build() {
	cmake \
		-B build \
		-S "$_pkg/product-mini/platforms/linux" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	cmake \
		-B build-lib \
		-S "$_pkg" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	cmake --build build
	cmake --build build-lib
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	DESTDIR="${pkgdir}" cmake --install build-lib
}
