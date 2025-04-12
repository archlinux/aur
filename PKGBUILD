# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=groq
pkgname=python-${_name}
pkgver=0.22.0
_groq_groqapi_spec=8d531e091886f4bb814247a78a6323f6f12351881269a4e8cf68223b9245c64f
pkgrel=1
pkgdesc='The official Python library for the groq API.'
arch=('any')
url='https://github.com/groq/groq-python'
license=('Apache-2.0')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "https://storage.googleapis.com/stainless-sdk-openapi-specs/groqcloud%2Fgroqcloud-${_groq_groqapi_spec}.yml")
sha256sums=('4bc8c7270a6c72bb6d93c08e72eb5c2cecf9a543109c3752d6b5bfee9ebf8b22'
            '8d531e091886f4bb814247a78a6323f6f12351881269a4e8cf68223b9245c64f')
depends=('python>=3.8' 'python-httpx' 'python-pydantic' 'python-typing_extensions' 'python-anyio' 'python-distro' 'python-sniffio')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-respx' 'python-pytest' 'python-pytest-asyncio' 'python-time-machine' 'python-dirty-equals' 'python-rich' 'python-nest-asyncio' 'npm')

build() {
  cd "${srcdir}"/${_name}-python-${pkgver}
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  local pytest_options=(
    -vv
    --override-ini="addopts="
    --deselect tests/test_client.py::TestGroq::test_copy_build_request
    --deselect tests/test_client.py::TestAsyncGroq::test_copy_build_request
  )
  cd "${srcdir}"/${_name}-python-${pkgver}
  trap 'pkill "npm exec prism"' EXIT
  ./scripts/mock --daemon "${srcdir}/groqcloud_groqcloud-${_groq_groqapi_spec}.yml"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name}-python-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
