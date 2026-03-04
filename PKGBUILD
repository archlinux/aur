# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=spitch
pkgname=python-$_name
pkgver=1.47.0
pkgrel=1
pkgdesc='The official Python library for the spitch API.'
arch=('any')
url='https://github.com/spi-tch/spitch-python'
license=('Apache-2.0')
depends=('python' 'python-httpx' 'python-pydantic' 'python-typing_extensions' 'python-anyio' 'python-distro' 'python-sniffio')
makedepends=('python-hatchling' 'python-hatch-fancy-pypi-readme' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-respx' 'python-pytest' 'python-pytest-asyncio' 'python-time-machine' 'python-dirty-equals' 'python-rich' 'python-pytest-xdist' 'npm' 'nodejs')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('97a483cde780f876ace9edb39833abdd6d2c78ae947992f29a18004f5472e46c')

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
    -k "not test_parse_retry_after_header"
  )
  cd "$srcdir"/$_name-python-$pkgver
  trap 'pkill "npm exec prism"' EXIT
  ./scripts/mock --daemon
  PYTHONPATH=$PWD/src pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name-python-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
