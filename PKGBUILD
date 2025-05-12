# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: rpkak <rpkak@users.noreply.github.com>
pkgname=vulkan-memory-allocator
pkgver=3.3.0
pkgrel=1
pkgdesc="Easy to integrate Vulkan memory allocation library"
arch=('any')
url="https://gpuopen.com/vulkan-memory-allocator/"
license=('MIT')
groups=('vulkan-devel')
depends=('vulkan-headers')
makedepends=('cmake' 'doxygen' 'git')
source=("$pkgname::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git#tag=v$pkgver")
b2sums=('9a4b31f0ba03da19f9de08224b7a5a3a8956f713d9ff1723cebf7404427f16c3562944c5e22222eb18ae7a1902ba1f71c759171062edc7eb06a35c82e0316742')

prepare() {
	cd $pkgname
	rm -r docs/html
}

build() {
	local options=(
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_INSTALL_PREFIX=/usr
		-D VMA_BUILD_DOCUMENTATION=ON
		-Wno-dev
	)
	cmake "${options[@]}" -B build -S $pkgname
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $pkgname/LICENSE.txt
}
