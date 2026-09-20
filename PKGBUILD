# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-kubernetes-asyncio
_pkgname=kubernetes_asyncio
pkgver=36.1.0
pkgrel=1
pkgdesc='Asynchronous Python client for Kubernetes'
arch=('any')
url='https://github.com/tomplus/kubernetes_asyncio'
license=('Apache-2.0')
depends=(
    'python-aiohttp>=3.9'
    'python-certifi'
    'python-dateutil'
    'python-six'
    'python-urllib3'
    'python-yaml'
)
makedepends=(
    'python-build'
    'python-hatchling'
    'python-installer'
    'python-wheel'
)
checkdepends=(
    'python-pytest'
    'python-pytest-cov'
    'python-pytest-xdist'
)
_commit=7ddbf3037cdb0f9a152c9f0c06e003fc5fc98db5
source=("$pkgname-$pkgver.tar.gz::https://github.com/tomplus/kubernetes_asyncio/archive/$_commit.tar.gz")
sha256sums=('f8e94052e9968a0bacb6e7f8ecf585bf64750812208311ff44bf5a3f906c07e4')

build() {
    cd "$_pkgname-$_commit"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$_commit"
    local check_install="$srcdir/check-install"
    local site_packages
    rm -rf "$check_install"
    python -m installer --destdir="$check_install" dist/*.whl
    site_packages=$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')

    PYTHONPATH="$check_install$site_packages" \
        python -P -m pytest -vv --import-mode=importlib kubernetes_asyncio/test

    PYTHONPATH="$check_install$site_packages" python -P - <<'PY'
import asyncio

from kubernetes_asyncio import client

async def workflow():
    container = client.V1Container(name="trainer", image="example.invalid/train:1")
    pod = client.V1Pod(
        metadata=client.V1ObjectMeta(name="cpu-training", labels={"app": "trainer"}),
        spec=client.V1PodSpec(containers=[container], restart_policy="Never"),
    )
    async with client.ApiClient() as api_client:
        serialized = api_client.sanitize_for_serialization(pod)
    assert serialized["metadata"]["name"] == "cpu-training"
    assert serialized["spec"]["containers"][0]["image"].endswith("train:1")
    assert serialized["spec"]["restartPolicy"] == "Never"

asyncio.run(workflow())
PY
}

package() {
    cd "$_pkgname-$_commit"
    python -m installer --compile-bytecode=1 --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
