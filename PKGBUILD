# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-sdk
pkgname=python-$_name
pkgver=0.4.2
pkgrel=1
pkgdesc="SDK for interacting with LangGraph API."
arch=('any')
url="https://github.com/langchain-ai/langgraph/tree/main/libs/sdk-py"
license=('MIT')
depends=('python' 'python-httpx' 'python-orjson' 'python-langchain-protocol' 'python-langchain-core' 'python-websockets' 'python-typing_extensions')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-mock' 'python-starlette' 'python-pydantic')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('b88f0f5f6328ac0680d6790614a905b2bcfa257f2276dba4e38f0e86db0aa738')

build() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    # Need API Keys
    --ignore tests/integration/test_remote_graph_v3.py
  )
  cd "$srcdir"/${_name//-/_}-$pkgver
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
