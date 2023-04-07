# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-helpers-namespace
pkgname=python-pytest-helpers-namespace
pkgver=2021.12.29
_commit=f5c519bfd65815cef78ea31fca390e662801b617  # refs/tags/v2021.12.29^{}
pkgrel=3
pkgdesc="PyTest Helpers Namespace"
arch=(any)
url="https://github.com/saltstack/pytest-helpers-namespace"
license=(Apache)
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
source=(git+$url#commit=$_commit?signed)
sha512sums=('SKIP')
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
