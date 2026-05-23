# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-checkpoint
pkgname=python-$_name
pkgver=4.1.1
pkgrel=1
pkgdesc="Library with base interfaces for LangGraph checkpoint savers."
arch=('any')
url="https://github.com/langchain-ai/langgraph/tree/main/libs/checkpoint"
license=('MIT')
depends=('python' 'python-langchain-core' 'python-ormsgpack')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-mock' 'python-numpy' 'python-pandas' 'python-redis' 'python-pycryptodome' 'valkey')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('6c2bdb530c91f91d7d9c1bd100925d0fc4f498d418c17f3587d1526279482a25')

prepare(){
  cd "$srcdir"/${_name//-/_}-$pkgver
  sed -i '/import dataclasses_json/d' tests/test_jsonplus.py
  sed -i '/@dataclasses_json.dataclass_json/d' tests/test_jsonplus.py
}

build() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/${_name//-/_}-$pkgver
  trap 'pkill redis-server' EXIT
  (redis-server)&
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
