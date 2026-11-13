# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=smithy-xml
pkgname=python-$_name
pkgver=0.5.0
pkgrel=1
pkgdesc='XML serialization and deserialization support for Smithy tooling.'
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
              'python-smithy-test')
source=("$_name-$pkgver.tar.gz::$_repo/archive/refs/tags/$_name/v$pkgver.tar.gz")
sha256sums=('6bf6f124b5723e453fd4ee728db6d65a1f00c69b76040ae079a9b56e314c73dd')

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
