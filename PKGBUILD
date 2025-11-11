# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph
pkgname=python-$_name
pkgver=1.0.3
pkgrel=1
pkgdesc="Building stateful, multi-actor applications with LLMs."
arch=('any')
url="https://github.com/langchain-ai/langgraph/tree/main/libs/langgraph"
license=('MIT')
depends=('python' 'python-langchain-core' 'python-langgraph-checkpoint' 'python-langgraph-sdk' 'python-langgraph-prebuilt' 'python-xxhash' 'python-pydantic')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-mock' 'python-syrupy' 'python-httpx' 'python-pytest-xdist' 'python-psutil' 'python-pytest-repeat' 'python-langgraph-checkpoint-sqlite' 'python-langgraph-checkpoint-postgres' 'python-psycopg' 'python-pycryptodome' 'python-langgraph-cli' 'python-langgraph-runtime-inmem' 'python-redis')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('873a6aae6be054ef52a05c463be363a46da9711405b1b14454d595f543b68335')

build() {
    cd "$srcdir"/$_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # Need to update snapshots
    --deselect tests/test_large_cases.py::test_prebuilt_tool_chat
    --deselect tests/test_large_cases.py::test_message_graph[memory]
  )
  cd "$srcdir"/$_name-$pkgver
  NO_DOCKER=true PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
