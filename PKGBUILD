# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pythonfinder
pkgname=python-pythonfinder
pkgver=1.3.1
pkgrel=1
pkgdesc="Cross Platform Search Tool for Finding Pythons"
arch=(any)
url="https://github.com/sarugaku/pythonfinder"
license=(MIT)
depends=(python-attrs python-cached-property python-packaging)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(git python-click python-pytest)
optdepends=('python-click: for CLI')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('d1bc1dcf66b2052a547f4c5476149232249d33af1184b3e5188ff5d535912ce32653616b28961fdced6870fb086c05d32ef1f896cfa0b3babeb86b030429cbeb')
b2sums=('067e5669d95907cc9b8cdd50d539838b9e56c65f83237f2dd6b7569b15f67e6e9c2513c9a1e87b139ce718be89e4587f8ef752098aa596d9a87e16a3875cc76a')

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
  # disable tests that rely on git cloning: https://github.com/sarugaku/pythonfinder/issues/116
  pytest -vv -c /dev/null -k "not test_shims_are_kept and not test_shims_are_removed"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGELOG,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
