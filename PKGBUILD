# Maintainer: Yangtse Su <yangtsesu@gmail.com>
# Arch naming: the package installs the importable module `laya`, so it is `python-laya`.
# 0.3.11 ships three console scripts -- `laya` (local CLI), `laya-serve` (HTTP) and
# `laya-mcp-server` (MCP over stdio). They stay in this package rather than moving to
# non-prefixed splits: each only serves this module, which is the "program strongly coupled
# to the Python ecosystem" case the guidelines keep under the python- prefix
# (cf. python-pytest). Their dependencies are upstream's optional extras (serve/mcp), so
# they are optdepends, not depends.
pkgname=python-laya
_name=${pkgname#python-}
pkgver=0.3.11
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
# Upstream extras: serve, mcp, onnx, langchain, fast. Every one of them is optional; the
# core import and inference paths work with `depends` alone.
optdepends=(
  'python-fastapi: HTTP layer for the `laya-serve` server'
  'uvicorn: ASGI server that `laya-serve` starts'
  'python-mcp>=2.2.0: MCP stdio server behind `laya-mcp-server`'
  'python-langchain-core: LangChain / LangGraph runnables in `laya.integrations`'
  'python-onnx: ONNX export for the ONNX Runtime engine'
  'python-onnxruntime-cpu: ONNX Runtime engine in `laya.onnx_agent` (the -cuda/-rocm variants work too)'
  'python-tilelang: TileLang GPU fast path in `laya.fast`'
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
b2sums=('cc51a0f06be7cf599aad707c1b6a6df33944e57346e3349e9ad6d083eb1b1dc76f43db9b07931ea1bd3198522ef6e6dfcd51aa313ba8b4edf53afb8bb2689701')

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
  # Everything upstream CI runs, plus test_load_errors.py and test_truncation_direction.py,
  # which no CI job covers. Each suite builds its own tiny checkpoints and needs no network.
  python tests/test_router.py
  python tests/test_criteria.py
  python tests/test_batch.py
  python tests/test_download.py
  python tests/test_shortlist.py
  python tests/test_decision_model.py
  python tests/test_head_checkpointing.py
  python tests/test_packaging.py
  python tests/test_tokenizer_cache.py
  python tests/test_lazy_import.py
  python tests/test_lang_guess.py
  python tests/test_calibration_persistence.py
  python tests/test_context_manager.py
  python tests/test_criteria_normalization.py
  python tests/test_docker_entrypoint.py
  python tests/test_empty_questions.py
  python tests/test_router_memory.py
  python tests/test_shortlist_cosine.py
  python tests/test_temperature_loading.py
  python tests/test_cli.py
  python tests/test_langchain.py
  python tests/test_load_errors.py
  python tests/test_email.py
  # These two are pytest suites. No CI job runs test_serve.py, and
  # test_truncation_direction.py has no unittest runner at all; between them they are the
  # only cover for laya/serve.py, which this package installs as `laya-serve`.
  python -m pytest -o addopts="" tests/test_serve.py
  python -m pytest -o addopts="" tests/test_truncation_direction.py
  # Suites deliberately not run here:
  #   test_mcp.py            needs mcp>=2.2.0, which Arch's python-mcp (1.29.0) is not yet
  #   test_fast.py           needs the tilelang extra
  #   test_onnx.py           needs the onnx extra and downloads a real checkpoint
  #   test_local_e2e.py      needs real checkpoints under ~/laya_models
  #   test_mcp_local_e2e.py  needs real checkpoints and a live MCP handshake
}

package() {
  cd "$_name-$pkgver"
  # Also generates /usr/bin/laya, /usr/bin/laya-serve and /usr/bin/laya-mcp-server from the
  # wheel's console_scripts entry points.
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
