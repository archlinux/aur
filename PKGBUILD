# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-lance-namespace
_pkgname=lance_namespace
pkgver=0.12.0
pkgrel=1
pkgdesc="Lance Namespace interface and plugin registry"
arch=('any')
url="https://github.com/lance-format/lance-namespace"
license=('Apache-2.0')
depends=(
    'python'
    "python-lance-namespace-urllib3-client=$pkgver"
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
)
checkdepends=(
    'python-pytest'
)
_archive="lance-namespace-$pkgver"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e6fce787eb7ae088029b50cca1bfc0abfd00541eed9386f2cc3981f8ed6ac6b7')

build() {
    cd "$srcdir/$_archive/python/$_pkgname"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/$_archive/python/$_pkgname"

    local _checkdir="$srcdir/check-namespace"
    local _site
    rm -rf "$_checkdir"
    python -m installer --destdir="$_checkdir" dist/*.whl
    _site=$(python -c 'import site; print(site.getsitepackages()[0])')

    cd "$_checkdir"
    PYTHONPATH="$_checkdir$_site" \
        python -m pytest --import-mode=importlib -v \
        "$srcdir/$_archive/python/$_pkgname/lance_namespace/tests"

    # Exercise the public registry, factory, models, and error mapping.
    PYTHONPATH="$_checkdir$_site" python - <<'PY'
from lance_namespace import (
    LanceNamespace,
    ListNamespacesRequest,
    ListNamespacesResponse,
    TableBranchNotFoundError,
    connect,
    from_error_code,
    register_namespace_impl,
)


class MemoryNamespace(LanceNamespace):
    def __init__(self, **properties):
        self.properties = properties

    def namespace_id(self):
        return f"memory://{self.properties['tenant']}"

    def list_namespaces(self, request):
        assert request.id == ["acme"]
        return ListNamespacesResponse(namespaces=["analytics"])


register_namespace_impl("memory", "__main__.MemoryNamespace")
namespace = connect("memory", {"tenant": "acme"})
assert namespace.namespace_id() == "memory://acme"
response = namespace.list_namespaces(ListNamespacesRequest(id=["acme"]))
assert response.namespaces == ["analytics"]
error = from_error_code(22, "missing branch")
assert isinstance(error, TableBranchNotFoundError)
assert error.code.value == 22
PY
}

package() {
    cd "$srcdir/$_archive/python/$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    local _site
    _site=$(python -c 'import site; print(site.getsitepackages()[0])')
    rm -rf "$pkgdir$_site/lance_namespace/tests"
    install -Dm644 "$srcdir/$_archive/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
