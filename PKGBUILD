# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: devome <evinedeng@hotmail.com>

pkgname=python-langfuse
pkgver=4.14.2
pkgrel=1
pkgdesc="A client library for accessing langfuse"
arch=(any)
url="https://github.com/langfuse/langfuse-python"
license=(MIT)
depends=(
    python
    python-backoff # AUR
    python-httpx
    python-opentelemetry-api
    python-opentelemetry-sdk
    python-opentelemetry-exporter-otlp-proto-http
    python-packaging
    python-pydantic
    python-requests
    python-wrapt)
makedepends=(python-build python-installer python-uv-build python-wheel)
optdepends=(python-langchain python-llama-index python-openai)
install=migration-notice.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b29c13a616078682ceecb71ec49792fcbea3bf4a150f46a676057a0dcf64608b')

prepare() {
    cd "langfuse-python-$pkgver"
    sed -i '/requires =/c\requires = ["uv_build"]' pyproject.toml
}

build() {
    cd "langfuse-python-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "langfuse-python-$pkgver"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    local _site=$(python -c "import site; print(site.getsitepackages()[0])")
    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s "$_site/langfuse-$pkgver.dist-info/licenses/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
