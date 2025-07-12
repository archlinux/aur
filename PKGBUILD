# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=groq
pkgname=python-${_name}
pkgver=0.30.0
_groq_groqapi_spec=f687d041a4a85f21b5f6a9fe6592ca87a031aeae448c535bad1bee61114f7818
pkgrel=1
pkgdesc='The official Python library for the groq API.'
arch=('any')
url='https://github.com/groq/groq-python'
license=('Apache-2.0')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "https://storage.googleapis.com/stainless-sdk-openapi-specs/groqcloud/groqcloud-${_groq_groqapi_spec}.yml")
sha256sums=('5897521137bcf9cfa4e1bfb13544701296461a5651a8d60d2db69a0da7d3b61c'
            'f687d041a4a85f21b5f6a9fe6592ca87a031aeae448c535bad1bee61114f7818')
depends=('python' 'python-httpx' 'python-pydantic' 'python-typing_extensions' 'python-anyio' 'python-distro' 'python-sniffio')
makedepends=('python-hatchling' 'python-hatch-fancy-pypi-readme' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-respx' 'python-pytest' 'python-pytest-asyncio' 'python-time-machine' 'python-dirty-equals' 'python-rich' 'python-nest-asyncio' 'python-pytest-xdist' 'python-aiohttp' 'python-httpx-aiohttp' 'npm' 'nodejs-lts-jod')
optdepends=('python-aiohttp: aiohttp' 'python-httpx-aiohttp: aiohttp')

build() {
  cd "${srcdir}"/${_name}-python-${pkgver}
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  export DEFER_PYDANTIC_BUILD=false
  local pytest_options=(
    -vv
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
