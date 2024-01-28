# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: rpkak <rpkak@users.noreply.github.com>
pkgname=vulkan-memory-allocator
pkgver=3.0.1.r147.g94b1aca
pkgrel=1
pkgdesc="Easy to integrate Vulkan memory allocation library"
arch=('any')
url="https://gpuopen.com/vulkan-memory-allocator/"
license=('MIT')
groups=('vulkan-devel')
depends=('vulkan-headers')
makedepends=('cmake' 'doxygen' 'git')
_commit=94b1acaef0d1fa6f721559a5f0f3ee31d5efba00
source=("$pkgname::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
	cd $pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	rm -r $pkgname/docs/html
}

build() {
	cmake -S $pkgname -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DVMA_BUILD_DOCUMENTATION=ON \
		-Wno-dev
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $pkgname/LICENSE.txt
}
