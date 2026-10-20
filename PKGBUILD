# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=exa-py
pkgname=python-$_name
pkgver=2.26.0
pkgrel=1
pkgdesc="Python SDK for Exa API."
arch=('any')
url="https://github.com/exa-labs/exa-py"
license=('MIT')
depends=('python'
         'python-requests'
         'python-typing_extensions'
         'python-openai'
         'python-pydantic'
         'python-httpx'
         'python-httpcore'
         'python-dotenv')
makedepends=('python-poetry-core'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-pytest-asyncio'
              'python-pytest-mock')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7670171ab1a372e8de754f53234fbdaa0e838823bcb45a540e2dffbf4335f1e7')

prepare() {
  cd "$_name-$pkgver"
  # Python 3.14 moved warnings.deprecated's wrapper into _py_warnings
  sed -i 's/frozenset({"warnings", "typing_extensions"})/frozenset({"warnings", "_py_warnings", "typing_extensions"})/' exa_py/api_warnings.py
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    --override-ini="addopts="
    --asyncio-mode=auto
  )
  cd "$_name-$pkgver"
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
