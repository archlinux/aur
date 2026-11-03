# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-lancedb
_pkgname=lancedb
pkgver=0.41.0
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
    'python-lance-namespace>=0.13'
    'python-lance-namespace<0.14'
    'python-lance-namespace-urllib3-client>=0.13'
    'python-lance-namespace-urllib3-client<0.14'
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
    'python-boto3'
    'python-pandas'
    'python-polars'
    'python-pylance>=14.0.2'
    'python-pytest'
    'python-pytest-asyncio'
    'python-pytest-socket'
)

optdepends=(
    'python-pylance>=14.0.2: expose tables as Lance datasets and DataFusion providers'
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
    'aws-cli: AWS authentication helpers for Bedrock'
    'python-ollama>=0.3.0: Ollama embeddings'
    'python-requests>=2.31.0: HTTP-backed embedding integrations'
)
options=('!debug' '!lto' '!strip')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/lancedb/lancedb/archive/refs/tags/v$pkgver.tar.gz"
    'system-dependencies.patch'
    'lance-namespace-0.13.patch'
)
sha256sums=(
    '5e2820bedee7556af2a1194488784a517622cb7c4ead366704e95ea874739358'
    '7c1f3ab58374a036b54bb95ce036f119e48896d2fa4ecad41623dfdb4eef98ef'
    '8fa5b5e8e8aa0294c11be2d9168ef5883c594542b76e7190c682afb54692a959'
)

prepare() {
    cd "lancedb-$pkgver"

    patch -Np1 -i "$srcdir/system-dependencies.patch"
    patch -Np1 -i "$srcdir/lance-namespace-0.13.patch"

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

    # Exercise the installed wheel with upstream local database, table, query,
    # index, FTS, SQL, schema and namespace cases. Hosted/S3 and slow cases keep
    # their upstream marks. Optional model-inference suites need model assets.
    LANCEDB_STAGED_ROOT="$_test_venv" \
    LANCEDB_TEST_ROOT="$PWD/python/tests" \
    LANCEDB_PYTEST_TMP="$srcdir/pytest-tmp-tests" \
    HF_HUB_OFFLINE=1 TRANSFORMERS_OFFLINE=1 AWS_EC2_METADATA_DISABLED=true \
    AWS_REGION=us-east-1 AWS_DEFAULT_REGION=us-east-1 \
    PYTHONDONTWRITEBYTECODE=1 PYTHONPATH="$PWD/python/tests" \
        "$_test_venv/bin/python" -P - <<'PYTEST'
import os
from pathlib import Path
import sys
import lancedb
import pytest

staged = Path(os.environ["LANCEDB_STAGED_ROOT"]).resolve()
assert Path(lancedb.__file__).resolve().is_relative_to(staged)
tests = Path(os.environ["LANCEDB_TEST_ROOT"])
selected = ["test_db.py", "test_table.py", "test_query.py", "test_index.py",
            "test_fts.py", "test_sql.py", "test_pydantic.py", "test_namespace.py",
            "test_namespace_integration.py", "test_io.py"]
result = pytest.main(["-vv", "--import-mode=importlib", "-m", "not slow and not s3_test",
    "--basetemp=" + os.environ["LANCEDB_PYTEST_TMP"], "--disable-socket",
    "--allow-hosts=127.0.0.1,localhost", "--allow-unix-socket",
    *[str(tests / name) for name in selected]])
for name, module in tuple(sys.modules.items()):
    if name == "lancedb" or name.startswith("lancedb."):
        origin = getattr(module, "__file__", None)
        if origin:
            assert Path(origin).resolve().is_relative_to(staged), (name, origin)
raise SystemExit(result)
PYTEST

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
            "s#$srcdir/lancedb-$pkgver#https://github.com/lancedb/lancedb/tree/v$pkgver#g" \
            "$_sbom"
    done

    # Keep wheel metadata consistent with the intentionally removed test
    # configuration and rewritten SBOM paths, including content hashes.
    python - "$pkgdir" <<'PYRECORD'
import base64
import csv
import hashlib
from pathlib import Path
import sys
import sysconfig

site = Path(sys.argv[1]) / sysconfig.get_path("purelib").lstrip("/")
record, = site.glob("lancedb-*.dist-info/RECORD")
with record.open(newline="") as stream:
    rows = list(csv.reader(stream))
kept = []
for row in rows:
    name = row[0]
    if name == "lancedb/conftest.py" or (
        name.startswith("lancedb/__pycache__/conftest") and name.endswith(".pyc")
    ):
        assert not (site / name).exists(), name
        continue
    if name.startswith(record.parent.name + "/sboms/"):
        data = (site / name).read_bytes()
        checksum = base64.urlsafe_b64encode(hashlib.sha256(data).digest()).rstrip(b"=").decode()
        row[1:] = ["sha256=" + checksum, str(len(data))]
    kept.append(row)
with record.open("w", newline="") as stream:
    csv.writer(stream, lineterminator="\n").writerows(kept)
PYRECORD

    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
