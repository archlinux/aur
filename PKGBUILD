# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-pytest-helpers-namespace
_name="${pkgname#python-}"
pkgver=2021.12.29
pkgrel=4
pkgdesc="PyTest Helpers Namespace"
arch=(any)
url="https://github.com/saltstack/pytest-helpers-namespace"
license=(Apache-2.0)
depends=(
  python
  python-setuptools
  python-pytest
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools-declarative-requirements
  python-setuptools-scm
  python-toml
  python-wheel
)
checkdepends=(python-pytest)
source=(git+$url?signed#tag=v$pkgver)
sha512sums=('aa693512ab60cd57f06631f931d5907a6088b74905f1f27977883ea9879e746fdaae683affc54fdc2d84102dbe6dafb390a892d879c80575566abbc6fcd9d24b')
validpgpkeys=('D2908FB3A823B0FAB3BD21F5BB36BF6584A298FF') # Pedro Algarvio (s0undt3ch) <pedro@algarvio.me>

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
  pytest -vv
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {AUTHORS,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
