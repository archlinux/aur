# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=groq
pkgname=python-${_name}
pkgver=0.28.0
_groq_groqapi_spec=ea5b03626ef6c5d62792b87e2bef9acff936112791abe056db5d0a7a66ba39d7
pkgrel=1
pkgdesc='The official Python library for the groq API.'
arch=('any')
url='https://github.com/groq/groq-python'
license=('Apache-2.0')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "https://storage.googleapis.com/stainless-sdk-openapi-specs/groqcloud/groqcloud-${_groq_groqapi_spec}.yml")
sha256sums=('a041adfb72c822d5e7e21e7804f1440690d76db16f74a1b1b95ff68e23125ef8'
            'ea5b03626ef6c5d62792b87e2bef9acff936112791abe056db5d0a7a66ba39d7')
depends=('python' 'python-httpx' 'python-pydantic' 'python-typing_extensions' 'python-anyio' 'python-distro' 'python-sniffio')
makedepends=('python-hatchling' 'python-hatch-fancy-pypi-readme' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-respx' 'python-pytest' 'python-pytest-asyncio' 'python-time-machine' 'python-dirty-equals' 'python-rich' 'python-nest-asyncio' 'npm' 'nodejs-lts-jod')

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
  ./scripts/mock --daemon "${srcdir}/groqcloud-${_groq_groqapi_spec}.yml"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name}-python-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
