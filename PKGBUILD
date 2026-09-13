# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-nncf
_pkgname=nncf
pkgver=3.3.0
pkgrel=1
pkgdesc="Neural Network Compression Framework for OpenVINO (quantization, pruning, sparsity)"
arch=('any')
url="https://github.com/openvinotoolkit/nncf"
license=('Apache-2.0')
depends=(
    'python'
    'python-networkx'
    'ninja'
    'python-numpy'
    'python-numpy<3'
    'python-openvino-telemetry'
    'python-packaging'
    'python-psutil'
    'python-pydot'
    'python-pydot<5'
    'python-rich'
    'python-safetensors'
    'python-scikit-learn'
    'python-scipy'
    'python-setuptools'
    'python-tabulate'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
)
checkdepends=(
    'python-pytest'
    'python-pytest-mock'
    'python-pytorch'
)
optdepends=(
    'gcc: JIT compilation of PyTorch compression operators'
    'python-pytorch: PyTorch backend for compression'
    'python-onnx: ONNX backend for compression'
    'openvino: OpenVINO backend and inference'
    # plots extra
    'python-matplotlib: plotting compression statistics'
    'python-pandas: tabular data for plots'
    'python-pillow: image handling for plots'
    'python-plotly: interactive plots (provides plotly.express)'
)
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    'python-3.14-runtime-numpy-alias.patch'
    'arch-glog-export.patch'
    'nncf-pytorch-workflow.py'
)
sha256sums=(
    '3a9ca1acf32beb8aa246923aa41d410376a58d25dc5759ddb9f39ffdf5f3f122'
    'a4dc19737d646a1f6291ffa25d051b8f9201a4ff211f618daaef158cccbbd8d4'
    'cfd639b7a26812d4451a491165aeebed8666316638be9a462113fb1b3701b803'
    '185741858254a1138d778614301e93054a3cafb2471c1fb53fd91f87916f4bec'
)

prepare() {
    cd "$_pkgname-$pkgver"
    patch -Np1 -i "$srcdir/python-3.14-runtime-numpy-alias.patch"
    patch -Np1 -i "$srcdir/arch-glog-export.patch"
    # Validate Arch's NumPy 2.5 and pydot 4 APIs with the suites below.
    sed -i -e 's/numpy>=1.24.0, <2.5.0/numpy>=1.24.0, <3/' \
        -e 's/pydot>=1.4.1, <=3.0.4/pydot>=1.4.1, <5/' pyproject.toml
}

build() {
    cd "$_pkgname-$pkgver"
    # GitHub archive lacks the sdist's frozen version metadata; without this the
    # dynamic version resolves to "$pkgver.dev0+unknown_version". The release flag
    # makes custom_version use the committed src/nncf/version.py ("$pkgver").
    NNCF_RELEASE_BUILD=1 python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"

    local _check="$srcdir/_check"
    local _site
    rm -rf "$_check" "$srcdir/_suite"
    python -m installer --destdir="$_check" dist/*.whl
    _site="$_check$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"
    mkdir -p "$srcdir/_suite"
    cp -a tests "$srcdir/_suite/"

    # Upstream splits its backend suites into independent CI jobs. Run the
    # complete framework-neutral suite against the installed wheel here.
    cd "$srcdir/_suite"
    PYTHONPATH="$_site:$srcdir/_suite" \
        python -P -m pytest -v -ra tests/common

    # These backend tests need only local tensors, not downloaded Hugging Face
    # models or the separate OpenVINO/Optimum integration environment.
    CUDA_VISIBLE_DEVICES='' PYTHONPATH="$_site:$srcdir/_suite" \
        python -P -m pytest -v -ra -c tests/torch/pytest.ini -m 'not cuda' \
        tests/torch/test_tensor.py tests/torch/test_return_types.py \
        tests/torch/test_node_utils.py

    # Representative PyTorch PTQ workflow on a fully local model and dataset.
    CUDA_VISIBLE_DEVICES='' PYTHONPATH="$_site" \
        python "$srcdir/nncf-pytorch-workflow.py"
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
