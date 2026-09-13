# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Iyán Méndez Veiga <me (at) iyanmv (dot) com>

_name=dspy
pkgname=python-$_name
pkgver=3.3.1
pkgrel=1
pkgdesc="The framework for programming (not prompting) language models"
arch=('any')
url="https://github.com/stanfordnlp/dspy"
license=('MIT')
depends=(
    'litellm'
    'python'
    'python-anyio'
    'python-cachetools'
    'python-cloudpickle'
    'python-diskcache'
    'python-gepa=0.1.4'
    'python-jiter'
    'python-json_repair>=0.54.2'
    'python-jsonschema'
    'python-numpy'
    'python-openai'
    'python-orjson'
    'python-pydantic'
    'python-pydantic-core'
    'python-regex'
    'python-requests'
    'python-tenacity'
    'python-tqdm'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    'datamodel-code-generator'
    'python-datasets'
    'python-langchain-core'
    'python-mcp'
    'python-optuna'
    'python-pandas'
    'python-pillow'
    'python-pytest'
    'python-pytest-asyncio'
    'python-pytest-mock'
    'python-pytest-socket'
)
optdepends=(
    'python-anthropic: anthropic extra (Anthropic LM provider)'
    'python-accelerate: local Hugging Face fine-tuning'
    'python-colbert-ai: local ColBERT indexing and reranking'
    'python-datasets: dataset loaders and local fine-tuning'
    'python-faiss-git: approximate-nearest-neighbor embedding retrieval'
    'ipython: notebook display and synchronous use inside a running event loop'
    'python-langchain: LangChain tool conversion'
    'python-langchain-core: langchain extra (LangChain Core interoperability)'
    'python-mcp: mcp extra (Model Context Protocol tools)'
    'python-mlflow: Databricks Mosaic Agent Framework retrievers'
    'python-multiprocess: ALFWorld dataset worker pool'
    'python-nest-asyncio: synchronous wrappers inside a running event loop'
    'python-optuna: optuna extra (Optuna-based optimizers)'
    'python-pandas: evaluation tables and dataset loading'
    'python-peft: parameter-efficient local fine-tuning'
    'python-pillow: local image and PDF inputs'
    'python-pytorch: local language-model training and ColBERT reranking'
    'python-sentence-transformers: local embedding and KNN models'
    'python-soundfile: local audio inputs'
    'python-transformers: local Hugging Face model training'
    'python-trl: local supervised fine-tuning'
    'python-weaviate-client: weaviate extra (Weaviate retriever)'
    'python-yaml: ALFWorld dataset configuration'
    'sglang: local model serving'
)
source=("$_name-$pkgver.tar.gz::https://github.com/stanfordnlp/dspy/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d733227462118ff4419813ad0b389e9b03745d2a2f8c042e611e44472b3ed840')

prepare() {
    cd "$srcdir/$_name-$pkgver"
    # Upstream's publish workflow replaces the tag's 3.3.0 placeholders.
    sed -i -E 's/^version *= *"3\.3\.0"/version = "3.3.1"/' pyproject.toml
    sed -i -E 's/__version__ *= *"3\.3\.0"/__version__ = "3.3.1"/' dspy/__metadata__.py
}

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    local _checkroot="$srcdir/_check" _site _staged
    rm -rf "$_checkroot"
    python -m installer --destdir="$_checkroot" \
        "$srcdir/$_name-$pkgver"/dist/*.whl
    _site=$(python -c 'import site; print(site.getsitepackages()[0])')
    _staged="$_checkroot$_site"
    mkdir -p "$_checkroot/suite" "$_checkroot/home"
    cp -a "$srcdir/$_name-$pkgver/tests" "$_checkroot/suite/"
    cp -a "$srcdir/$_name-$pkgver/docs" "$_checkroot/suite/"
    cp "$srcdir/$_name-$pkgver/pyproject.toml" "$_checkroot/suite/"
    cat > "$_checkroot/suite/dspy_offline_plugin.py" <<'PY'
import io

import pytest
import requests
from PIL import Image as PILImage


class _OfflineResponse:
    def __init__(self, content: bytes, content_type: str) -> None:
        self.content = content
        self.headers = {"Content-Type": content_type}
        self.status_code = 200

    def raise_for_status(self) -> None:
        return None


@pytest.fixture(autouse=True)
def _offline_adapter_media(request, monkeypatch):
    path = str(request.node.path).replace("\\", "/")
    if not path.endswith("/tests/signatures/test_adapter_image.py"):
        return

    image = io.BytesIO()
    PILImage.new("RGB", (24, 16), color="navy").save(image, format="JPEG")
    jpeg = image.getvalue()
    pdf = b"%PDF-1.4\n1 0 obj\n<<>>\nendobj\ntrailer\n<<>>\n%%EOF\n"

    def get(url, *args, **kwargs):
        if str(url).lower().endswith(".pdf"):
            return _OfflineResponse(pdf, "application/pdf")
        return _OfflineResponse(jpeg, "image/jpeg")

    monkeypatch.setattr(requests, "get", get)
PY

    cd "$_checkroot/suite"
    HOME="$_checkroot/home" \
    PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 \
    PYTHONPATH="$_staged:$_checkroot/suite" \
        python -P -m pytest -c pyproject.toml -o addopts= \
        -p anyio.pytest_plugin -p pytest_asyncio.plugin -p pytest_mock \
        -p pytest_socket -p dspy_offline_plugin --disable-socket \
        --allow-hosts=127.0.0.1,localhost --allow-unix-socket \
        --import-mode=importlib -ra -v tests

    DSPY_STAGED_ROOT="$_checkroot" \
    PYTHONPATH="$_staged" python -P - <<'PY'
import asyncio
import os
from pathlib import Path

import dspy
from dspy.utils import DummyLM

assert Path(dspy.__file__).resolve().is_relative_to(
    Path(os.environ["DSPY_STAGED_ROOT"]).resolve()
)
assert dspy.__version__ == "3.3.1"

lm = DummyLM([{"reasoning": "add two and two", "answer": "4"}])
with dspy.context(lm=lm):
    program = dspy.ChainOfThought("question -> answer")
    prediction = program(question="What is 2 + 2?")
assert prediction.answer == "4"
assert prediction.reasoning == "add two and two"

async def validate_async():
    async_lm = DummyLM([{"answer": "runtime-ready"}])
    with dspy.context(lm=async_lm):
        result = await dspy.Predict("request -> answer").acall(request="status")
    assert result.answer == "runtime-ready"

asyncio.run(validate_async())
print("staged DSPy sync/async deterministic programs passed")
PY
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
