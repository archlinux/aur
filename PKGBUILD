# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=smithy-http
pkgname=python-$_name
pkgver=0.4.2
pkgrel=1
pkgdesc='HTTP components for Smithy tooling.'
arch=('any')
_repo='https://github.com/smithy-lang/smithy-python'
url="$_repo/tree/develop/packages/smithy-http"
license=('Apache-2.0')
depends=('python' 'python-smithy-core')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel' 'git')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-freezegun' 'python-awscrt' 'python-yarl' 'python-smithy-json')
optdepends=('python-awscrt: awscrt' 'python-aiohttp: aiohttp' 'python-yarl: aiohttp')
source=("$_name::git+$_repo.git#tag=$_name/v$pkgver")
sha256sums=('76f4b6eecc4ae8e10a0ae5622e1f25d459f11bede40cdd191473dfe82279aa9c')

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
