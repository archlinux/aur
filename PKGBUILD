# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pythonfinder
pkgname=python-pythonfinder
pkgver=2.0.0
pkgrel=2
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
sha512sums=('341058947d8bf1f71a60ca48e2da67a5fbf5a920cc00fc875fa5fe6b966fffc8ae81d5031fe08da69248ea8d6f75063c9c67069839235be2bf2dce87454dd20a')
b2sums=('2b7666a2796a3f7b364f63b22a7e98b05abe01877d42e6dab2b99b1b545aa33f1ecb096d8585d7f8459d67d889821ba07f3d2f4be237766063581d704c88803e')

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
