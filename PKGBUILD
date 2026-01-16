# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-checkpoint-sqlite
pkgname=python-$_name
pkgver=3.0.2
pkgrel=1
pkgdesc="Library with a SQLite implementation of LangGraph checkpoint saver."
arch=('any')
license=('MIT')
url="https://github.com/langchain-ai/langgraph/tree/main/libs/checkpoint-sqlite"
depends=('python' 'python-langgraph-checkpoint' 'python-aiosqlite' 'python-sqlite-vec')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-mock' 'python-pytest-rerunfailures')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('a34961c035944af0ee7af416f8f26fec25059b10387a69dcb13fc6cc59c30a25')

prepare() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  sed -i '/if not self.conn.is_alive():/{N;d;}' langgraph/checkpoint/sqlite/aio.py
}

build() {
    cd "$srcdir"/${_name//-/_}-$pkgver
    python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    -p "no:flaky"
  )
  cd "$srcdir"/${_name//-/_}-$pkgver
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
