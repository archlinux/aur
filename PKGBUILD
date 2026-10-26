# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: rpkak <rpkak@users.noreply.github.com>
pkgname=vulkan-memory-allocator
pkgver=3.5.0
pkgrel=1
pkgdesc="Easy to integrate Vulkan memory allocation library"
arch=('any')
url="https://gpuopen.com/vulkan-memory-allocator/"
license=('MIT')
groups=('vulkan-devel')
depends=('vulkan-headers')
makedepends=('cmake' 'doxygen' 'git')
source=("$pkgname::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git#tag=v$pkgver")
b2sums=('49b5581a26627ddf9388108c4fd2001ffb9c638f298bc8b9615d8374a2d0978e8c053215c1987436cc8610b1f99b5a1d870e827e75c2c28b015dbaaaf56a4d31')

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
