# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: rpkak <rpkak@users.noreply.github.com>
pkgname=vulkan-memory-allocator
pkgver=3.4.0
pkgrel=1
pkgdesc="Easy to integrate Vulkan memory allocation library"
arch=('any')
url="https://gpuopen.com/vulkan-memory-allocator/"
license=('MIT')
groups=('vulkan-devel')
depends=('vulkan-headers')
makedepends=('cmake' 'doxygen' 'git')
source=("$pkgname::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git#tag=v$pkgver")
b2sums=('cb3a1c0ec59c67c457da44de7d92055c4a548a50544a81ca514cd115080fd13c996db73e55fb70ff1aa2febc7bab34566fcf454a43b55ec06302f1b9f3dfdbd0')

prepare() {
	cd $pkgname
	rm -r docs/html
}

build() {
	local options=(
		-B build
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_INSTALL_PREFIX=/usr
		-D VMA_BUILD_DOCUMENTATION=ON
		-W no-dev
	)
	cmake "${options[@]}" $pkgname
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $pkgname/LICENSE.txt
}
