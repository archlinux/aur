# Maintainer: Smoolak <smoolak@gmail.com>

_pkgname=sensai-utils
pkgname="python-${_pkgname}"
pkgver=1.6.0
pkgrel=2
pkgdesc="Utilities from sensAI, the Python library for sensible AI"
arch=('any')
url="https://github.com/oraios/sensAI-utils"
license=('MIT')
depends=(
    'python'
    'python-typing_extensions>=4.6'
)
optdepends=(
    'python-boto3: Amazon S3 object access'
    'python-cloudpickle: cloudpickle serialization backend'
    'python-docstring-parser: docstring parsing for generated CLIs'
    'python-duckdb: SQL queries over pandas data frames'
    'python-joblib: joblib serialization backend'
    'python-jsonargparse: generated command-line interfaces'
    'python-matplotlib: plotting and TensorBoard visualizations'
    'python-numpy: numerical, data-frame, plotting and testing utilities'
    'python-pandas: data-frame, cache, time and logging utilities'
    'python-pyinstrument: profiling decorator'
    'python-pymysql: MySQL-backed caches'
    'python-scipy: probability-distribution utilities'
    'python-seaborn: statistical plotting utilities'
    'tensorboard: TensorBoard event readers'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=('python-pytest')
_archive="sensAI-utils-$pkgver"
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    'python-3.14-str-hash.patch'
)
sha256sums=(
    '1ccb2e094be2590638fe48a741317218bc263ab578f5ad5b5c9cc5c0a1f3e763'
    '06de8fe0c5be46c2466dfddefbbd8a29fc4e7635dd727e6df7f8803e173da82d'
)

prepare() {
    cd "$_archive"
    # str_hash passed a Unicode string directly to hashlib, which requires
    # bytes on every supported Python 3 release. Upstream stores this module
    # with CRLF line endings, so normalize it before applying the patch.
    sed -i 's/\r$//' src/sensai/util/hash.py
    patch -Np1 -i "$srcdir/python-3.14-str-hash.patch"
}

build() {
    cd "$_archive"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_archive"

    local _checkroot="$srcdir/_check"
    local _site
    rm -rf "$_checkroot"
    python -m installer --destdir="$_checkroot" dist/*.whl
    _site=$(python -c 'import site; print(site.getsitepackages()[0])')

    # Run upstream's complete import suite against the built wheel.
    cd "$srcdir"
    PYTHONPATH="$_checkroot$_site" pytest -ra "$_archive/tests"

    # Regression and representative core-utilities workflow: hashing strings
    # must consume UTF-8 bytes, and sorted lookup helpers must remain usable.
    PYTHONPATH="$_checkroot$_site" python - <<'PY'
from sensai.util.datastruct import SortedValues
from sensai.util.hash import str_hash

assert str_hash("invoice-42") == "6f81202867c00c09ab0c215da96cb639fbee872e"
values = SortedValues([10, 20, 35, 50])
assert values.floor_value(34) == 20
assert values.ceil_value(34) == 35
assert values.value_slice(15, 40) == [20, 35]
PY
}

package() {
    cd "$_archive"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
