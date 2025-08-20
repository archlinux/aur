# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-sdk
pkgname=python-$_name
pkgver=0.2.2
pkgrel=1
pkgdesc="SDK for interacting with LangGraph API."
arch=('any')
license=('MIT')
url="https://github.com/langchain-ai/langgraph/tree/main/libs/sdk-py"
depends=('python' 'python-httpx' 'python-orjson')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/langchain-ai/langgraph/refs/tags/${_name//langgraph-/}==$pkgver/docs/docs/cloud/reference/api/openapi.json")
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-mock' 'python-pytest-watch')
sha256sums=('9484e8071953df75d7aaf9845d82db3595e485af7d5dcc235c9b32c52362e1fc'
            '341fbe397ea4cd1da4e0fcaf6d59f57b63e2e01aaf03bde273ecf9cf589bb3af')

prepare(){
  mkdir -p "$srcdir"/../docs/docs/cloud/reference/api
  cp -f "$srcdir"/openapi.json "$srcdir"/../docs/docs/cloud/reference/api/openapi.json
}

build() {
    cd "$srcdir"/${_name//-/_}-$pkgver
    python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  cd "$srcdir"/${_name//-/_}-$pkgver
  PYTHONPATH="$srcdir"/${_name//-/_}-$pkgver pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
