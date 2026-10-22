# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>

_pkgname=qdrant-client
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.20.0
pkgrel=1
pkgdesc="Client library for the Qdrant vector search engine"
arch=('any')
url="https://github.com/qdrant/qdrant-client"
license=('Apache-2.0')
depends=(
    'python'
    'python-grpcio'
    'python-h2'
    'python-httpx'
    'python-numpy'
    'python-protobuf'
    'python-pydantic'
    'python-urllib3'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-poetry-core'
    'python-wheel'
)
checkdepends=(
    'python-autoflake'
    'python-pytest'
    'python-pytest-asyncio'
    'python-pytest-mock'
    'ruff'
)
# Upstream's separate fastembed-gpu distribution has no exact Arch/AUR
# package; the packaged CPU FastEmbed integration remains advertised.
optdepends=(
    'python-fastembed: local embedding generation (fastembed extra)'
    'python-orjson: faster JSON serialization (orjson extra)'
)
_archive="${_pkgname}-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        'posix-file-locking.patch'
        'test-posix-locking.py')
sha256sums=('96f62fca4d8910f9406da2037f4a70f0e8eadb2742f2d07207617f21faea5047'
            'e8869a82eef0a3f86582269d20e10b0baf4659efaaf905c3c779dc02f62fb1be'
            '91215605d593a304cd1637ac18c9100d99377c056ccb5cbdad00cf6fb29d2d61')

prepare() {
    cd "${_archive}"
    # The public Portalocker recipe cannot build with Arch's current uv-build.
    # On Arch, use the same flock API through Python's POSIX standard library.
    patch -Np1 -i "$srcdir/posix-file-locking.patch"
}

build() {
    cd "${_archive}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_archive}"

    # Regenerate the schema inspection cache and compare it with the release.
    # The async-client generator is intentionally not run: upstream pins Ruff
    # 0.4.3 and newer Ruff releases produce a formatting-only diff.
    bash tests/inspection-cache-consistency-check.sh

    rm -rf "$srcdir/test-install"
    python -m installer --destdir="$srcdir/test-install" dist/*.whl
    local site_packages
    site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
    local staged="$srcdir/test-install$site_packages"

    # Run every upstream test that is self-contained. Congruence, benchmark,
    # remote inference and the remaining client tests need a live Qdrant
    # daemon; FastEmbed model tests skip when the optional extra is absent.
    local tests=(
        qdrant_client/local/tests
        qdrant_client/hybrid
        tests/conversions
        tests/test_common.py
        tests/test_in_memory.py
        tests/test_local_persistence.py
        tests/test_tracing.py
        tests/embed_tests/test_inspectors.py
        tests/embed_tests/test_schema_parser.py
        tests/embed_tests/test_utils.py
        tests/test_fastembed.py
        tests/test_qdrant_client.py::test_client_init
        'tests/test_qdrant_client.py::test_qdrant_client_integration[True-False-False]'
        'tests/test_qdrant_client.py::test_qdrant_client_integration[True-False-True]'
        'tests/test_qdrant_client.py::test_qdrant_client_integration[True-True-False]'
        'tests/test_qdrant_client.py::test_qdrant_client_integration[True-True-True]'
        tests/test_qdrant_client.py::test_has_id_condition
        tests/test_qdrant_client.py::test_insert_float
        tests/test_qdrant_client.py::test_value_serialization
        tests/test_qdrant_client.py::test_serialization
        tests/test_async_qdrant_client.py::test_async_qdrant_client_local
        'tests/test_migrate.py::test_single_vector_collection[local_client-second_local_client]'
        'tests/test_migrate.py::test_multiple_vectors_collection[local_client-second_local_client]'
        'tests/test_migrate.py::test_single_multivector_collection[local_client-second_local_client]'
        'tests/test_migrate.py::test_multivectors_collection[local_client-second_local_client]'
        'tests/test_migrate.py::test_sparse_vector_collection[local_client-second_local_client]'
        'tests/test_migrate.py::test_migrate_all_collections[local_client-second_local_client]'
        'tests/test_migrate.py::test_migrate_particular_collections[local_client-second_local_client]'
        'tests/test_migrate.py::test_action_on_collision[local_client-second_local_client]'
        tests/test_migrate.py::test_migrate_missing_collections
    )

    PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 \
        PYTHONPATH="$staged" \
        python -P -m pytest -c /dev/null -p no:cacheprovider \
        -p pytest_asyncio.plugin -p pytest_mock \
        --asyncio-mode=auto --rootdir=. --import-mode=importlib -v \
        "${tests[@]}"

    PYTHONPATH="$staged" python -P "$srcdir/test-posix-locking.py"

    PYTHONPATH="$staged" python -P - <<'PY'
import importlib.metadata
import tempfile

from qdrant_client import QdrantClient, models

assert importlib.metadata.version("qdrant-client") == "1.20.0"
with tempfile.TemporaryDirectory() as path:
    client = QdrantClient(path=path)
    client.create_collection(
        "crew",
        vectors_config=models.VectorParams(size=3, distance=models.Distance.COSINE),
    )
    client.upsert(
        "crew",
        points=[
            models.PointStruct(id=1, vector=[1.0, 0.0, 0.0], payload={"part": "core"}),
            models.PointStruct(id=2, vector=[0.0, 1.0, 0.0], payload={"part": "cli"}),
        ],
    )
    result = client.query_points("crew", query=[1.0, 0.0, 0.0], limit=1).points
    assert result[0].id == 1
    assert client.count("crew").count == 2
    client.close()

    reopened = QdrantClient(path=path)
    assert reopened.retrieve("crew", ids=[2])[0].payload == {"part": "cli"}
    reopened.close()
PY
}

package() {
    cd "${_archive}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
