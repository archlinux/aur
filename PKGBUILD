# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-checkpoint-sqlite
pkgname=python-$_name
pkgver=3.1.3
pkgrel=1
pkgdesc="Library with a SQLite implementation of LangGraph checkpoint saver."
arch=('any')
_repo='https://github.com/langchain-ai/langgraph'
url="$_repo/tree/main/libs/checkpoint-sqlite"
license=('MIT')
depends=('python'
         'python-langgraph-checkpoint'
         'python-aiosqlite'
         'python-sqlite-vec')
makedepends=('python-hatchling'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-pytest-asyncio'
              'python-pytest-mock'
              'python-pytest-retry')
source=("$_name-$pkgver.tar.gz::$_repo/archive/refs/tags/checkpointsqlite==$pkgver.tar.gz")
sha256sums=('8f2901485a09217d83f82675afe4c1aacb1b4650bf6b8569ae6fab4280f60d76')

build() {
  cd "langgraph-checkpointsqlite-$pkgver/libs/checkpoint-sqlite"
  python -m build --wheel --no-isolation
  cd "$srcdir"/langgraph-checkpointsqlite-$pkgver/libs/checkpoint-conformance
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    -p "no:flaky"
  )
  cd "langgraph-checkpointsqlite-$pkgver/libs/checkpoint-sqlite"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m installer "$srcdir"/langgraph-checkpointsqlite-$pkgver/libs/checkpoint-conformance/dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "langgraph-checkpointsqlite-$pkgver/libs/checkpoint-sqlite"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
