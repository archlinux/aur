# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=zydis
pkgname=$_pkgname-git
pkgver=4.0.0.r0.g1ba75ae
pkgrel=1
pkgdesc="Fast and lightweight x86/x86-64 disassembler library"
arch=('x86_64')
url="https://zydis.re/"
license=('MIT')
depends=('glibc')
makedepends=('cmake' 'doxygen' 'git' 'ruby-ronn-ng' 'zycore-c>=1.4.1')
provides=("$_pkgname=$pkgver" 'libZydis.so')
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/zyantific/zydis.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S $_pkgname -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DZYAN_SYSTEM_ZYCORE=ON \
		-DZYDIS_BUILD_EXAMPLES=OFF \
		-DZYDIS_BUILD_MAN=ON \
		-DZYDIS_BUILD_SHARED_LIB=ON \
		-Wno-dev
	cmake --build build
}

package() {
	depends+=('libZycore.so')
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE
}
