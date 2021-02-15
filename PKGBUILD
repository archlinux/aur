# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Shader script tester for Vulkan'
pkgname=vkrunner-git
pkgver=r372.1b4cc6b
pkgrel=1
url=https://github.com/Igalia/vkrunner
arch=(x86_64)
license=(custom)
conflicts=(vkrunner)
provides=(vkrunner)
depends=(glslang)
makedepends=(cmake git vulkan-headers)
source=("${pkgname}::git+${url}")
sha512sums=(SKIP)

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare () {
	mkdir -p _build
}

build () {
	cd _build
	cmake \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		"../${pkgname}"
	cmake --build .
}

package () {
	DESTDIR="${pkgdir}" cmake --build _build --target install
	install -Dm644 "${pkgname}/COPYING" \
		"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	install -Dm644 "${pkgname}/README.md" \
		"${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
