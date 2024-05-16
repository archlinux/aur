# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: rpkak <rpkak@users.noreply.github.com>
pkgname=vulkan-memory-allocator
pkgver=3.0.1.r165.geaf8fc2
pkgrel=1
pkgdesc="Easy to integrate Vulkan memory allocation library"
arch=('any')
url="https://gpuopen.com/vulkan-memory-allocator/"
license=('MIT')
groups=('vulkan-devel')
depends=('vulkan-headers')
makedepends=('cmake' 'doxygen' 'git')
_commit=eaf8fc27eeadf6f21b11183651b829e897f01957
source=("$pkgname::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git#commit=$_commit")
b2sums=('405efdffb8caf885c07d8305ff90a13f0c96b2ca2193d4ae025088a2f30dabbc1324083be679ddcf20e5e2b42fafbf3517dabc0056e1efbc08d8d6eacf7a7ecf')

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
