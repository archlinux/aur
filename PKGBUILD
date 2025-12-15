# Maintainer: David Runge <dvzrv@archlinux.org>

_name=click-repl
pkgname=python-click-repl
pkgver=0.3.0
pkgrel=4
pkgdesc="Subcommand REPL for click apps"
arch=(any)
url="https://github.com/click-contrib/click-repl"
license=(MIT)
depends=(
  python
  python-click
  python-prompt_toolkit
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=($pkgname-$pkgver.tar.gz::https://github.com/click-contrib/$_name/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('4135cfd4a0b041d9e6446b4c938bb5863d851703f47f204cd78fc9e5ae6b7fd71215abbf08863d9a5cdb664f92df5fca2380a6efa7ddeb67dd6c9b1d4f210f65')
b2sums=('90b97c0e24e40c63770ee9c14fbcca2b8ac2c743ed62b46fce582ad9416c1c645af9e3d43499f488e4c6344f735d8b3c14f1119759e893af7250817992bf61d8')

prepare() {
  # we are not interested in coverage
  sed -e '/--cov/d' -i $_name-$pkgver/pyproject.toml
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
