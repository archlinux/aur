# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=aioboto3
pkgname=python-$_name
pkgver=15.5.0
pkgrel=3
pkgdesc='Async boto3 wrapper.'
arch=('any')
url='https://github.com/terricain/aioboto3'
license=('Apache-2.0')
depends=('python' 'python-aiobotocore' 'python-boto3' 'python-aiofiles')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-dill' 'python-requests' 'python-moto' 'python-antlr4' 'python-joserfc' 'python-jsonpath-ng' 'python-docker' 'python-graphql-core' 'python-pyyaml' 'python-cfn-lint' 'python-openapi-spec-validator' 'python-pyparsing' 'python-py-partiql-parser' 'python-aws-xray-sdk' 'python-setuptools' 'python-flask' 'python-flask-cors' 'python-chalice' 'python-pytest-asyncio')
optdepends=('python-cryptography: s3cse' 'chalice: chalice')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "https://github.com/terricain/aioboto3/pull/401.patch")
sha256sums=('ea8d8787d315594842fbfcf2c4dce3bac2ad61be275bc8584b2ce9a3402a6979'
            'a09b0fde7bdd4d2bc66793534e111666cedd003cf63247f58792713d8e431f2b')

prepare(){
  cd "$srcdir"/$_name-$pkgver
  patch -Np1 -i ../401.patch
  sed -i "s/'b110781f5a5d148dd1d614e7611650a16cbea372'/'b110781f5a5d148dd1d614e7611650a16cbea372', '9ef5dc35e477a8f289ca3c2e54dd8d9950ee940e'/g" tests/test_patches.py
  sed -i "s/'534f68820a410ba41072026994badca7f66fe1b9'/'534f68820a410ba41072026994badca7f66fe1b9', 'fb799c953ab7d41877439e5f0a64c7fbae68ad37'/g" tests/test_patches.py
}

build() {
  cd "$srcdir"/$_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/$_name-$pkgver
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
