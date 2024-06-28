# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: rpkak <rpkak@users.noreply.github.com>
pkgname=vulkan-memory-allocator
pkgver=3.1.0
pkgrel=2
pkgdesc="Easy to integrate Vulkan memory allocation library"
arch=('any')
url="https://gpuopen.com/vulkan-memory-allocator/"
license=('MIT')
groups=('vulkan-devel')
depends=('vulkan-headers')
makedepends=('cmake' 'doxygen' 'git')
source=("$pkgname::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git#tag=v$pkgver")
b2sums=('18c15f53b1f209a012c982d777b66c59a18fecef6f836fc3e8d7906c624c198c5df08524ec30d8d037d396e05666ddeedcb35c9b77ab75306abdda2af58896e7')

prepare() {
	cd $pkgname
	rm -r docs/html
	# https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator/pull/425
	git cherry-pick -n 257138b8f5686ae84491a3df9f90a77d5660c3bd
}

build() {
	cmake -B build -S $pkgname \
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
