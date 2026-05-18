# Maintainer: Kyle Laker <kyle+aur@laker.email>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=chalice
pkgname=python-$_name
pkgver=1.33.0
pkgrel=1
pkgdesc='Python Serverless Microframework for AWS.'
arch=('any')
url='https://github.com/aws/chalice'
license=('Apache-2.0')
depends=('python' 'python-click' 'python-botocore' 'python-six' 'python-pip' 'python-jmespath' 'python-pyyaml' 'python-inquirer' 'python-wheel' 'python-setuptools')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-boto3' 'python-hypothesis' 'python-websocket-client' 'python-requests')
optdepends=('python-watchdog: event-file-poller' 'python-aws-cdk.aws-iam: cdk' 'python-aws-cdk.aws-s3-assets: cdk' 'python-aws-cdk.cloudformation-include: cdk' 'python-aws-cdk.core: cdk' 'python-aws-cdk-lib: cdkv2')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c62471a790b161e4eedaa28416a313b7f034b09367637d98f552d2e66ba2c3fd')

build() {
  cd "$srcdir"/$_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    # Need AWS API
    --deselect tests/aws/test_features.py
    --deselect tests/aws/test_websockets.py::test_websocket_redployment_does_not_lose_messages
  )
  cd "$srcdir"/$_name-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  PATH=$PWD/test-env/bin:$PATH CHALICE_TEST_EXTENDED_PACKAGING=true test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
