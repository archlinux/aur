# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=amazon-transcribe-streaming-sdk
pkgname=python-${_name//-streaming-sdk/}
pkgver=0.6.4
pkgrel=1
pkgdesc='Async Python SDK for Amazon Transcribe Streaming.'
arch=('any')
url='https://github.com/awslabs/amazon-transcribe-streaming-sdk'
license=('Apache-2.0')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a83cf74ec58f49d85b35069d682de28873684f4461adef8108f72f2eb3b624a3')
depends=('python' 'python-awscrt')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-cov')

build() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # Need AWS API
    --deselect tests/integration/test_client.py
    --deselect tests/integration/test_handlers.py
  )
  cd "${srcdir}"/${_name}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
