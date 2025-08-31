# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=aioboto3
pkgname=python-$_name
pkgver=15.1.0
pkgrel=1
pkgdesc='Async boto3 wrapper.'
arch=('any')
url='https://github.com/terricain/aioboto3'
license=('Apache-2.0')
depends=('python' 'python-aiobotocore' 'python-boto3' 'python-aiofiles')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-dill' 'python-pygithub' 'python-requests' 'python-moto' 'python-antlr4' 'python-joserfc' 'python-jsonpath-ng' 'python-docker' 'python-graphql-core' 'python-pyyaml' 'python-cfn-lint' 'python-openapi-spec-validator' 'python-pyparsing' 'python-py-partiql-parser' 'python-aws-xray-sdk' 'python-flask' 'python-flask-cors' 'chalice' 'python-pytest-asyncio')
optdepends=('python-cryptography: s3cse' 'chalice: chalice')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        'https://github.com/terricain/aioboto3/pull/377.patch')
sha256sums=('37763bbc6321ceb479106dc63bc84c8fdb59dd02540034a12941aebef2057c5c'
            '2ae48fac21eda84393914fa814c9c80a30656ac67a600b093387eeea92344958')

prepare(){
  cd "$srcdir"/$_name-$pkgver
  patch -Np1 -i "$srcdir"/377.patch
  sed -i "s/039bdfe7082256a3bffe3492fc6d84f1480fbd6a/3f494c3eb0987251cae373873499e917f264571b/" tests/test_patches.py
}

build() {
  cd "$srcdir"/$_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  cd "$srcdir"/$_name-$pkgver
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
