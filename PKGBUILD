# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-nats-py
_pkgname=nats.py
pkgver=2.16.0
pkgrel=2
pkgdesc="Asyncio NATS client for Python"
arch=('any')
url="https://github.com/nats-io/nats.py"
license=('Apache-2.0')
depends=('python>=3.7')
optdepends=(
    'python-aiohttp: WebSocket transport support'
    'python-fast-mail-parser: accelerated message-header parsing'
    'python-nkeys: NKey and JWT authentication support'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-uv-build>=0.9.28'
)
checkdepends=(
    'nats-server>=2.12'
    'python-aiofiles'
    'python-aiohttp'
    'python-nkeys'
    'python-pytest>=9.0.3'
    'python-pytest-asyncio>=0.21'
)
_archive="$_pkgname-$pkgver"
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    'fast-parser-header-name-validation.patch'
)
sha256sums=(
    'efe0fe244f02c18de7816a214825e383fcd8d38382ba8d6faf51abc3d142e7a8'
    '44e236d00ac84672c8fbe58c61339593fa192c14a4d55ed594e1b8378bf23c90'
)

prepare() {
    cd "$_archive"

    # Arch ships uv_build 0.11, whose backend remains compatible with this
    # pure-Python project; drop upstream's build-environment-only <0.10 pin.
    sed -i 's/uv_build>=0.9.28,<0.10.0/uv_build>=0.9.28/' nats/pyproject.toml

    # Keep optional fast_mail_parser behavior aligned with the built-in
    # parser: malformed non-ASCII header names are not valid tokens.
    patch -Np1 -i "$srcdir/fast-parser-header-name-validation.patch"
}

build() {
    cd "$_archive/nats"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_archive"

    local _checkroot="$srcdir/_check"
    local _server_version
    local _site
    rm -rf "$_checkroot"
    python -m installer --destdir="$_checkroot" nats/dist/*.whl
    _site=$(python -c 'import site; print(site.getsitepackages()[0])')

    # Exercise the built-in header parser: the optional fast-mail-parser's
    # public test dependencies cannot currently provide a working mailparser.
    # Keep the upstream suite; it handles the accelerator's absence itself.
    # This run does not cover accelerated parsing. Upstream also skips two
    # flaky cases and its external multi-client compatibility harness.
    _server_version=$(nats-server --version | awk '{print $2}')
    NATS_SERVER_VERSION="$_server_version" \
        PYTHONPATH="$_checkroot$_site:$PWD/nats" \
        pytest -vv -s \
        nats/tests/test_client.py::ProcessHeadersTest::test_non_ascii_in_name_is_skipped_not_replaced
    NATS_SERVER_VERSION="$_server_version" \
        PYTHONPATH="$_checkroot$_site:$PWD/nats" \
        pytest -vv -s --continue-on-collection-errors nats/tests

    # Representative installed-wheel workflow: request/reply plus JetStream.
    PYTHONPATH="$_checkroot$_site" python - <<'PY'
import asyncio
import subprocess
import tempfile

import nats


async def exercise():
    with tempfile.TemporaryDirectory() as store:
        server = subprocess.Popen(
            [
                "nats-server",
                "-a", "127.0.0.1",
                "-p", "45222",
                "-m", "48222",
                "-js",
                "-sd", store,
            ],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )
        try:
            for _ in range(100):
                try:
                    nc = await nats.connect("nats://127.0.0.1:45222")
                    break
                except (ConnectionRefusedError, OSError):
                    await asyncio.sleep(0.05)
            else:
                raise RuntimeError("nats-server did not become ready")

            async def responder(message):
                await message.respond(message.data.upper())

            await nc.subscribe("orders.normalize", cb=responder)
            response = await nc.request("orders.normalize", b"invoice-42", timeout=2)
            assert response.data == b"INVOICE-42"

            js = nc.jetstream()
            await js.add_stream(name="ORDERS", subjects=["orders.created"])
            ack = await js.publish("orders.created", b"invoice-42")
            assert ack.stream == "ORDERS" and ack.seq == 1
            stored = await js.get_msg("ORDERS", seq=1)
            assert stored.data == b"invoice-42"
            await nc.drain()
        finally:
            server.terminate()
            try:
                server.wait(timeout=5)
            except subprocess.TimeoutExpired:
                server.kill()
                server.wait(timeout=5)


asyncio.run(exercise())
PY
}

package() {
    cd "$_archive/nats"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
