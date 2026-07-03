# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>

_pkgbase=vk-gl-cts
pkgname='vulkan-cts'
pkgver=1.4.6.1
pkgrel=1
arch=('any')
pkgdesc='Khronos Vulkan Conformance Tests'
url="https://github.com/KhronosGroup/VK-GL-CTS"
license=('Apache-2.0')
depends=(
	vulkan-driver
	libpng
)

makedepends=(
	python-lxml
	git
	cmake
	gcc
	wayland-protocols
)
optdepends=(
)

source=(
	"git+${url}.git#tag=vulkan-cts-${pkgver}"
)
sha256sums=(
	'SKIP'
)

prepare() {
	cd ${_pkgbase^^}
	python3 external/fetch_sources.py
#	python3 external/fetch_video_decode_samples.py
	git status >git-status.txt
	cmake -B build -DCMAKE_BUILD_TYPE=Release -DDEQP_TARGET=wayland .
}

build() {
	cd ${_pkgbase^^}/build
	_p=$((`nproc` / 2 +1 ))
	make -j${_p}
}

package() {
	cd ${_pkgbase^^}
	install -Dm644 external/vulkancts/README.md ${pkgdir}/usr/share/vulkancts/README.md
	git log --first-parent "vulkan-cts-${pkgver}^..HEAD" >${pkgdir}/usr/share/vulkancts/git-log.txt
	cp -r external/vulkancts/{doc,mustpass} ${pkgdir}/usr/share/vulkancts/
	install git-status.txt ${pkgdir}/usr/share/vulkancts/git-status.txt
	
	cd build/external/vulkancts/modules/vulkan
	install -Dm755 /dev/stdin ${pkgdir}/usr/bin/deqp-vk <<EOF
#! /usr/bin/bash
## usage: deqp-vk --deqp-log-filename=$HOME/TestResults.qpa
/usr/lib/vulkancts/deqp-vk --deqp-archive-dir=/usr/lib/vulkancts "\$@"
EOF
	install -D deqp-vk ${pkgdir}/usr/lib/vulkancts/deqp-vk
	install -D deqp-vksc ${pkgdir}/usr/lib/vulkancts/deqp-vksc
	cp -r vk-default ${pkgdir}/usr/lib/vulkancts/
	cp -r vulkan ${pkgdir}/usr/lib/vulkancts/
	cp -r *.a ${pkgdir}/usr/lib/vulkancts/
}
