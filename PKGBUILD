# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-sdk
pkgname=python-$_name
pkgver=0.2.4
pkgrel=2
pkgdesc="SDK for interacting with LangGraph API."
arch=('any')
license=('MIT')
url="https://github.com/langchain-ai/langgraph/tree/main/libs/sdk-py"
depends=('python' 'python-httpx' 'python-orjson')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-mock')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/langchain-ai/langgraph/refs/tags/${_name//langgraph-/}==$pkgver/docs/docs/cloud/reference/api/openapi.json")
sha256sums=('65c37fdb1d6f572deb7d5dda45aab79916c13c276a1e08b29309ae7729567a36'
            '913fd78ba3c023ae232d46a56dd8744ed211cb53dfa900714aefab6f2a3f6720')

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
