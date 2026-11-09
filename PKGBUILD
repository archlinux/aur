# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=smithy-aws-core
pkgname=python-$_name
pkgver=0.13.0
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
              'python-smithy-checksums'
              'python-smithy-aws-event-stream'
              'python-smithy-json'
              'python-smithy-xml')
optdepends=('python-smithy-checksums: checksums'

            'python-smithy-aws-event-stream: eventstream'

            'python-smithy-json: json'

            'python-smithy-xml: xml')
source=("$_name-$pkgver.tar.gz::$_repo/archive/refs/tags/$_name/v$pkgver.tar.gz")
sha256sums=('0cd96c83945a2642899c066e48a803edf26edb76c7b38e63e97f2923153851a7')

build() {
  cd "smithy-python-$_name-v$pkgver/packages/$_name"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    --override-ini="addopts="
  )
  cd "smithy-python-$_name-v$pkgver/packages/$_name"
  PYTHONPATH=$PWD/src pytest "${pytest_options[@]}" tests
}

package() {
  cd "smithy-python-$_name-v$pkgver/packages/$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
