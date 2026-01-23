# Maintainer: Martin Rys <https://rys.rs/contact>

pkgbase=vtracer
pkgname=(
	vtracer
	python-vtracer
)
# [2025-07-23]: The version is actually 0.6.11 but the GitHub releases vs tags vs actual file version(==PyPI version) is all over the place
#               Sent an email off to the maintainer about it
pkgver=0.6.5
pkgrel=1
pkgdesc="Convert PNG to SVG"
arch=(x86_64)
url="https://github.com/visioncortex/vtracer"
license=('MIT')
options=('!lto')
makedepends=(
	'rust'
	'python-build'
	'python-installer'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/visioncortex/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('a2e927a3cc4e8e3440862aeaef3d6d2c867c6557b270a55291fe1e6ae9706444')

build() {
	cd "${pkgname}-${pkgver}"

	cargo build --release

	# Build Python bindings
	cd cmdapp
	python -m build
}

package_vtracer() {
	depends=('gcc-libs')

	cd "${pkgbase}-${pkgver}"

	install -Dm755 \
		target/release/vtracer \
		"${pkgdir}/usr/bin/vtracer"

	install -Dm644 \
		LICENSE \
		"${pkgdir}/usr/share/licenses/vtracer/LICENSE"
}

package_python-vtracer() {
	pkgdesc="Python bindings for vtracer"
	depends=('python')

	cd "${pkgbase}-${pkgver}"

	python -m installer \
		--destdir="${pkgdir}" \
		cmdapp/dist/*.whl

	# TODO(Martin): Also appears to be dual-licensed with Apache?
	install -Dm644 \
		LICENSE \
		"${pkgdir}/usr/share/licenses/python-vtracer/LICENSE"
}
