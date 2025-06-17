# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=google-cloud-texttospeech
pkgname=python-${_name}
pkgver=2.27.0
pkgrel=1
pkgdesc='Google Cloud Texttospeech API client library.'
url='https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-texttospeech'
arch=('any')
license=('Apache-2.0')
depends=('python' 'python-google-api-core' 'python-grpcio' 'python-grpcio-status' 'python-google-auth' 'python-proto-plus' 'python-protobuf')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('94a382c95b7cc58efd2505a24c2968e2614fc6bdf9d76fb9a819d4ed29ae188e')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # Need Google Project ID
    --deselect tests/system/smoke_test.py
  )
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
