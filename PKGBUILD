# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
# Contributor: Filip Graliński <filipg@amu.edu.pl>

pkgname=python-transformers
_pkgname=${pkgname#python-}
pkgver=5.21.0
pkgrel=1
pkgdesc='State-of-the-art pretrained models for inference and training'
arch=('any')
url='https://github.com/huggingface/transformers'
license=('Apache-2.0')
depends=(
  'python-huggingface-hub'
  'python-numpy'
  'python-packaging'
  'python-regex'
  'python-safetensors'
  'python-tokenizers'
  'python-tqdm'
  'python-typer'
  'python-yaml'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=(
  'python-bitsandbytes: 8-bit support for PyTorch'
  'python-flax: JAX support'
  'python-keras: Support for models in Keras 3'
  'python-onnxconverter-common: TensorFlow support'
  'python-pytorch: PyTorch support'
  'python-tensorflow: TensorFlow support'
  'python-tf-keras: Support for models in Keras 2 (e.g. BART)'
  'python-tf2onnx: TensorFlow support'
  'python-hf-xet: xethub support'
)
source=(
  "python-transformers-pkgver.tar.gz"::"https://github.com/huggingface/transformers/archive/refs/tags/v${pkgver%%.0}.tar.gz"
)
sha256sums=('a3f3f7cf0110434ee061513fb75710880e2761c35ba8746179d21340f81b3b83')

prepare() {
  cd "transformers-${pkgver%%.0}"
  # Remove annoying dependency check on `tokenizers`.
  sed -i '/tokenizers/c\    "tokenizers": "tokenizers",' \
      src/transformers/dependency_versions_table.py
}

build() {
  python -m build -nw "transformers-${pkgver%%.0}"
}

check() {
  cd "transformers-${pkgver%%.0}"
  PYTHONPATH=$PWD/src python -c 'import transformers'
}

package() {
  cd "transformers-${pkgver%%.0}"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --compile-bytecode=1 --destdir=$pkgdir \
    $srcdir/$_pkgname-${pkgver%%.0}/dist/transformers-$pkgver-*-*.whl
}
