# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-neural-compressor
_pkgname=neural_compressor
pkgver=3.8.1
pkgrel=1
pkgdesc="Intel Neural Compressor: model quantization and compression for ONNX, PyTorch, TensorFlow and JAX"
arch=('any')
url="https://github.com/intel/neural-compressor"
license=('Apache-2.0')
depends=(
    'python'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
    # PyTorch backend (extra: pt)
    'python-pytorch: PyTorch quantization backend'
    'python-numpy: PyTorch/JAX backend'
    'python-prettytable: tabular output for quantization results'
    'python-psutil: system resource detection'
    'python-py-cpuinfo: CPU feature detection'
    'python-pydantic: configuration validation'
    'python-torchao: PyTorch architecture optimization backend'
    # TensorFlow backend (extra: tf)
    'python-tensorflow: TensorFlow quantization backend'
    'python-yaml: TensorFlow backend configuration'
    # JAX backend (extra: jax)
    'python-jax: JAX quantization backend'
    'python-keras: JAX/Keras backend'
    'python-deprecated: JAX backend deprecation helpers'
    'python-pillow: JAX backend image handling'
    'python-scikit-learn: JAX backend metrics'
    'python-scipy: JAX backend numerics'
)
source=("$_pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/n/neural-compressor/$_pkgname-$pkgver.tar.gz")
sha256sums=('6ec0ccd205a71335292f5493e311be0d73d87ca2914156de842b9d4ac358d763')

prepare() {
    cd "$_pkgname-$pkgver"
    # setup.py reads requirements*.txt to populate install_requires for its
    # variants, but the sdist omits the per-backend ones (requirements_pt.txt /
    # requirements_tf.txt) -> FileNotFoundError in get_requires_for_build_wheel.
    # Create any missing ones empty (the PyTorch/TF backends are optdepends).
    local f
    for f in requirements_pt.txt requirements_tf.txt requirements_jax.txt; do [ -f "$f" ] || : > "$f"; done
}

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    PYTHONPATH="$PWD:$PYTHONPATH" python -c "import neural_compressor; print(neural_compressor.__version__)"
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
