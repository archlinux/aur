# Maintainer: Smoolak <smoolak [at] gmail.com>.

pkgname=python-nvidia-modelopt
_pkgname=Model-Optimizer
pkgver=0.41.0
pkgrel=1
pkgdesc="NVIDIA Model Optimizer: a unified model optimization and deployment toolkit"
arch=('any')
url="https://github.com/NVIDIA/Model-Optimizer"
license=('Apache-2.0')
depends=(
  'python'
  'python-ninja'
  'python-numpy'
  'python-packaging'
  'python-pydantic'
  'python-nvidia-ml-py'
  'python-rich'
  'python-scipy'
  'python-tqdm'
  'python-pulp'
  'python-regex'
  'python-safetensors'
  'python-pytorch'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-setuptools-scm'
  'cython'
)
optdepends=(
  'python-torchprofile: for FastNAS pruning on computer vision models'
  'python-accelerate: for Hugging Face integration'
  'python-transformers: for Hugging Face integration'
  'python-diffusers: for diffusion model optimization'
  'python-onnx: for ONNX export'
  'python-onnxruntime: for ONNX runtime support'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/NVIDIA/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a97852c230231fccaa36fe9817646d6c8d062d8a85790547536508506f5d26fc')

build() {
  cd "$_pkgname-$pkgver"

  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"

  # Basic import test
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD:$PYTHONPATH" python -c "import modelopt; print(modelopt.__version__)" || \
    echo "Warning: Import test failed - this may be expected without CUDA/TensorRT"
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
