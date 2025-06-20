# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=aioboto3
pkgname=python-${_name}
pkgver=14.3.0
pkgrel=1
pkgdesc='Async boto3 wrapper.'
arch=('any')
url='https://github.com/terricain/aioboto3'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('1d18f88bb56835c607b62bb6cb907754d717bedde3ddfff6935727cb48a80135')
depends=('python' 'python-aiobotocore' 'python-boto3' 'python-aiofiles')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-dill' 'python-pygithub' 'python-requests' 'python-moto' 'python-antlr4' 'python-joserfc' 'python-jsonpath-ng' 'python-docker' 'python-graphql-core' 'python-pyyaml' 'python-cfn-lint' 'python-openapi-spec-validator' 'python-pyparsing' 'python-py-partiql-parser' 'python-aws-xray-sdk' 'python-flask' 'python-flask-cors' 'chalice' 'python-pytest-asyncio')
optdepends=('python-cryptography: s3cse' 'chalice: chalice')

build() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --deselect tests/test_patches.py::test_patches
  )
  cd "${srcdir}"/${_name}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  ln -sf /usr/bin/ruff test-env/bin/ruff
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
