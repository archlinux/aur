# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=smithy-core
pkgname=python-$_name
pkgver=0.6.0
pkgrel=1
pkgdesc='Core components for implementing Smithy tooling in Python.'
arch=('any')
_repo='https://github.com/smithy-lang/smithy-python'
url="$_repo/tree/develop/packages/smithy-core"
license=('Apache-2.0')
depends=('python')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel' 'git')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-freezegun')
optdepends=('python-typing_extensions: typing')
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
  )
  cd "$srcdir"/$_name/packages/$_name
  PYTHONPATH=$PWD/src pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name/packages/$_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}
