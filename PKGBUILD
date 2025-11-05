# Maintainer: Zosoled

pkgname='python-py-sr25519-bindings'
_name=${pkgname#python-}
_author='JAMdotTech'
_repository=${_name%-bindings}
pkgver=0.2.2
pkgrel=1
pkgdesc='Bindings for the RUST implementation of the sr25519 cryptography library'
arch=('x86_64')
url="https://github.com/${_author}/${_repository}"
license=('Apache-2.0')
depends=(
	'python>=3.7'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-maturin>=1.7.0'
	'python-toml'
	'python-wheel'
	'rustup'
)
source=(
	"${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"0001_maturin_version.patch"
)
sha256sums=(
	'SKIP'
	'SKIP'
)

prepare() {
	cd "${srcdir}/${_repository}-${pkgver}"
	patch -p1 -i ../0001_maturin_version.patch
}

build() {
	cd "${srcdir}/${_repository}-${pkgver}"
	export PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_repository}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

