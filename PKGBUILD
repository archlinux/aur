# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>

_pkgbase=vk-gl-cts
pkgname='vulkan-cts'
pkgver=1.4.5.1
pkgrel=1
arch=('any')
pkgdesc='Khronos Vulkan Conformance Tests'
url="https://github.com/KhronosGroup/VK-GL-CTS"
license=('Apache-2.0')
depends=(
	vulkan-driver
	zlib
	libpng
)

makedepends=(
	git
	python-lxml
	cmake
	gcc
	wayland-protocols
)
optdepends=(
#	"wayland-protocols: DEQP_TARGET=wayland"
)

source=(
	"${url}/archive/refs/tags/vulkan-cts-${pkgver}.tar.gz"
)
sha256sums=('SKIP'
)

prepare() {
	cd ${_pkgbase^^}-${pkgname}-${pkgver}
	python3 external/fetch_sources.py
#	python3 external/fetch_video_decode_samples.py
	cmake -B build -DCMAKE_BUILD_TYPE=Release -DDEQP_TARGET=wayland .
}

build() {
	cd ${_pkgbase^^}-${pkgname}-${pkgver}/build
	#cmake --build external/vulkancts --parallel
	_p=$(((`nproc` / 3 +1 )))
	make -j${_p}
}

package() {
	cd ${_pkgbase^^}-${pkgname}-${pkgver}/build
	install -d ${pkgdir}/usr/bin
	ln -s /usr/lib/vulkancts/deqp-vk ${pkgdir}/usr/bin/deqp-vk
	## usage: deqp-vk --deqp-log-filename=$HOME/TestResults.qpa
	install -D external/vulkancts/modules/vulkan/deqp-vk ${pkgdir}/usr/lib/vulkancts/vulkan/deqp-vk
	cp -r external/vulkancts/modules/vulkan/* ${pkgdir}/usr/lib/vulkancts/
	rm -rf ${pkgdir}/usr/lib/vulkancts/{.,*}/{CMakeFiles,*cmake,*.a,Makefile}
	install -D ../external/vulkancts/README.md ${pkgdir}/usr/share/vulkancts/README.md
	cp -r ../external/vulkancts/doc ${pkgdir}/usr/share/vulkancts/
}
