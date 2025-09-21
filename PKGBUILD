# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-sdk
pkgname=python-$_name
pkgver=0.2.9
pkgrel=1
pkgdesc="SDK for interacting with LangGraph API."
arch=('any')
license=('MIT')
url="https://github.com/langchain-ai/langgraph/tree/main/libs/sdk-py"
depends=('python' 'python-httpx' 'python-orjson')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-mock')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/langchain-ai/langgraph/refs/tags/${_name//langgraph-/}==$pkgver/docs/docs/cloud/reference/api/openapi.json")
sha256sums=('b3bd04c6be4fa382996cd2be8fbc1e7cc94857d2bc6b6f4599a7f2a245975303'
            'db5c2ef8dc5dc724d0c1972d35c11f4642cc9d2062d1084601fc2ae6483c5cd5')

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
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
