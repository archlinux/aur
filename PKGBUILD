# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=google-cloud-speech
pkgname=python-${_name}
pkgver=2.33.0
pkgrel=1
pkgdesc='Google Cloud Speech API client library.'
arch=('any')
url='https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-speech'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('fd08511b5124fdaa768d71a4054e84a5d8eb02531cb6f84f311c0387ea1314ed')
depends=('python' 'python-google-api-core' 'python-grpcio' 'python-grpcio-status' 'python-google-auth' 'python-proto-plus' 'python-protobuf')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # Need Google Project ID
    --deselect "tests/system/smoke_test.py"
  )
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
