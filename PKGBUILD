# Maintainer: Kyle Laker <kyle+aur@laker.email>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=chalice
pkgname=python-$_name
pkgver=1.34.0
pkgrel=1
pkgdesc='Python Serverless Microframework for AWS.'
arch=('any')
url='https://github.com/aws/chalice'
license=('Apache-2.0')
depends=('python'
         'python-click'
         'python-botocore'
         'python-six'
         'python-pip'
         'python-jmespath'
         'python-pyyaml'
         'python-inquirer'
         'python-wheel'
         'python-setuptools')
makedepends=('python-setuptools'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-boto3'
              'python-hypothesis'
              'python-websocket-client'
              'python-requests')
optdepends=('python-watchdog: event-file-poller'

            'python-aws-cdk.aws-iam: cdk'
            'python-aws-cdk.aws-s3-assets: cdk'
            'python-aws-cdk.cloudformation-include: cdk'
            'python-aws-cdk.core: cdk'

            'python-aws-cdk-lib: cdkv2')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c42608b830979db045cb91baef41c7d963d56b32d0d5a4eeee4db4ab8bb0422b')

prepare() {
  cd "$_name-$pkgver"
  # Newer botocore validates that the event source mapping UUID is at least 36 characters long
  sed -i -e "s/'my-uuid'/'00000000-0000-0000-0000-000000000000'/g" -e "s/'uuid-12345'/'00000000-0000-0000-0000-000000012345'/g" tests/functional/test_awsclient.py
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    --deselect tests/aws/test_features.py
    --deselect tests/aws/test_websockets.py::test_websocket_redployment_does_not_lose_messages
  )
  cd "$_name-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  PATH=$PWD/test-env/bin:$PATH CHALICE_TEST_EXTENDED_PACKAGING=true test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
