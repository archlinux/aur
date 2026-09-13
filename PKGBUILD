# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-pylance
_pkgname=pylance
pkgver=11.0.0
pkgrel=1
pkgdesc="Python wrapper for the Lance columnar data format"
arch=('x86_64')
url="https://github.com/lance-format/lance"
license=('Apache-2.0')
depends=(
    'glibc'
    'libgcc'
    'python'
    'python-pyarrow>=14'
    'python-numpy>=1.22'
    'python-lance-namespace>=0.12'
    'python-lance-namespace<0.13'
    'zstd'
)
makedepends=(
    'lz4'
    'python-build'
    'python-installer'
    'python-wheel'
    'python-maturin'
    'rust'
    'protobuf'
    'cmake'
    'pkgconf'
    'openssl'
)
checkdepends=(
    'python-boto3'
    'python-datasets'
    'python-duckdb'
    'python-ml-dtypes'
    'python-pillow'
    'python-pandas'
    'python-polars'
    'python-psutil'
    'python-pytest'
    'python-pytest-socket'
    'python-pytest-xdist'
    'python-pytorch'
    'python-tensorflow'
    'python-tqdm'
)
optdepends=(
    'python-datasets: Hugging Face datasets integration'
    'python-duckdb: DuckDB interoperability'
    'python-ml-dtypes: bfloat16 array support'
    'python-pandas: pandas DataFrame input and output'
    'python-pillow: image array encoding and decoding'
    'python-polars: Polars DataFrame input and output'
    'python-pytorch: PyTorch datasets and accelerated vector indexing'
    'python-requests: tokenizer language-model downloads'
    'python-tensorflow: TensorFlow dataset and image support'
    'python-tqdm: vector training progress bars'
)
options=('!debug' '!lto')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/lance-format/lance/archive/refs/tags/v$pkgver.tar.gz"
    'lance-namespace-0.9.patch'
    'progress-callback-test.patch'
    'invalid-log-path-test.patch'
)
sha256sums=(
    'e2704758360cb3e38b038dd7cbcdea74970c208e5fbe57c1cc3ecbedb72f823c'
    '80cd3852ed8211bad598dc66a096dcd5f010b8c5a8a753aefc3c621b53ea5c07'
    '519728e2c691bdcfa82726c2da860c4f49464f9206059c27c58283a9b9423c9f'
    '2bd7d8c401dd65c557d621466cd71196a7058ffde0e81a72ee1bd1f29667814a'
)

prepare() {
    cd "lance-$pkgver"

    patch -Np1 -i "$srcdir/lance-namespace-0.9.patch"
    patch -Np1 -i "$srcdir/progress-callback-test.patch"
    patch -Np1 -i "$srcdir/invalid-log-path-test.patch"

    # Use the system Rust toolchain and generic Arch compiler flags.
    rm -f rust-toolchain.toml python/rust-toolchain.toml
    rm -f .cargo/config.toml python/.cargo/config.toml
}

build() {
    cd "lance-$pkgver/python"

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
    cd "lance-$pkgver/python"

    local _test_venv="$srcdir/test-venv"
    rm -rf "$_test_venv" "$srcdir/test-home" "$srcdir/pytest-tmp"
    mkdir -p "$srcdir/test-home"
    python -m venv --system-site-packages "$_test_venv"
    "$_test_venv/bin/python" -m installer dist/*.whl

    # The wheel is complete; discard the very large Rust target before tests.
    rm -rf "$srcdir/cargo-target"

    # Compatibility tests create pip-managed environments and download old
    # wheels; recurring tests require pre-generated datasets.  The upstream
    # integration marker remains disabled because it requires object storage.
    HOME="$srcdir/test-home" \
    HF_HUB_OFFLINE=1 \
    TRANSFORMERS_OFFLINE=1 \
    AWS_EC2_METADATA_DISABLED=true \
    PYTHONDONTWRITEBYTECODE=1 \
        "$_test_venv/bin/python" -m pytest -vv \
        -m 'not recurring' \
        --run-slow \
        --basetemp="$srcdir/pytest-tmp" \
        --disable-socket \
        --allow-hosts=127.0.0.1,localhost \
        --allow-unix-socket \
        --ignore=python/tests/compat \
        --ignore=python/tests/recurring \
        --deselect=python/tests/test_huggingface.py::test_write_hf_dataset \
        python/tests

    HOME="$srcdir/test-home" \
    PYTHONDONTWRITEBYTECODE=1 \
        "$_test_venv/bin/python" - <<'PY'
import tempfile

import pyarrow as pa
import lance
from lance_namespace import (
    CountTableRowsRequest,
    CountTableRowsResponse,
    CreateTableRequest,
    QueryTableRequest,
    QueryTableResponse,
    connect,
)

with tempfile.TemporaryDirectory() as tmpdir:
    table = pa.table(
        {
            "id": [1, 2, 3],
            "label": ["east", "north", "west"],
            "vector": pa.array(
                [[1.0, 0.0], [0.0, 1.0], [-1.0, 0.0]],
                type=pa.list_(pa.float32(), 2),
            ),
        }
    )
    dataset = lance.write_dataset(table, f"{tmpdir}/dataset.lance")
    assert dataset.count_rows() == 3
    assert dataset.scanner(filter="id > 1").to_table()["id"].to_pylist() == [2, 3]
    nearest = dataset.to_table(
        columns=["id", "label"],
        nearest={"column": "vector", "q": [0.9, 0.1], "k": 2},
    )
    assert nearest["label"][0].as_py() == "east"

    namespace = connect("dir", {"root": tmpdir})
    sink = pa.BufferOutputStream()
    with pa.ipc.new_stream(sink, table.schema) as writer:
        writer.write_table(table)
    namespace.create_table(
        CreateTableRequest(id=["table"]),
        sink.getvalue().to_pybytes(),
    )
    count = namespace.count_table_rows(CountTableRowsRequest(id=["table"]))
    assert isinstance(count, CountTableRowsResponse)
    assert count.count == 3
    result = namespace.query_table(
        QueryTableRequest(id=["table"], k=10, vector={})
    )
    assert isinstance(result, QueryTableResponse)
    assert isinstance(result.data, bytes)
    queried = pa.ipc.open_file(pa.BufferReader(result.data)).read_all()
    assert queried["id"].to_pylist() == [1, 2, 3]
PY

    rm -rf "$_test_venv" "$srcdir/test-home" "$srcdir/pytest-tmp"
}

package() {
    cd "lance-$pkgver/python"

    python -m installer --destdir="$pkgdir" dist/*.whl

    # The wheel includes pytest configuration as importable package data.  It
    # has no runtime purpose and would otherwise introduce a spurious pytest
    # dependency.
    find "$pkgdir/usr/lib" -path '*/site-packages/lance/conftest.py' -delete
    find "$pkgdir/usr/lib" -path '*/site-packages/lance/__pycache__/conftest*.pyc' \
        -delete

    # Maturin's generated SBOM records absolute paths for workspace crates.
    # Replace them with the corresponding public source-tree URL.
    local _sbom
    for _sbom in \
        "$pkgdir"/usr/lib/python*/site-packages/*.dist-info/sboms/*.json; do
        sed -i \
            "s#$srcdir/lance-$pkgver#https://github.com/lance-format/lance/tree/v$pkgver#g" \
            "$_sbom"
    done

    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
