# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-lancedb
_pkgname=lancedb
pkgver=0.38.0
pkgrel=1
pkgdesc="Serverless, low-latency vector database for AI applications"
arch=('x86_64')
url="https://github.com/lancedb/lancedb"
license=('Apache-2.0')
depends=(
    'glibc'
    'libgcc'
    'python'
    'python-deprecation>=2.1.0'
    'python-numpy>=1.24.0'
    'python-packaging>=23.0'
    'python-pyarrow>=16'
    'python-pydantic>=2.7.4'
    'python-pydantic<3'
    'python-tqdm>=4.27.0'
    'python-typing_extensions>=4.0.0'
    'python-lance-namespace>=0.12'
    'python-lance-namespace<0.13'
    'python-lance-namespace-urllib3-client>=0.12'
    'python-lance-namespace-urllib3-client<0.13'
    'zstd'
)
makedepends=(
    'lz4'
    'python-build'
    'python-installer'
    'python-wheel'
    'python-maturin'
    'rust'
    'cmake'
    'protobuf'
    'pkgconf'
)
checkdepends=(
    'python-datasets'
    'python-duckdb'
    'python-pandas'
    'python-pillow'
    'python-polars'
    'python-pylance>=8'
    'python-pytest'
    'python-pytest-asyncio'
    'python-pytest-socket'
    'python-pytorch'
)
optdepends=(
    'python-pylance>=8: expose tables as Lance datasets and DataFusion providers'
    'python-datasets: Hugging Face Dataset and DatasetDict input'
    'python-pandas>=1.4: pandas DataFrame input and output'
    'python-polars>=0.19: Polars DataFrame input and output'
    'python-duckdb>=0.9.0: DuckDB interoperability'
    'python-pytorch>=2: tensor conversion and model-backed embeddings'
    'python-pillow>=12.1.1: image embeddings'
    'python-openai>=1.6.1: OpenAI embeddings and reranking'
    'python-sentence-transformers>=2.2.0: Sentence Transformers embeddings and reranking'
    'python-transformers>=4.41.0: Transformers, SigLIP, and ColPali embeddings'
    'python-sentencepiece>=0.1.99: tokenizer support for selected embedding models'
    'python-open-clip-torch>=2.20.0: OpenCLIP embeddings'
    'python-cohere>=4: Cohere embeddings and reranking'
    'python-huggingface-hub>=0.19.0: Hugging Face model downloads'
    'python-google-genai>=1.0.0: Gemini embeddings'
    'python-boto3>=1.28.57: Amazon Bedrock embeddings'
    'aws-cli>=1.44.38: AWS authentication helpers for Bedrock'
    'python-ollama>=0.3.0: Ollama embeddings'
    'python-requests>=2.31.0: HTTP-backed embedding integrations'
)
options=('!debug' '!lto')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/lancedb/lancedb/archive/refs/tags/v$pkgver.tar.gz"
    'typing-extensions-runtime.patch'
    'lance-namespace-0.9.patch'
    'offline-image-test.patch'
    'polars-1.x-tests.patch'
    'optional-transformers-test.patch'
)
sha256sums=(
    '1d3671e9391a897c8955ac44f0781d27bd2b67168cb03c3a64be787dfc8d1723'
    '2e8dbb4391f60927e81a3e3bbb94b0a8bdb84c1ebf9afb31965bcac338d46d03'
    '7a99c9c4d594c6626145a94f01db0fb2e8132a9b1b6b362a4e98afb11e1656f3'
    'ccf35839209d9560ac49075b9a901e8c5eb5ae0c44c6307638699bfd4a38ad50'
    'e1bc2daf56514eaf19604d51cd7fce0b664a4f1834906f637430e3413ed20219'
    '6c7e206e537187776529d69a4b5ac2aeabc80e9750e9eec6a4cbbc1ddc0b5807'
)

prepare() {
    cd "lancedb-$pkgver"

    patch -Np1 -i "$srcdir/typing-extensions-runtime.patch"
    patch -Np1 -i "$srcdir/lance-namespace-0.9.patch"
    patch -Np1 -i "$srcdir/offline-image-test.patch"
    patch -Np1 -i "$srcdir/polars-1.x-tests.patch"
    patch -Np1 -i "$srcdir/optional-transformers-test.patch"
    # DataFusion emits uppercase SQL IN; the mock server must apply the
    # requested row filter instead of silently returning its entire dataset.
    sed -i '/match = re.search/s/, filter_sql)/, filter_sql, flags=re.IGNORECASE)/' \
        python/python/tests/test_torch.py

    # Use the system Rust toolchain and generic Arch compiler flags.
    rm -f rust-toolchain.toml python/rust-toolchain.toml
    rm -f .cargo/config.toml python/.cargo/config.toml
}

