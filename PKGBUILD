# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=smithy-http
pkgname=python-$_name
pkgver=0.5.0
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
sha256sums=('f54ff2760bfaa689abb5c73475e28b6171d3adceb6dc176a5fbbe75eb97e43d1')

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
