# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pythonfinder
pkgname=python-pythonfinder
pkgver=2.0.3
pkgrel=1
pkgdesc="Cross Platform Search Tool for Finding Pythons"
arch=(any)
url="https://github.com/sarugaku/pythonfinder"
license=(MIT)
depends=(
  python
  python-cached-property
  python-packaging
  python-pydantic
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  git
  python-click
  python-pytest
)
optdepends=('python-click: for CLI')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('4997ccaca04e2fd05497d6161f865501eec932598d9a2b46c4387ae8079ad88c73d10563244f956bf416e61a01cbd31cdbc3b0b48fdba351e2541439d8b3bfc4')
b2sums=('3615be98c8ca0ab5d91dfed16dc56dc226e365628fc65d6532b4c475f5c55a5c0414f637d8909ba82e10de20bc7230178d15e23d9d4bc03ffbb2831e1441a548')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv -c /dev/null
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGELOG,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
