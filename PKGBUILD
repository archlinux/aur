# Maintainer: Yangtse Su <yangtsesu@gmail.com>
# Arch naming: the package installs the importable module `laya`, so it is `python-laya`.
# 0.3.21 ships four console scripts -- `laya` (local CLI), `laya-serve` (HTTP),
# `laya-evals` and `laya-mcp-server` (MCP over stdio). They stay in this package rather than moving to
# non-prefixed splits: each only serves this module, which is the "program strongly coupled
# to the Python ecosystem" case the guidelines keep under the python- prefix
# (cf. python-pytest). Their dependencies are upstream's optional extras (serve/mcp), so
# they are optdepends, not depends.
pkgname=python-laya
_name=${pkgname#python-}
pkgver=0.3.21
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
# Upstream extras: serve, mcp, structured, langchain/langgraph, llamaindex, crewai, onnx, fast.
# Every one of them is optional; the core import and inference paths work with `depends` alone.
optdepends=(
  'python-fastapi: HTTP layer for the `laya-serve` server'
  'uvicorn: ASGI server that `laya-serve` starts'
  'python-mcp>=2.2.0: MCP stdio server behind `laya-mcp-server`'
  'python-pydantic: typed-model helpers in `laya.structured`'
  'python-langchain-core: LangChain runnables in `laya.integrations`'
  'python-langgraph: LangGraph runnables in `laya.integrations`'
  'python-llama-index-core: LlamaIndex router and selector integrations in `laya.integrations`'
  'python-crewai: CrewAI delegation router in `laya.integrations`'
  'python-onnx: ONNX export for the ONNX Runtime engine'
  'python-onnxruntime-cpu: ONNX Runtime engine in `laya.onnx_agent` (the -cuda/-rocm variants work too)'
  'python-onnxscript: scripting backend that `torch.onnx.export` needs for the ONNX engine'
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
b2sums=('01bf194d40b83807ec56f15db01be541a32f2a907dd5c5aad76022eadfb030cdaa2e457101dce08cf3fe12bfbab9cb827a5ba867878f6e5a701340a1809cec3b')

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
  # The upstream CI `test` job suite, minus every file that needs an optional extra: this
  # package builds only against `depends` plus `checkdepends`, and no suite here reaches
  # for anything else. Each suite builds its own tiny checkpoints and needs no network.
  python tests/test_router.py
  python tests/test_criteria.py
  python tests/test_batch.py
  python tests/test_predict_long.py
  python tests/test_attention_dynamic_shapes.py
  python tests/test_hooks.py
  python tests/test_hooks_api.py
  python tests/test_download.py
  python tests/test_shortlist.py
  python tests/test_decision_model.py
  python tests/test_head_checkpointing.py
  python tests/test_packaging.py
  python tests/test_compose_env.py
  python tests/test_audit_scope.py
  python tests/test_doc_tables.py
  python tests/test_env_docs.py
  python tests/test_tokenizer_cache.py
  python tests/test_tokenizer_concurrency.py
  python tests/test_question_token_reuse.py
  python tests/test_lazy_import.py
  python tests/test_runtime_fixes.py
  python tests/test_option_collapse.py
  python tests/test_lang_guess.py
  python tests/test_identifier_complexity.py
  python tests/test_lang_stats.py
  python tests/test_calibration_persistence.py
  python tests/test_context_manager.py
  python tests/test_criteria_normalization.py
  python tests/test_docker_entrypoint.py
  python tests/test_empty_questions.py
  python tests/test_router_memory.py
  python tests/test_shortlist_cosine.py
  python tests/test_temperature_loading.py
  python tests/test_confidence.py
  python tests/test_cli.py
  python tests/test_portability.py
  python tests/test_training.py
  python tests/test_example_server_limits.py
  python tests/test_blank_lang_routing.py
  python tests/test_export_onnx_safety.py
  python tests/test_load_errors.py
  python tests/test_revision_pinning.py
  python tests/test_example_server_errors.py
  python tests/test_email.py
  # The remaining upstream suites are pytest-style, and `python tests/<name>.py` only
  # defines their test functions. `test_serve.py` is the only cover for laya/serve.py,
  # which this package installs as `laya-serve`; `test_truncation_direction.py` has no
  # unittest runner at all.
  python -m pytest -o addopts="" \
    tests/test_serve.py \
    tests/test_router_batch.py \
    tests/test_predict_batch.py \
    tests/test_system_one_lang.py \
    tests/test_audit_regressions.py \
    tests/test_truncation_direction.py \
    tests/test_compile.py
  # Suites deliberately not run here, each needing an optional extra that this package
  # ships as an optdepend and that checkdepends does not pull in:
  #   test_structured*.py    need the structured extra (pydantic)
  #   test_langchain*.py     need the langchain extra (langchain-core)
  #   test_llamaindex.py     needs the llamaindex extra
  #   test_crewai.py         needs the crewai extra
  #   test_mcp.py            needs the mcp extra (>=2.2.0; Arch's python-mcp is 1.29.0)
  #   test_onnx*.py          need the onnx extra
  #   test_fast.py           needs the tilelang extra
  #   test_local_e2e.py      needs real checkpoints under ~/laya_models
  #   test_mcp_local_e2e.py  needs real checkpoints and a live MCP handshake
}

package() {
  cd "$_name-$pkgver"
  # Also generates /usr/bin/laya, /usr/bin/laya-serve, /usr/bin/laya-evals and
  # /usr/bin/laya-mcp-server from the wheel's console_scripts entry points.
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
