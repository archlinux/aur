# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=smithy-aws-core
pkgname=python-$_name
pkgver=0.15.0
pkgrel=1
pkgdesc='Core Smithy components for AWS services and protocols.'
arch=('any')
_repo='https://github.com/smithy-lang/smithy-python'
url="$_repo/tree/develop/packages/smithy-aws-core"
license=('Apache-2.0')
depends=('python'
         'python-smithy-core'
         'python-smithy-http'
         'python-aws-sdk-signers')
makedepends=('python-hatchling'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-pytest-asyncio'
              'python-freezegun'
              'python-smithy-aws-checksums'
              'python-smithy-aws-event-stream'
              'python-smithy-json'
              'python-smithy-xml'
              'python-smithy-cbor')
optdepends=('python-smithy-aws-checksums: checksums'

            'python-smithy-aws-event-stream: eventstream'

            'python-smithy-json: json'

            'python-smithy-xml: xml')
source=("$_name-$pkgver.tar.gz::$_repo/archive/refs/tags/$_name/v$pkgver.tar.gz")
sha256sums=('181065de4049425ffd3c4c541055d2cee27778dfaf47fa81869197983f410787')

build() {
  cd "smithy-python-$_name-v$pkgver/packages/$_name"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    --override-ini="addopts="
    --import-mode=importlib
  )
  cd "smithy-python-$_name-v$pkgver/packages/$_name"
  PYTHONPATH=$PWD/src pytest "${pytest_options[@]}" tests
}

package() {
  cd "smithy-python-$_name-v$pkgver/packages/$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
