# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=spitch
pkgname=python-${_name}
pkgver=1.27.0
_spitch_spitchapi_spec=d71f3e71d5b7d15308374483c55c2591c555b5d28d4c73c1667dc15121a36e2a
pkgrel=1
pkgdesc='The official Python library for the spitch API.'
arch=('any')
url='https://github.com/spi-tch/spitch-python'
license=('Apache-2.0')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "https://storage.googleapis.com/stainless-sdk-openapi-specs/babs-technologies/${_name}-${_spitch_spitchapi_spec}.yml")
sha256sums=('9dc6fc4610261ba52e4c71a33ba607982b90675cb7f42d3651427579941b3473'
            'd71f3e71d5b7d15308374483c55c2591c555b5d28d4c73c1667dc15121a36e2a')
depends=('python' 'python-httpx' 'python-pydantic' 'python-typing_extensions' 'python-anyio' 'python-distro' 'python-sniffio')
makedepends=('python-hatchling' 'python-hatch-fancy-pypi-readme' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-respx' 'python-pytest' 'python-pytest-asyncio' 'python-time-machine' 'python-dirty-equals' 'python-rich' 'python-nest-asyncio' 'python-pytest-xdist' 'npm' 'nodejs-lts-jod')

prepare(){
  cd "${srcdir}"/${_name}-python-${pkgver}
  sed -i 's/from typing_extensions import Literal, Annotated/from typing_extensions import Literal, Annotated, TypeAliasType/g' tests/test_models.py
  sed -i 's/from openai import BaseModel/from spitch import BaseModel/g' src/spitch/_response.py
}

build() {
  cd "${srcdir}"/${_name}-python-${pkgver}
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  export DEFER_PYDANTIC_BUILD=false
  local pytest_options=(
    -vv
    -k "not test_copy_build_request"
  )
  cd "${srcdir}"/${_name}-python-${pkgver}
  trap 'pkill "npm exec prism"' EXIT
  ./scripts/mock --daemon "${srcdir}/${_name}-${_spitch_spitchapi_spec}.yml"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name}-python-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