build() {
    cd "lancedb-$pkgver/python"

    # Maturin includes bytecode found in the Python source tree; discard files
    # left by an interrupted/repeated build before creating the wheel.
    find python -type d -name __pycache__ -prune -exec rm -rf {} +
    rm -rf dist

    export CARGO_INCREMENTAL=0
    export CARGO_TARGET_DIR="$srcdir/cargo-target"
    export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/usr/src/debug/$pkgname-$pkgver"
    export ZSTD_SYS_USE_PKG_CONFIG=1
    export LZ4_SYS_USE_PKG_CONFIG=1

    python -m build --wheel --no-isolation
}

check() {
    cd "lancedb-$pkgver/python"

    local _test_venv="$srcdir/test-venv"
    rm -rf "$_test_venv" "$srcdir/test-home" \
        "$srcdir/pytest-tmp-tests" "$srcdir/pytest-tmp-slow"
    mkdir -p "$srcdir/test-home"
    python -m venv --system-site-packages "$_test_venv"
    "$_test_venv/bin/python" -m installer dist/*.whl

    # The wheel is complete; discard the very large Rust target before tests.
    rm -rf "$srcdir/cargo-target"

    # The image retrieval test is patched to use a local HTTP server.
    HOME="$srcdir/test-home" \
    HF_HUB_OFFLINE=1 \
    TRANSFORMERS_OFFLINE=1 \
    AWS_EC2_METADATA_DISABLED=true \
    AWS_REGION=us-east-1 \
    AWS_DEFAULT_REGION=us-east-1 \
    PYTHONDONTWRITEBYTECODE=1 \
        "$_test_venv/bin/python" -m pytest -vv \
        -m 'not slow and not s3_test' \
        --basetemp="$srcdir/pytest-tmp-tests" \
        --disable-socket \
        --allow-hosts=127.0.0.1,localhost \
        --allow-unix-socket \
        python/tests

    # Exercise the one self-contained slow test; the other slow tests download
    # models, contact hosted embedding APIs, or require unpackageable extras.
    HOME="$srcdir/test-home" \
    HF_HUB_OFFLINE=1 \
    TRANSFORMERS_OFFLINE=1 \
    AWS_EC2_METADATA_DISABLED=true \
    PYTHONDONTWRITEBYTECODE=1 \
        "$_test_venv/bin/python" -m pytest -vv \
        --basetemp="$srcdir/pytest-tmp-slow" \
        --disable-socket \
        --allow-hosts=127.0.0.1,localhost \
        --allow-unix-socket \
        python/tests/test_embeddings.py::test_embedding_function_rate_limit

    HOME="$srcdir/test-home" \
    PYTHONDONTWRITEBYTECODE=1 \
        "$_test_venv/bin/python" - <<'PY'
import tempfile

import lancedb

with tempfile.TemporaryDirectory() as tmpdir:
    db = lancedb.connect(tmpdir)
    table = db.create_table(
        "items",
        data=[
            {"id": 1, "vector": [1.0, 0.0], "label": "north"},
            {"id": 2, "vector": [0.0, 1.0], "label": "east"},
            {"id": 3, "vector": [-1.0, 0.0], "label": "south"},
        ],
    )
    result = table.search([0.9, 0.1]).limit(2).to_arrow()
    assert result["label"].to_pylist()[0] == "north"
    assert table.count_rows("id >= 2") == 2

    lance_dataset = table.to_lance()
    assert lance_dataset.count_rows() == 3
PY

    rm -rf "$_test_venv" "$srcdir/test-home" \
        "$srcdir/pytest-tmp-tests" "$srcdir/pytest-tmp-slow"
}

package() {
    cd "lancedb-$pkgver/python"

    python -m installer --destdir="$pkgdir" dist/*.whl

    # The wheel includes pytest-only doctest configuration as importable
    # package data.  It has no runtime purpose and would otherwise introduce a
    # spurious pytest dependency.
    find "$pkgdir/usr/lib" -path '*/site-packages/lancedb/conftest.py' -delete
    find "$pkgdir/usr/lib" \
        -path '*/site-packages/lancedb/__pycache__/conftest*.pyc' -delete

    # Maturin's generated SBOM records absolute paths for workspace crates.
    # Replace them with the corresponding public source-tree URL.
    local _sbom
    for _sbom in \
        "$pkgdir"/usr/lib/python*/site-packages/*.dist-info/sboms/*.json; do
        sed -i \
            "s#$srcdir/lancedb-$pkgver#https://github.com/lancedb/lancedb/tree/python-v$pkgver#g" \
            "$_sbom"
    done

    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
