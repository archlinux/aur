# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=bioinformatics-mcp
_pkgname=bioinformatics-mcp
pkgver=0.3.0
pkgrel=2
pkgdesc="Independent MCP servers for bioinformatics data services"
arch=('any')
url="https://github.com/imjiaoyuan/$_pkgname"
license=('MIT')
depends=('python>=3.10' 'python-mcp>=2' 'python-mcp<3' 'python-httpx>=0.28.1' 'python-httpx<1')
makedepends=('python-build' 'python-installer' 'python-hatchling>=1.32' 'python-hatchling<2')
checkdepends=('python-pytest')
optdepends=('uv: generate client configurations that install on demand with uvx')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('399ff193df796d280a5264528f55348b7e5f8922bf56ba5784ec169acac3a757')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    # Expose wheel metadata for entry point discovery without a system installation.
    # Transport tests require console scripts installed in the running interpreter.
    PYTHONPATH="$PWD/dist/bioinformatics_mcp-$pkgver-py3-none-any.whl${PYTHONPATH:+:$PYTHONPATH}" \
        python -m pytest -q --ignore=tests/test_mcp_transport.py
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 docs/mcp.md "$pkgdir/usr/share/doc/$pkgname/mcp.md"
}
