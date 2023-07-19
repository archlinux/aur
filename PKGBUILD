# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: rpkak <rpkak@users.noreply.github.com>
pkgname=vulkan-memory-allocator
pkgver=3.0.1.r103.g33067f6
pkgrel=1
pkgdesc="Easy to integrate Vulkan memory allocation library"
arch=('any')
url="https://gpuopen.com/vulkan-memory-allocator/"
license=('MIT')
groups=('vulkan-devel')
depends=('vulkan-headers')
makedepends=('cmake' 'doxygen' 'git')
_commit=33067f6b4f735db97c97660e46620266eebcf7de
source=("$pkgname::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
	cd $pkgname
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $pkgname
	rm -r docs/html
	sed -i "/doc_doxygen/i install(DIRECTORY docs/ DESTINATION share/doc/$pkgname)" CMakeLists.txt
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
