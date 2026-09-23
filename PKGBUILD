# Maintainer: Yangtse Su <yangtsesu@gmail.com>
# Arch naming: the package installs the importable module `laya`, so it is `python-laya`.
# 0.3.7 adds the `laya-serve` console script. It stays in this package rather than moving to a
# non-prefixed `laya-serve` split: it only serves this module, which is the "program strongly
# coupled to the Python ecosystem" case the guidelines keep under the python- prefix
# (cf. python-pytest). Its fastapi/uvicorn dependencies are upstream's optional `[serve]`
# extra, so they are optdepends, not depends.
pkgname=python-laya
_name=${pkgname#python-}
pkgver=0.3.7
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
optdepends=(
  'python-fastapi: HTTP layer for the `laya-serve` server'
  'uvicorn: ASGI server that `laya-serve` starts'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-fastapi'
  'python-httpx'
  'python-pytest'
  'python-tokenizers'
)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('96053adc9cee4ba02b72861ea38a319e8bfde4f3788416034918e334d2687e20')
b2sums=('fadfc2192034cc8808e5f7be34cbed1e696a3f752cc99f0b5748e129cd22e2cfdcf618819af31ede1fb0a804e9040dab745d097e37c466923da7f36cb21e29d0')

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
  # The unittest-style suites import `laya` from the source tree; upstream CI gets that
  # for free from its `pip install -e .`, so the path has to be set explicitly here.
  export PYTHONPATH="$PWD"
  # test_local_e2e.py is skipped: it needs real checkpoints under ~/laya_models.
  # Every other suite builds its own tiny checkpoints and needs no network.
  python tests/test_router.py
  python tests/test_criteria.py
  python tests/test_download.py
  python tests/test_shortlist.py
  python tests/test_decision_model.py
  python tests/test_packaging.py
  python tests/test_lang_guess.py
  python tests/test_calibration_persistence.py
  python tests/test_context_manager.py
  python tests/test_criteria_normalization.py
  python tests/test_docker_entrypoint.py
  python tests/test_empty_questions.py
  python tests/test_router_memory.py
  python tests/test_shortlist_cosine.py
  python tests/test_temperature_loading.py
  python tests/test_email.py
  # Upstream CI does not run this one; it is the only cover for laya/serve.py, which
  # this package installs as `laya-serve`. It injects a fake Router, so no checkpoint.
  python -m pytest -o addopts="" tests/test_serve.py
}

package() {
  cd "$_name-$pkgver"
  # Also generates /usr/bin/laya-serve from the wheel's console_scripts entry point.
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
