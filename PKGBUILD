# Maintainer: envolution
# Contributor: otaj
# If you also want to test GPU portion of the package, set this to 1. Make sure you have a capable GPU with large enough memory
TEST_GPU=0

pkgname=python-kornia
_name=kornia
pkgver=0.7.4
pkgrel=2
arch=(any)
url='https://github.com/kornia/kornia'
pkgdesc='Open Source Differentiable Computer Vision Library for PyTorch'
license=(Apache-2.0)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pytest-runner')
depends=('python-pytorch')
optdepends=(
  'python-accelerate: To be able to train'
  'python-onnx: To use onnx models'
  'python-onnxruntime: To use onnx runtime'
  'python-kornia-rs: Low-level Computer Vision library - rust bindings'
)
checkdepends=('python-kornia-rs' 'python-accelerate' 'python-pytest' 'python-pytest-cov' 'python-pytest-mypy' 'python-scipy' 'python-opencv')
options=(!emptydirs)
source=("${_name}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('9d9840f0940e277086b8bd183355762ccf25e4e7bc8d87497d2b0d9857938c1a')

build() {
	cd "${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

check() {
        _ignore_tests=("tests/onnx") #array for text exclusion
	cd "${_name}-${pkgver}"
	pytest $(printf -- '--ignore=%s ' "${_ignore_tests[@]}") -v -x --device cpu --dtype float32,float64 --cov-fail-under=50 --cov=kornia tests/
	if ! [ "$TEST_GPU" -eq "0" ]; then
		pytest $(printf -- '--ignore=%s ' "${_ignore_tests[@]}") -v -x --device cuda --dtype all --cov-fail-under=50 --cov=kornia tests/
	fi
}

package() {
	cd "${_name}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
