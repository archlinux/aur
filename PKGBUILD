# Maintainer: Martin Rys <https://rys.rs/contact>

pkgbase=vtracer
pkgname=(
	vtracer
	python-vtracer
)
# [2025-07-23]: The version is actually 0.6.11 but the GitHub releases vs tags vs actual file version(==PyPI version) is all over the place
#               Sent an email off to the maintainer about it
pkgver=0.6.15
pkgrel=1
pkgdesc="Convert PNG to SVG"
arch=(x86_64)
license=('MIT')
url="https://github.com/visioncortex/vtracer"
makedepends=(
	'rust'
	'python-build'
	'python-installer'
	'python-maturin'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/visioncortex/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('2ad16823ca897de2f3c12e104845ecdf2c018bdf871ebb7c07e63dbfd4a2ffa9')

prepare() {
	cd "${pkgname}-${pkgver}"

	export RUSTUP_TOOLCHAIN=stable
	# Upstream does not provide a lock file at the time of writing
	cargo fetch --target host-tuple # --locked
}

build() {
	cd "${pkgname}-${pkgver}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features

	# Build Python bindings
	cd cmdapp
	python -m build --wheel --no-isolation
}

package_vtracer() {
	depends=('libgcc')

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

	cd "${pkgbase}-${pkgver}/cmdapp"

	python -m installer \
		--destdir="${pkgdir}" \
		dist/*.whl

	install -Dm644 \
		LICENSE \
		"${pkgdir}/usr/share/licenses/python-vtracer/LICENSE"
}
