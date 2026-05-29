# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=vulkan-low-latency-layer-git
pkgver=0.2.0.r0.g4e7fe12
pkgrel=1
pkgdesc="Vulkan layer for hardware agnostic input latency reduction"
arch=('x86_64')
url="https://github.com/Korthos-Software/low_latency_layer"
license=('MIT')
depends=('glibc' 'libstdc++' 'libgcc')
makedepends=('vulkan-headers' 'vulkan-utility-libraries' 'git' 'cmake' 'ninja'
	     'shaderc' 'glslang')
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("${pkgname::-4}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname::-4}"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

prepare() {
	cd "$srcdir/${pkgname::-4}"

}

build() {
	cd "$srcdir"
	cmake -B build -S ${pkgname::-4} -GNinja \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG" \
	-DCMAKE_INSTALL_PREFIX=/usr

	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 "$srcdir/${pkgname::-4}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "$srcdir/${pkgname::-4}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
