# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=google-cloud-speech
pkgname=python-${_name}
pkgver=2.32.0
pkgrel=1
pkgdesc='Google Cloud Speech API client library.'
arch=('any')
url='https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-speech'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('89c2618b131d310c6c00e7c04d290ffa9a5d68c20191030766a7737850f04e77')
depends=('python>=3.7' 'python-google-api-core' 'python-grpcio' 'python-grpcio-status' 'python-google-auth' 'python-proto-plus' 'python-protobuf')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-google-api-core' 'python-google-auth' 'python-proto-plus' 'python-protobuf')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --dist=loadgroup
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
  python setup.py install --root="${pkgdir}" --optimize=1
}
