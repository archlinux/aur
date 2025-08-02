# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=spitch
pkgname=python-${_name}
pkgver=1.31.0
_spitch_spitchapi_spec=2ca8a3d6f0d988607088830c0c3c88f809e33f08be53e386d4febf6c5b1c9f73
pkgrel=1
pkgdesc='The official Python library for the spitch API.'
arch=('any')
url='https://github.com/spi-tch/spitch-python'
license=('Apache-2.0')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "https://storage.googleapis.com/stainless-sdk-openapi-specs/babs-technologies/${_name}-${_spitch_spitchapi_spec}.yml")
sha256sums=('929669d2c8a7340149a1e7138027725f9c356e5f251bb1a73ee87275176cc6ae'
            '2ca8a3d6f0d988607088830c0c3c88f809e33f08be53e386d4febf6c5b1c9f73')
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
    # Need to be fixed by developer
    --deselect tests/api_resources/test_speech.py
    --deselect tests/api_resources/test_text.py
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
