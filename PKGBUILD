# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=smithy-test
pkgname=python-$_name
pkgver=0.1.0
pkgrel=1
pkgdesc='Test-support helpers for generated Smithy clients.'
arch=('any')
_repo='https://github.com/smithy-lang/smithy-python'
url="$_repo/tree/develop/packages/smithy-test"
license=('Apache-2.0')
depends=('python')
makedepends=('python-hatchling'
             'python-build'
             'python-installer'
             'python-wheel'
             'git')
checkdepends=('python-pytest')
source=("$_name::git+$_repo.git#tag=$_name/v$pkgver")
sha256sums=('9355f1aed64cf1ea03806a76efc1c6c419d6caa2cf3733fa692153fb99e83abe')

build() {
  cd "$srcdir"/$_name/packages/$_name
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    --override-ini="addopts="
  )
  cd "$srcdir"/$_name/packages/$_name
  PYTHONPATH=$PWD/src pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name/packages/$_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}
