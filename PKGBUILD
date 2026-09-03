# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>
# Contributor: Majorx234 <majorx234@gmail.com>

_pkgname='docling-ibm-models'
pkgname="python-${_pkgname}"
pkgver='4.0.1'
pkgrel=1
pkgdesc='AI models used by the Docling PDF conversion package'
arch=('any')
url="https://github.com/docling-project/${_pkgname}"
license=('MIT')
depends=(
	'python>=3.10'
	'python-pytorch>=2.2.2'
	'python-torchvision'
	'python-pillow>=10.0.0'
	'python-huggingface-hub>=0.23.0'
	'python-safetensors>=0.4.3'
	'python-transformers>=5.4.0'
	'python-numpy>=1.24.4'
)
conflicts=('python-transformers=5.13.0')
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel'
)
checkdepends=('python-pytest')
optdepends=('python-opencv>=4.6.0: legacy TableFormer image preprocessing')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('c0185c9bbc4d172c30635a6eabdfea1e6c77a0ba0264fea3714ebf26475b20adc19ded7c8aae739c78338e2fd48730fbf0407c350bd7e07c5b61068268ff60aa')

build() {
	cd -- "${_pkgname}-${pkgver}" || return 1
	python -m build --wheel --no-isolation
}

check() {
	cd -- "${_pkgname}-${pkgver}" || return 1
	HF_HUB_OFFLINE=1 TRANSFORMERS_OFFLINE=1 python -m pytest -q \
		tests/test_common.py \
		tests/test_matching_post_processor.py \
		tests/test_matching_post_processor_orphans.py \
		tests/test_tf_predictor_indexes.py
}

package() {
	cd -- "${_pkgname}-${pkgver}" || return 1
	python -m installer --destdir="${pkgdir}" --compile-bytecode 2 dist/*.whl
	install -D -m644 -- LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
