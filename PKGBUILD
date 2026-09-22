# Maintainer: Yangtse Su <yangtsesu@gmail.com>
# Arch naming: the package installs the importable module `laya`, so it is `python-laya`.
# There is no console script, so no split `laya` package is needed.
pkgname=python-laya
_name=${pkgname#python-}
pkgver=0.3.5
pkgrel=1
pkgdesc="Fast, non-autoregressive System 1 decision engine with calibrated probabilities"
arch=('any')
url="https://github.com/NandhaKishorM/laya"
license=('Apache-2.0')
depends=(
  'python'
  'python-huggingface-hub'
  'python-numpy'
  'python-pytorch'
  'python-safetensors'
  'python-transformers'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-tokenizers')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b877bb93a5fc950a09f3b6e15360e83aead7c8d08c0b50c3a2fbf67d4c1bacad')
b2sums=('e58b19be74d5a9cb50dde1c537f55231a11999a4ecf3f658ab2b7c933e2293694ca40599937d852aa2e66db5ca5b06de3b806b9dce771b4822f8fd7a3d31bfe6')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  # Same env as the upstream CI: transformers' TensorFlow probe can deadlock model
  # construction, and the tokenizers Rust runtime must not fork.
  export USE_TF=0
  export USE_TORCH=1
  export TOKENIZERS_PARALLELISM=false
  # test_local_e2e.py is skipped: it needs real checkpoints under ~/laya_models.
  # Every other suite builds its own tiny checkpoints and needs no network.
  python tests/test_router.py
  python tests/test_criteria.py
  python tests/test_download.py
  python tests/test_shortlist.py
  python tests/test_decision_model.py
  python tests/test_packaging.py
  python tests/test_email.py
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
