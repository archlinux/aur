# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-prebuilt
pkgname=python-$_name
pkgver=1.0.6
pkgrel=1
pkgdesc="Library with high-level APIs for creating and executing LangGraph agents and tools."
arch=('any')
license=('MIT')
url="https://github.com/langchain-ai/langgraph/tree/main/libs/prebuilt"
_repo='https://github.com/langchain-ai/langgraph'
depends=('python' 'python-langgraph-checkpoint' 'python-langchain-core')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-mock' 'python-langgraph' 'python-langgraph-checkpoint-sqlite' 'python-langgraph-checkpoint-postgres' 'python-syrupy' 'python-psycopg')
source=("$_repo/archive/refs/tags/${_name//langgraph-/}==$pkgver.tar.gz")
sha256sums=('d5899d4ee1eb76735cfebfa7b5d69a55d72f19ed6f70676f8b5eb974a17ec012')

build() {
    cd "$srcdir"/$_name-$pkgver/libs/${_name//langgraph-/}
    python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/$_name-$pkgver/libs/${_name//langgraph-/}
  LANGGRAPH_TEST_FAST=1 PYTHONPATH=$PWD:$PWD/../${_name//-prebuilt/} pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name-$pkgver/libs/${_name//langgraph-/}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
