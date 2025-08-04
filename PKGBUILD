# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=spitch
pkgname=python-${_name}
pkgver=1.33.0
_spitch_spitchapi_spec=620c502208147d650a4a7ec01e13078344fe6f96ec26f1cb334d7f4ce12f1dce
pkgrel=1
pkgdesc='The official Python library for the spitch API.'
arch=('any')
url='https://github.com/spi-tch/spitch-python'
license=('Apache-2.0')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "https://storage.googleapis.com/stainless-sdk-openapi-specs/babs-technologies/${_name}-${_spitch_spitchapi_spec}.yml")
sha256sums=('d72e9d428fc840d06f8240e19b1e9d9713189dd6a9728ca14b0624192a90b93e'
            '620c502208147d650a4a7ec01e13078344fe6f96ec26f1cb334d7f4ce12f1dce')
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
