# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-lance-namespace-urllib3-client
_pkgname=lance_namespace_urllib3_client
pkgver=0.12.0
pkgrel=1
pkgdesc="Auto-generated OpenAPI Python client for the Lance Namespace REST API"
arch=('any')
url="https://github.com/lance-format/lance-namespace"
license=('Apache-2.0')
depends=(
    'python'
    'python-urllib3<3'
    'python-dateutil>=2.8.2'
    'python-pydantic>=2'
    'python-typing_extensions>=4.7.1'
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
    cd "$_archive/python/$_pkgname"
    python -m build --wheel --no-isolation
}

check() {
    # The installed-client workflow below uses a real loopback HTTP server.
    # Keep localhost requests off outbound proxies.
    unset http_proxy https_proxy HTTP_PROXY HTTPS_PROXY all_proxy ALL_PROXY

    cd "$_archive/python/$_pkgname"

    local _checkdir="$srcdir/check-client"
    local _site
    rm -rf "$_checkdir"
    python -m installer --destdir="$_checkdir" dist/*.whl
    _site=$(python -c 'import site; print(site.getsitepackages()[0])')

    cd "$_checkdir"
    PYTHONPATH="$_checkdir$_site" \
        python -m pytest --import-mode=importlib -v \
        "$srcdir/$_archive/python/$_pkgname/test"

    # Exercise request serialization, urllib3 transport, and response
    # deserialization against a real local HTTP endpoint.
    PYTHONPATH="$_checkdir$_site" python - <<'PY'
import json
import threading
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer

from lance_namespace_urllib3_client import ApiClient, Configuration
from lance_namespace_urllib3_client.api.namespace_api import NamespaceApi
from lance_namespace_urllib3_client.models.create_namespace_request import (
    CreateNamespaceRequest,
)


class Handler(BaseHTTPRequestHandler):
    def do_POST(self):
        assert self.path == "/v1/namespace/acme%24analytics/create"
        length = int(self.headers["Content-Length"])
        payload = json.loads(self.rfile.read(length))
        assert payload == {
            "id": ["acme", "analytics"],
            "mode": "Create",
            "properties": {"region": "eu-west-1"},
        }
        body = json.dumps({
            "transaction_id": "txn-42",
            "properties": payload["properties"],
        }).encode()
        self.send_response(200)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)

    def log_message(self, *args):
        pass


server = ThreadingHTTPServer(("127.0.0.1", 0), Handler)
thread = threading.Thread(target=server.serve_forever, daemon=True)
thread.start()
try:
    configuration = Configuration(
        host=f"http://127.0.0.1:{server.server_address[1]}"
    )
    with ApiClient(configuration) as client:
        response = NamespaceApi(client).create_namespace(
            id="acme$analytics",
            create_namespace_request=CreateNamespaceRequest(
                id=["acme", "analytics"],
                mode="Create",
                properties={"region": "eu-west-1"},
            ),
        )
    assert response.transaction_id == "txn-42"
    assert response.properties == {"region": "eu-west-1"}
finally:
    server.shutdown()
    thread.join()
    server.server_close()
PY
}

package() {
    cd "$_archive/python/$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/$_archive/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
