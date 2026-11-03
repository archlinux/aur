# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-pylance
_pkgname=pylance
pkgver=14.0.2
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
    'python-lance-namespace>=0.13'
    'python-lance-namespace<0.14'
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
    'python-ml-dtypes'
    'python-pillow'
    'python-pandas'
    'python-polars'
    'python-psutil'
    'python-pytest'
    'python-pytest-socket'
    'python-pytest-xdist'
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
options=('!debug' '!lto' '!strip')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/lance-format/lance/archive/refs/tags/v$pkgver.tar.gz"
    'progress-callback-test.patch'
    'invalid-log-path-test.patch'
)
sha256sums=(
    '91228e11ded856254fcfb389c965ae57bfffc43365bbf72fccd1971feb7a8d31'
    '3cd69e6fbfd972dcd79a1ce63fd035a12a74e476f62800910801cd04d365b1b0'
    '34bd5ed151329068b9eb2839c6815a0c36541ba05208023fbfce0547a829181e'
)

prepare() {
    cd "lance-$pkgver"

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

    # Representative upstream CPU coverage: files, schemas, filtering, dataset
    # mutations, fragments, vector indexes and the current public namespace API.
    # Upstream marks continue to skip external storage, large slow cases and GPU.
    # Spawn needs a real main file and the source-only python.tests namespace.
    # Runtime lance remains in the installed venv, checked before and after pytest.
    cat > "$srcdir/run-installed-tests.py" <<'PYTEST'
import os
from pathlib import Path
import sys
import lance
import pytest

def main():
    staged = Path(os.environ["LANCE_STAGED_ROOT"]).resolve()
    assert Path(lance.__file__).resolve().is_relative_to(staged)
    tests = Path(os.environ["LANCE_TEST_ROOT"])
    selected = ["test_arrow.py", "test_dataset.py", "test_file.py", "test_filter.py",
                "test_fragment.py", "test_schema.py", "test_vector_index.py",
                "test_namespace_dir.py", "test_log.py"]
    result = pytest.main(["-vv", "--import-mode=importlib",
        "--basetemp=" + os.environ["LANCE_PYTEST_TMP"], "--disable-socket",
        "--allow-hosts=127.0.0.1,localhost", "--allow-unix-socket",
        *[str(tests / name) for name in selected]])
    for name, module in tuple(sys.modules.items()):
        if name == "lance" or name.startswith("lance."):
            origin = getattr(module, "__file__", None)
            if origin:
                assert Path(origin).resolve().is_relative_to(staged), (name, origin)
    raise SystemExit(result)

if __name__ == "__main__":
    main()
PYTEST
    LANCE_STAGED_ROOT="$_test_venv" \
    LANCE_TEST_ROOT="$PWD/python/tests" \
    LANCE_PYTEST_TMP="$srcdir/pytest-tmp" \
    HF_HUB_OFFLINE=1 TRANSFORMERS_OFFLINE=1 AWS_EC2_METADATA_DISABLED=true \
    PYTHONDONTWRITEBYTECODE=1 PYTHONPATH="$PWD:$PWD/python/tests" \
        "$_test_venv/bin/python" -P "$srcdir/run-installed-tests.py"

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
record, = site.glob("pylance-*.dist-info/RECORD")
with record.open(newline="") as stream:
    rows = list(csv.reader(stream))
kept = []
for row in rows:
    name = row[0]
    if name == "lance/conftest.py" or (
        name.startswith("lance/__pycache__/conftest") and name.endswith(".pyc")
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
