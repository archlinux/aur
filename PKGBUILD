# Maintainer: David Runge <dvzrv@archlinux.org>

_name=piccata
pkgname=python-piccata
_commit=7396f4e0f181bfe690f8b9de7c8cd41b44856a0b
pkgver=2.0.1
pkgrel=1
pkgdesc="A simple CoAP (RFC7252) toolkit"
arch=(any)
url="https://github.com/NordicSemiconductor/piccata"
license=(custom)
depends=(python)
makedepends=(git python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
# NOTE: 2.0.1 is not available as tag and there is no sdist tarball:
# https://github.com/NordicSemiconductor/piccata/issues/11
# source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
source=(git+https://github.com/NordicSemiconductor/piccata#commit=$_commit)
sha256sums=('SKIP')

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

check() {
  local _deselected=(
    # https://github.com/NordicSemiconductor/piccata/issues/12
    --deselect tests/test_message_option.py::TestUintOption::test_decode
  )
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv "${_deselected[@]}"
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
