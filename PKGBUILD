# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=smithy-http
pkgname=python-$_name
pkgver=0.4.4
pkgrel=1
pkgdesc='HTTP components for Smithy tooling.'
arch=('any')
_repo='https://github.com/smithy-lang/smithy-python'
url="$_repo/tree/develop/packages/smithy-http"
license=('Apache-2.0')
depends=('python' 'python-smithy-core')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel' 'git')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-freezegun' 'python-awscrt' 'python-yarl' 'python-smithy-json' 'python-aiohttp')
optdepends=('python-awscrt: awscrt' 'python-aiohttp: aiohttp' 'python-yarl: aiohttp')
source=("$_name::git+$_repo.git#tag=$_name/v$pkgver")
sha256sums=('9b25347df3c7021005c8e046a816be5649d5abbafc4734275f3c4174bc290d59')

build() {
  cd "$srcdir"/$_name/packages/$_name
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    --override-ini="addopts="
    --import-mode=importlib
  )
  cd "$srcdir"/$_name/packages/$_name
  PYTHONPATH=$PWD/src pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name/packages/$_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}
