Already up to date.
# Maintainer: Jai Brown (AUR: JaINTP) <dev [at] jaintp [dot] com>
# Contributor: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>

_pkgname=chromadb
pkgname="python-${_pkgname}"
pkgver=1.5.9
pkgrel=1
pkgdesc="the AI-native open-source embedding database"
arch=("x86_64" "aarch64")
url="https://github.com/chroma-core/chroma"
license=('Apache-2.0')
depends=(python-bcrypt python-build python-chroma-hnswlib python-fastapi python-grpcio python-httpx python-importlib_resources python-jsonschema python-kubernetes python-mmh3 python-numpy python-onnxruntime python-opentelemetry-api python-opentelemetry-exporter-otlp-proto-grpc python-opentelemetry-instrumentation-fastapi python-opentelemetry-sdk python-orjson python-overrides python-posthog python-pybase64 python-pydantic python-pypika python-pyyaml python-rich python-tenacity python-tokenizers python-tqdm python-typer python-typing_extensions uvicorn)
makedepends=('python-build' 'python-installer' 'python-maturin' 'python-setuptools' 'python-setuptools-scm' 'rust')
options=(!lto)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('5c20e62a455c28bacac927f26116a73fd8e1799e0d908be8e8a4f02197a54731')

prepare() {
    cd "${_pkgname}-${pkgver}"

    # If the line exists, change the value to 512.
    # If it doesn't, append it to the top.
    find rust -name "lib.rs" -exec sed -i \
        '/recursion_limit/s/"[0-9]*"/"512"/; t; 1i #![recursion_limit = "512"]' {} +

    echo "Normalized recursion limits to 512 across all crates."
}

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}