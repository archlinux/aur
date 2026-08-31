# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=ag-ui-protocol
pkgname=python-$_name
pkgver=0.1.22
pkgrel=1
pkgdesc="Python SDK for the Agent-User Interaction (AG-UI) Protocol."
arch=('any')
_repo="https://github.com/ag-ui-protocol/ag-ui"
url="$_repo/tree/main/sdks/python"
license=('MIT')
depends=('python' 'python-pydantic')
makedepends=('python-uv-build' 'python-build' 'python-installer' 'python-wheel')
source=("$_repo/archive/refs/tags/$_name@$pkgver.tar.gz")
sha256sums=('4c5c83427fae01021b2c9ba9d1e4426bb0044498f638bf9c90cac0d32c280614')

prepare() {
  # Fix build
  cd "$srcdir"/${_name//-protocol/}-$_name-$pkgver/sdks/python
  sed -i 's/uv_build>=0.8.0,<0.9/uv_build/g' pyproject.toml
}

build() {
  cd "$srcdir"/${_name//-protocol/}-$_name-$pkgver/sdks/python
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  cd "$srcdir"/${_name//-protocol/}-$_name-$pkgver/sdks/python
  python -m unittest discover "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/${_name//-protocol/}-$_name-$pkgver/sdks/python
  python -m installer --destdir="$pkgdir" dist/*.whl
}
