# Maintainer: Martin Rys <https://rys.rs/contact>

pkgbase=vtracer
pkgname=(
	vtracer
	python-vtracer
)
# [2025-07-23]: The version is actually 0.6.11 but the GitHub releases vs tags vs actual file version(==PyPI version) is all over the place
#               Sent an email off to the maintainer about it
pkgver=0.6.12
pkgrel=2
pkgdesc="Convert PNG to SVG"
arch=(x86_64)
url="https://github.com/visioncortex/vtracer"
makedepends=(
	'rust'
	'python-build'
	'python-installer'
	'python-maturin'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/visioncortex/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('8f7b9c7bb7b3cf9f47ca3c36772f41cf45c23127f406b4c6b34b4e589a00ce42')

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
	license=('MIT')
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
	license=('Apache-2.0 OR MIT')
	depends=('python')

	cd "${pkgbase}-${pkgver}/cmdapp"

	python -m installer \
		--destdir="${pkgdir}" \
		dist/*.whl

	install -Dm644 \
		LICENSE-APACHE \
		"${pkgdir}/usr/share/licenses/python-vtracer/LICENSE-APACHE"
	install -Dm644 \
		LICENSE-MIT \
		"${pkgdir}/usr/share/licenses/python-vtracer/LICENSE-MIT"
}
