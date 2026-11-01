# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: devome <evinedeng@hotmail.com>

pkgname=python-langfuse
pkgver=5.1.0
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
sha256sums=('e46f7abcb16ac40fe9c1be0eaa0f9a4fc6c3e99b63a85fa0c2b69172e080fffe')

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
