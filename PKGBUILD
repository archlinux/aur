# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=spitch
pkgname=python-$_name
pkgver=1.50.0
pkgrel=1
pkgdesc='The official Python library for the spitch API.'
arch=('any')
url='https://github.com/spi-tch/spitch-python'
license=('Apache-2.0')
depends=('python' 'python-httpx' 'python-pydantic' 'python-typing_extensions' 'python-anyio' 'python-distro' 'python-sniffio')
makedepends=('python-hatchling' 'python-hatch-fancy-pypi-readme' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-respx' 'python-pytest' 'python-pytest-asyncio' 'python-time-machine' 'python-dirty-equals' 'python-rich' 'python-pytest-xdist' 'python-aiohttp' 'python-httpx-aiohttp' 'npm' 'nodejs')
optdepends=('python-aiohttp: aiohttp' 'python-httpx-aiohttp: aiohttp')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a860e9bd623090d16e51f1a4e41dcfbd04431baf1fe88b511091111828ef480c')

prepare(){
  cd "$srcdir"/$_name-python-$pkgver
  sed -i 's/from typing_extensions import Literal, Annotated/from typing_extensions import Literal, Annotated, TypeAliasType/g' tests/test_models.py
  sed -i 's/from openai import BaseModel/from spitch import BaseModel/g' src/spitch/_response.py
}

build() {
  cd "$srcdir"/$_name-python-$pkgver
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  export DEFER_PYDANTIC_BUILD=false
  local pytest_options=(
    -vv
    --disable-warnings
    -p 'no:benchmark'
    # Need to be fixed by developers
    --deselect tests/api_resources/test_speech.py
    --deselect tests/api_resources/test_files.py
    --deselect tests/api_resources/test_text.py
  )
  cd "$srcdir"/$_name-python-$pkgver
  trap 'pkill -f steady' EXIT
  ./scripts/mock --daemon
  PYTHONPATH=$PWD/src pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name-python-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
