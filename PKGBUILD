# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=ag-ui-protocol
pkgname=python-$_name
pkgver=0.1.18
pkgrel=2
pkgdesc="Python SDK for the Agent-User Interaction (AG-UI) Protocol."
arch=('any')
license=('MIT')
_repo="https://github.com/ag-ui-protocol/ag-ui"
url="$_repo/tree/main/sdks/python"
depends=('python' 'python-pydantic')
makedepends=('python-uv-build' 'python-build' 'python-installer' 'python-wheel')
source=("$_repo/archive/refs/tags/$_name@$pkgver.tar.gz")
sha256sums=('bb4d5233d0a187c5d0f2aab188a9c68a762b18e0a98d6369cd1800fb508e42b0')

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
