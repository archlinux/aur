# Maintainer: Smoolak <smoolak@gmail.com>
pkgname=python-transfer-queue
pkgver=0.1.12
pkgrel=1
pkgdesc='Asynchronous streaming tensor data management for distributed training'
arch=('any')
url='https://github.com/Ascend/TransferQueue'
license=('Apache-2.0')
depends=(
    'python' 'python-cloudpickle' 'python-hydra-core' 'python-msgspec'
    'python-numpy' 'python-omegaconf' 'python-prometheus_client>=0.20.0'
    # Public Hydra imports Packaging at runtime from hydra.version.
    'python-packaging'
    'python-psutil' 'python-pytorch' 'python-pyzmq' 'python-ray'
    'python-tensordict>=0.10.0'
    # The upstream ray[default] requirement, using packaged providers.
    'python-aiohttp' 'python-aiohttp-cors' 'python-colorful' 'python-grpcio'
    'python-opencensus' 'python-opentelemetry-sdk'
    'python-opentelemetry-exporter-prometheus' 'python-smart-open'
    'python-virtualenv' 'py-spy'
    # The public py-spy binary links libunwind but declares it only for building.
    'libunwind'
)
# Public Hydra imports pkg_resources while building. Pyvers uses pip.
makedepends=('python-pkg-resources' 'python-pip' 'python-build' 'python-installer' 'python-setuptools>=61' 'python-wheel')
checkdepends=('python-pytest>=7' 'python-pytest-asyncio>=0.20' 'python-pytest-mock')
optdepends=('python-netifaces: network interface discovery for Yuanrong storage')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cf232dbc9630b2c74dbb1c9d0de54c240c6e5d7fa29deacabdc7d842240eef89')

prepare() {
    cd "TransferQueue-$pkgver"
    # Only install the public package, not top-level tests/tutorial namespaces.
    printf '\n[tool.setuptools.packages.find]\ninclude = ["transfer_queue*"]\n' >> pyproject.toml
    # The upstream fixture mocks an optional module that need not exist.
    # create=True makes its attribute patch consistent with that premise.
    sed -i 's/"transfer_queue.storage.clients.yuanrong_client.datasystem", ds_mock)/"transfer_queue.storage.clients.yuanrong_client.datasystem", ds_mock, create=True)/' \
        tests/test_yuanrong_storage_client_e2e.py
}

build() {
    cd "TransferQueue-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "TransferQueue-$pkgver"
    local site
    site=$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')
    python -m installer --destdir="$srcdir/check-root" dist/*.whl
    cp -a tests "$srcdir/check-tests"
    cd "$srcdir"
    # Real local Ray/ZMQ servers and the default SimpleStorage backend.
    # Upstream's hardware/optional-provider skip markers remain unchanged;
    # no CPU tests are deselected. No external Mooncake/Yuanrong cluster exists.
    CUDA_VISIBLE_DEVICES= HIP_VISIBLE_DEVICES= ROCR_VISIBLE_DEVICES= \
    TQ_TEST_BACKEND=SimpleStorage RAY_TMPDIR="$srcdir/ray" \
    PYTHONPATH="$srcdir/check-root$site" \
        python -m pytest -q -ra -o addopts='' --basetemp="$srcdir/pytest-tmp" \
        --junitxml="$srcdir/pytest-results.xml" check-tests
}

package() {
    cd "TransferQueue-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
