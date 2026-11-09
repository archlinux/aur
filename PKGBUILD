# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=smithy-http
pkgname=python-$_name
pkgver=0.7.0
pkgrel=1
pkgdesc='HTTP components for Smithy tooling.'
arch=('any')
_repo='https://github.com/smithy-lang/smithy-python'
url="$_repo/tree/develop/packages/$_name"
license=('Apache-2.0')
depends=('python'
         'python-smithy-core')
makedepends=('python-hatchling'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-pytest-asyncio'
              'python-freezegun'
              'python-awscrt'
              'python-smithy-cbor'
              'python-aiohttp'
              'python-yarl'
              'python-urllib3'
              'python-smithy-json'
              'python-smithy-aws-event-stream')
optdepends=('python-awscrt: awscrt'

            'python-smithy-cbor: cbor'

            'python-aiohttp: aiohttp'
            'python-yarl: aiohttp'

            'python-urllib3: urllib3')
source=("$_name-$pkgver.tar.gz::$_repo/archive/refs/tags/$_name/v$pkgver.tar.gz")
sha256sums=('78f5ade1ae0b61251eaa1892cde578ef211361a08914af9f8b2f14c240841437')

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
