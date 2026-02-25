# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-prebuilt
pkgname=python-$_name
pkgver=1.0.8
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
sha256sums=('374710e415ee2bc50f3e06a86a3441cb02b93ef5d7bef1e2fcf3b656fe97c088')

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
