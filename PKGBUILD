# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=smithy-test
pkgname=python-$_name
pkgver=0.3.0
pkgrel=1
pkgdesc='Test-support helpers for generated Smithy clients.'
arch=('any')
_repo='https://github.com/smithy-lang/smithy-python'
url="$_repo/tree/develop/packages/$_name"
license=('Apache-2.0')
depends=('python'
         'python-smithy-core'
         'python-smithy-http'
         'python-smithy-aws-core')
makedepends=('python-hatchling'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-pytest-asyncio'
              'python-aiohttp'
              'python-yarl'
              'python-smithy-cbor'
              'python-urllib3'
              'python-smithy-aws-event-stream'
              'python-smithy-json')
source=("$_name-$pkgver.tar.gz::$_repo/archive/refs/tags/$_name/v$pkgver.tar.gz")
sha256sums=('900dafa088bec1f931d787063f94dd71b53f50a5933275bc1de53b89d3a7713f')

build() {
  cd "smithy-python-$_name-v$pkgver/packages/$_name"
  python -m build --wheel --no-isolation
  python -m build --wheel --no-isolation ../../codegen-output/rest-json-1
  python -m build --wheel --no-isolation ../../codegen-output/my-handwritten-model
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    --override-ini="addopts="
    --import-mode=importlib
  )
  cd "smithy-python-$_name-v$pkgver/packages/$_name"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m installer ../../codegen-output/rest-json-1/dist/*.whl
  test-env/bin/python -m installer ../../codegen-output/my-handwritten-model/dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "smithy-python-$_name-v$pkgver/packages/$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
