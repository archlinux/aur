# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-prebuilt
pkgname=python-$_name
pkgver=1.0.7
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
sha256sums=('5b6f7f06254524ce0334e0c538ad6c7b6f72057c94bea1606b378f4e6685c0ca')

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
