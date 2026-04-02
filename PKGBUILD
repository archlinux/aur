# Maintainer: wadledee <wadledee@pm.me>
pkgname="hyprsysteminfo"
pkgver=0.1.3
pkgrel=5
pkgdesc="A tiny qt6/qml application to display information about the running system"
arch=(x86_64 aarch64)
url="https://github.com/hyprwm/hyprsysteminfo"
license=('BSD-3-Clause')
depends=('hyprutils' 'hyprland-qt-support' 'qt6-wayland')
makedepends=('cmake')
source=(
	"https://github.com/hyprwm/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
	'fix-qt6-wayland-private-find.patch'
	'hyprsysteminfo-rebuild.hook'
)
conflicts=("${pkgname}-git")
sha256sums=(
	'359298d926e0a9ec670ff5b5100c1d08392a85126ea1d8f89f723d634fd218ce'
	'5c670fa9ae498514954f751c6e4280351f31ee69ade8d3bf0a7bf4c82abfb9cf'
	'13799f1b38d0e16da329b9cd8c8c21478bfc4b69a915ab0002bb1bac1fca4bbe'
)

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -Np1 -i "${srcdir}/fix-qt6-wayland-private-find.patch"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cmake --no-warn-unused-cli \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-S . \
		-B build
	cmake --build build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	DESTDIR="${pkgdir}" cmake --install build

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/hyprsysteminfo-rebuild.hook" \
		"${pkgdir}/usr/share/doc/${pkgname}/examples/hyprsysteminfo-rebuild.hook"
}
