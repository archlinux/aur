# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>

_pkgbase=vk-gl-cts
pkgname='opengl-cts'
pkgver=4.6.8.1
pkgrel=1
arch=('any')
pkgdesc='Khronos OpenGL and OpenGL ES Conformance Tests.'
url="https://github.com/KhronosGroup/VK-GL-CTS"
license=('Apache-2.0')
depends=(
	opengl-driver
	zlib
	libpng
)

makedepends=(
	git
	python
	cmake
	gcc
)
optdepends=(
	mesa
	"wayland-protocols: DEQP_TARGET=default"
)

source=(
	"${url}/archive/refs/tags/opengl-cts-${pkgver}.tar.gz"
)
sha256sums=(
    '30127b2783058941b4ce89326e96a1a75e9107461c1d3bfcec129e6cf57a2638'
)

prepare() {
	cd ${_pkgbase^^}-${pkgname}-${pkgver}
	python3 external/fetch_sources.py
	cmake -B build -DDEQP_TARGET=x11_egl_glx .
}

build() {
	cd ${_pkgbase^^}-${pkgname}-${pkgver}/build
	cmake --build external/openglcts -j
}

package() {
	cd ${_pkgbase^^}-${pkgname}-${pkgver}/build
	install -Dm755 /dev/stdin ${pkgdir}/usr/bin/gl-cts-runner <<EOF
#! /usr/bin/bash
cd /usr/lib/openglcts
./cts-runner --logdir="\$HOME" "\$@"
EOF
	install -D external/openglcts/modules/cts-runner ${pkgdir}/usr/lib/openglcts/cts-runner
	install -D external/openglcts/modules/glcts ${pkgdir}/usr/lib/openglcts/glcts
	cp -r external/openglcts/modules/gl* ${pkgdir}/usr/lib/openglcts/
	rm -rf ${pkgdir}/usr/lib/openglcts/*/{CMakeFiles,*cmake,*.a,Makefile}
	install -D ../external/openglcts/README.md ${pkgdir}/usr/share/openglcts/README.md
	cp -r ../external/openglcts/docs/specs ${pkgdir}/usr/share/openglcts/
}
