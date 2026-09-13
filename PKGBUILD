# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-gepa
_pkgname=gepa
pkgver=0.1.4
pkgrel=2
pkgdesc="Optimize prompts, code, and more via reflective text evolution"
arch=('any')
url="https://github.com/gepa-ai/gepa"
license=('MIT')
depends=('python')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
checkdepends=(
    'python-cloudpickle>=3.0'
    'python-langchain-core>=1.0'
    'python-mcp'
    'python-pytest'
    'python-tqdm'
)
# No official/AUR package currently provides llm-structured-confidence>=0.4.5,
# mlflow-skinny>=3.11.1, swesmith, mini-swe-agent, swebench, or terminal-bench.
# The available LiteLLM packages are 1.92.0 (upstream requires <1.92), while
# python-mlflow is 3.6.0 (upstream requires >=3.11.1), so neither can be
# advertised as an installable optional dependency. Their adapters stay in the
# package and become usable as soon as compatible providers exist.
optdepends=(
    'python-tqdm>=4.66.1: progress bars'
    'python-cloudpickle>=3.0: robust state serialization and subprocess execution'
    'python-datasets>=4.5: dataset-backed examples and GSkill support'
    'python-pandas>=2.3.3: Python 3.14 dataset and tracking compatibility'
    'python-wandb>=0.23: Weights & Biases tracking (AUR)'
    'python-pyarrow>=22: Python 3.14 datasets and LanceDB support'
    'python-pydantic>=2.12: AnyMaths and Terminal-Bench adapters'
    'python-tiktoken>=0.12: Python 3.14 LiteLLM tokenization'
    'python-dspy: DSPy adapters (AUR)'
    'python-langchain>=1.0: LangChain model discovery'
    'python-langchain-core>=1.0: LangChain adapter'
    'python-mcp: Model Context Protocol adapter'
    'python-docker: GSkill container evaluation'
    'python-dotenv: GSkill environment loading'
    'python-yaml: GSkill and DSPy full-program adapters'
    'python-google-auth>=2.40.3: authenticated Google models in AnyMaths'
    'python-chromadb>=0.4: ChromaDB RAG vector store (AUR)'
    'python-weaviate-client>=4.0: Weaviate RAG vector store (AUR)'
    'python-qdrant-client>=1.15: Qdrant RAG vector store (AUR)'
    'python-pymilvus>=2.6: Milvus RAG vector store (AUR)'
    'python-lancedb>=0.22: LanceDB RAG vector store (AUR)'
    'python-numpy: reproducible numeric code execution and RAG fallbacks'
    'python-pytorch: reproducible PyTorch code execution'
    'python-psutil: reliable cleanup of code-execution child processes'
)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/gepa-ai/gepa/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9fd2760b683631d6b9f9d7c2ade1027bed56627446c58bbebbfe35e290d2f53a')

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"
    # Release tags retain the previous publish placeholder; upstream's release
    # workflow rewrites it from the tag only while producing distribution files.
    sed -i -E '/#replace_package_version_marker/{n;s/^version="[^"]+"/version="'"$pkgver"'"/;}' pyproject.toml
    grep -qx "version=\"$pkgver\"" pyproject.toml
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    rm -rf build dist ./*.egg-info
    python -m build --wheel --no-isolation
}

check() {
    local site_packages
    site_packages="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"

    cd "$srcdir/$_pkgname-$pkgver"
    rm -rf "$srcdir/gepa-check" "$srcdir/gepa-test-suite"
    python -m installer --destdir="$srcdir/gepa-check" dist/*.whl
    mkdir -p "$srcdir/gepa-test-suite"
    cp -a tests "$srcdir/gepa-test-suite/"
    cd "$srcdir/gepa-test-suite"

    # Hugging Face-backed AIME/PUPA tests fetch live datasets; replayed LLM calls
    # are otherwise kept and tested. Exclude only the tests that initialize them.
    # Compatible LiteLLM (<1.92) and MLflow (>=3.11.1) providers are unavailable
    # in Arch/AUR: both LiteLLM packages are 1.92.0 and python-mlflow is 3.6.0.
    # AUR python-wandb 0.25.0 meets the version floor but currently fails its own
    # check/import with protobuf 35.1 (missing Imports in wandb_telemetry_pb2).
    # Their isolated adapter/tracker tests are therefore explicitly deselected.
    # The ambient pytest-randomly plugin is disabled because upstream does not use it.
    PYTHONPATH="$srcdir/gepa-check$site_packages" \
    HF_HUB_OFFLINE=1 \
    DATASETS_OFFLINE=1 \
    RECORD_TESTS=false \
    python -m pytest -v -p no:randomly \
        --ignore=tests/test_aime_prompt_optimization/test_aime_prompt_optimize.py \
        --ignore=tests/test_callbacks_integration/test_callbacks_with_optimization.py \
        --ignore=tests/test_pareto_frontier_types/test_pareto_frontier_types.py \
        --ignore=tests/test_lm.py \
        --ignore=tests/test_reflection_cost_tracking.py \
        --ignore=tests/test_rag_adapter/test_generic_rag_adapter.py \
        --deselect=tests/test_evaluation_cache.py::test_aime_prompt_optimize_with_cache \
        --deselect=tests/test_evaluation_cache.py::test_pareto_frontier_type_with_cache \
        --deselect=tests/test_state.py::test_e2e_resume_run \
        --deselect=tests/test_parallel_proposals.py::test_selection_strategy_sees_all_proposals_including_rejected \
        --deselect=tests/test_parallel_proposals.py::TestDefaultStrategiesRetainBehavior \
        --deselect=tests/test_evaluator_wrapper.py::TestMakeLitellmLm \
        --deselect=tests/test_rag_adapter/test_rag_end_to_end.py::test_rag_adapter_basic_functionality \
        --deselect=tests/test_attach_existing_run.py::TestWandbAttachExisting \
        --deselect=tests/test_attach_existing_run.py::TestMlflowAttachExisting \
        --deselect=tests/test_attach_existing_run.py::TestTrackingConfig::test_config_wired_to_tracker_via_optimize_anything \
        --deselect=tests/test_attach_existing_run.py::TestOptimizeApiAttachExisting \
        --deselect=tests/test_attach_existing_run.py::TestKeyPrefix \
        --deselect=tests/test_attach_existing_run.py::TestWandbStepMetric \
        tests

    PYTHONPATH="$srcdir/gepa-check$site_packages" python - <<'PY'
from importlib.metadata import version

from gepa import optimize

data = [
    {"input": "What is the capital of France?", "answer": "Paris", "additional_context": {}},
    {"input": "What is 2+2?", "answer": "4", "additional_context": {}},
]
answers = {item["input"]: item["answer"] for item in data}


def task_lm(messages):
    system = messages[0]["content"]
    question = messages[1]["content"]
    return answers[question] if "Answer exactly" in system else "unknown"


def reflection_lm(prompt):
    assert "unknown" in prompt
    return "```\nAnswer exactly with the known reference answer.\n```"


result = optimize(
    seed_candidate={"instructions": "Give a vague response."},
    trainset=data,
    valset=data,
    task_lm=task_lm,
    reflection_lm=reflection_lm,
    max_metric_calls=8,
    reflection_minibatch_size=2,
    display_progress_bar=False,
    seed=0,
)

assert version("gepa") == "0.1.4"
assert result.best_candidate["instructions"].startswith("Answer exactly")
assert result.val_aggregate_scores[result.best_idx] == 1.0
PY
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
