# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=volk
pkgname=$_pkgname-git
pkgver=1.3.224.0.r19.gd0e41bf
pkgrel=1
pkgdesc="Meta loader for Vulkan API"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/zeux/volk"
license=('MIT')
groups=('vulkan-devel')
depends=('vulkan-headers' 'vulkan-icd-loader')
makedepends=('cmake' 'git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^sdk-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	if [[ $CC != clang* ]]; then
		CFLAGS+=" -ffat-lto-objects"
	fi
	cmake -S $_pkgname -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DVOLK_INSTALL=ON \
		-Wno-dev
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE.md
}
