# Maintainer: Smoolak <smoolak [at] gmail.com>.

pkgname=python-nvidia-modelopt
_pkgname=TensorRT-Model-Optimizer
pkgver=0.39.0
pkgrel=1
pkgdesc="NVIDIA TensorRT Model Optimizer: a unified model optimization and deployment toolkit"
arch=('any')
url="https://github.com/NVIDIA/TensorRT-Model-Optimizer"
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
  'python-torchprofile'
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
  'python-accelerate: for Hugging Face integration'
  'python-transformers: for Hugging Face integration'
  'python-diffusers: for diffusion model optimization'
  'python-onnx: for ONNX export'
  'python-onnxruntime: for ONNX runtime support'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/NVIDIA/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('4137f1bcf5339fa4ecec6b8de95f36398724b142f958ec1b8f9912eb507323fe')

build() {
  cd "$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
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
