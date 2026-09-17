# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=ag-ui-protocol
pkgname=python-$_name
pkgver=1.0.0
pkgrel=1
pkgdesc="Python SDK for the Agent-User Interaction (AG-UI) Protocol."
arch=('any')
_repo="https://github.com/ag-ui-protocol/ag-ui"
url="$_repo/tree/main/sdks/python"
license=('MIT')
depends=('python' 'python-pydantic')
makedepends=('python-uv-build' 'python-build' 'python-installer' 'python-wheel')
source=("$_repo/archive/refs/tags/$_name@$pkgver.tar.gz")
sha256sums=('9ba875dfceceb7887018456d43bc22df2c9768fcf6f5d459dbe628d9944a7e7b')

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
